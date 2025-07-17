<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>BC Student Wellness - Home</title>
    <!-- Bootstrap 5 CSS for styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow">
                <div class="card-body text-center">
                    <h1 class="card-title text-primary mb-4">Welcome to the BC Student Wellness System</h1>
                    <p class="card-text">Please choose an option:</p>

                    <!-- Navigation buttons to login and registration pages -->
                    <div class="d-grid gap-2 col-6 mx-auto mt-4">
                        <a href="login.jsp" class="btn btn-outline-primary btn-lg">Login</a>
                        <a href="register.jsp" class="btn btn-outline-success btn-lg">Register</a>
                    </div>

                    <!-- Optional logout message popup if redirected from logout -->
                    <%
                        String logoutNotice = request.getParameter("logout");
                        if ("1".equals(logoutNotice)) {
                    %>
                        <div id="logout-popup" class="alert alert-success mt-4" role="alert">
                            You have been logged out successfully.
                        </div>

                        <script>
                            // Auto-hide logout popup after 3 seconds
                            setTimeout(function() {
                                var popup = document.getElementById("logout-popup");
                                if (popup) popup.style.display = "none";
                            }, 3000);
                        </script>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Optional Bootstrap JS bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
