<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Login</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow">
                <div class="card-body">
                    <h3 class="card-title text-center text-primary mb-4">Login to Wellness System</h3>

                    <form action="Login" method="post">
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" class="form-control" name="email" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" class="form-control" name="password" required>
                        </div>

                        <div class="d-grid mb-3">
                            <button type="submit" class="btn btn-primary">Login</button>
                        </div>
                    </form>

                    <div class="d-grid mb-2">
                        <a href="index.jsp" class="btn btn-outline-secondary">Back to Home</a>
                    </div>

                    <!-- Display error messages if login fails -->
                    <%
                        String error = request.getParameter("error");
                        String message = null;

                        if ("true".equals(error)) {
                            String code = request.getParameter("code");
                            message = "Invalid email or password.";

                            if ("db".equals(code)) {
                                String dbMessage = request.getParameter("msg");
                                message = (dbMessage != null) ? dbMessage : "A database error occurred.";
                            }
                    %>
                        <div class="alert alert-danger mt-3" role="alert">
                            <%= message %>
                        </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS (optional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
