<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
    String studentName = (String) session.getAttribute("studentName");
    
    if(studentName == null){
    response.sendRedirect("login.jsp");
    return;
    }
    %>
<html>
<head>
    <title>Dashboard</title>
</head>
<body>
    
    <h1>Welcome, <%= studentName %>!</h1>
    
    <form action= "Logout" method="post"> <button type="submit">
            Logout</button>
    </form>  
</body>
</html>
