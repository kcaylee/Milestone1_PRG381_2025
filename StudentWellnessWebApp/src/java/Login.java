import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    /**
     * Handles user login.
     * Validates email and password against the PostgreSQL database.
     * If successful, stores session attributes and redirects to dashboard.
     * If failed, redirects to login.jsp with error messages.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            // Load PostgreSQL JDBC driver
            Class.forName("org.postgresql.Driver");

            // Connect to PostgreSQL
            Connection conn = DriverManager.getConnection(
                "jdbc:postgresql://localhost:5432/wellness_db", "wellness_user", "wellness123");

            // Query to validate credentials
            String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Successful login: start session and store user details
                HttpSession session = request.getSession();
                session.setAttribute("studentName", rs.getString("name"));
                session.setAttribute("studentNumber", rs.getString("student_number"));

                // Redirect to the protected dashboard page
                response.sendRedirect("dashboard.jsp");
            } else {
                // Failed login: invalid credentials
                response.sendRedirect("login.jsp?error=true&code=invalid");
            }

            // Cleanup
            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            // Handle database errors gracefully
            e.printStackTrace();
            String errorMessage = e.getMessage().replaceAll("'", "");
            response.sendRedirect("login.jsp?error=true&code=db&msg=" + java.net.URLEncoder.encode(errorMessage, "UTF-8"));
        }
    }

    @Override
    public String getServletInfo() {
        return "Login servlet for user authentication";
    }
}
