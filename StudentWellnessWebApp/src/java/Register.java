import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(urlPatterns = {"/Register"})
public class Register extends HttpServlet {

    /**
     * Handles user registration.
     * Validates duplicate student numbers or emails.
     * Stores user data in the PostgreSQL database.
     * Redirects with success or error messages.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String studentNumber = request.getParameter("student_number");
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        try {
            // Load PostgreSQL JDBC driver
            Class.forName("org.postgresql.Driver");

            // Establish database connection
            Connection conn = DriverManager.getConnection(
                "jdbc:postgresql://localhost:5432/wellness_db", "wellness_user", "wellness123");

            // Check if student number or email already exists
            String checkSql = "SELECT * FROM users WHERE email = ? OR student_number = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkSql);
            checkStmt.setString(1, email);
            checkStmt.setString(2, studentNumber);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                // Redirect back with error if duplicate found
                response.sendRedirect("register.jsp?error=Email or Student Number already exists");
            } else {
                // Insert new user into database
                String insertSql = "INSERT INTO users (student_number, name, surname, email, phone, password) VALUES (?, ?, ?, ?, ?, ?)";
                PreparedStatement insertStmt = conn.prepareStatement(insertSql);
                insertStmt.setString(1, studentNumber);
                insertStmt.setString(2, name);
                insertStmt.setString(3, surname);
                insertStmt.setString(4, email);
                insertStmt.setString(5, phone);
                insertStmt.setString(6, password); // Note: For demo purposes; should be hashed in production
                insertStmt.executeUpdate();
                insertStmt.close();

                // Redirect with success message
                response.sendRedirect("register.jsp?msg=Registration successful! You can now log in.");
            }

            // Clean up
            rs.close();
            checkStmt.close();
            conn.close();

        } catch (Exception e) {
            // Handle and display database-related errors
            String errorMessage = e.getMessage().replaceAll("'", "");
            response.sendRedirect("register.jsp?error=" + java.net.URLEncoder.encode(errorMessage, "UTF-8"));
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet that handles user registration and inserts data into PostgreSQL";
    }
}
