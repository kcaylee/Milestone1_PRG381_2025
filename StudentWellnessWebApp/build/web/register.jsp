<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow">
                <div class="card-body">
                    <h3 class="card-title text-center text-primary mb-4">Register for Wellness System</h3>

                    <form action="Register" method="post">
                        <div class="mb-3">
                            <label class="form-label">Student Number</label>
                            <input type="text" class="form-control" name="student_number" required
                                   pattern="^[0-9]{6}$"
                                   title="Student number must be exactly 6 digits.">
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Name</label>
                            <input type="text" class="form-control" name="name" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Surname</label>
                            <input type="text" class="form-control" name="surname" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" class="form-control" name="email" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Phone</label>
                            <input type="text" class="form-control" name="phone" required
                                   pattern="^0[0-9]{9}$"
                                   title="Phone number must start with 0 and be 10 digits long.">
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" class="form-control" name="password" required>
                        </div>

                        <div class="d-grid mb-2">
                            <button type="submit" class="btn btn-success">Register</button>
                        </div>
                    </form>

                    <!-- Back to home button -->
                    <div class="d-grid mb-3">
                        <a href="index.jsp" class="btn btn-outline-secondary">Back to Home</a>
                    </div>

                    <!-- Display success or error messages -->
                    <%
                        String message = request.getParameter("msg");
                        String error = request.getParameter("error");

                        if (message != null) {
                    %>
                        <div class="alert alert-success" role="alert">
                            <%= message %>
                        </div>
                    <%
                        } else if (error != null) {
                    %>
                        <div class="alert alert-danger" role="alert">
                            <%= error %>
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
