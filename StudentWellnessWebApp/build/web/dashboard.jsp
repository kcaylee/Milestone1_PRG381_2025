<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // Handle logout action: invalidate session and redirect to index with logout flag
    if ("logout".equals(request.getParameter("action"))) {
        session.invalidate();
        response.sendRedirect("index.jsp?logout=1");
        return;
    }

    // Retrieve session values
    String studentName = (session != null) ? (String) session.getAttribute("studentName") : null;
    String studentNumber = (session != null) ? (String) session.getAttribute("studentNumber") : null;

    // Redirect to login if session is invalid or missing
    if (studentName == null || studentNumber == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Dashboard</title>
    <!-- Bootstrap 5 for styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow">
                <div class="card-body">
                    <!-- Personalized welcome message -->
                    <h2 class="card-title text-center text-primary">
                        Welcome, <%= studentName %>!
                    </h2>
                    <h5 class="text-center text-secondary">
                        Student Number: <%= studentNumber %>
                    </h5>

                    <!-- Placeholder for future dashboard content -->
                    <p class="card-text mt-4 text-center">
                        This is your wellness dashboard. From here, you will be able to manage appointments, give feedback, and view counsellors in the future.
                    </p>

                    <!-- Logout button -->
                    <form method="get" action="dashboard.jsp" class="d-flex justify-content-center mt-4">
                        <input type="hidden" name="action" value="logout">
                        <button type="submit" class="btn btn-danger">Logout</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Optional: Bootstrap JavaScript for interactive components -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
