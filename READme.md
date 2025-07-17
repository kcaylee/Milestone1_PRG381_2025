# 🩺 BC Student Wellness Management System – Milestone 1

This is a Java-based web application developed for Belgium Campus as part of the PRG3781 module. The system allows students to register, log in, and access a dashboard using JSP, Servlets, and PostgreSQL.

---

## 📚 Technologies Used

- Java (Servlets)
- JSP (JavaServer Pages)
- HTML5 + Bootstrap 5
- PostgreSQL
- NetBeans IDE
- Apache Tomcat

---

## 📁 Project Structure

| File/Folder         | Description                                      |
|---------------------|--------------------------------------------------|
| `index.jsp`         | Home page with links to login and register       |
| `register.jsp`      | Registration form with validation and feedback   |
| `login.jsp`         | Login form with error handling                   |
| `dashboard.jsp`     | Welcome page after login, shows student info     |
| `Register.java`     | Servlet handling new user registration           |
| `Login.java`        | Servlet handling user authentication             |

---

## ✅ Features

### 🔐 Registration
- Validates all fields (student number, email, phone)
- Prevents duplicate email/student numbers
- Feedback messages on success or error
- Stores data in PostgreSQL

### 🔓 Login
- Authenticates against the database
- Clear error messages on failure
- Redirects to dashboard on success
- Uses `HttpSession` for state

### 🧾 Dashboard
- Displays personalized welcome (student name + number)
- Logout button:
  - Invalidates session
  - Redirects to `index.jsp`
  - Shows logout confirmation popup

---

## 🧪 Database Setup (PostgreSQL)

```sql
CREATE DATABASE wellness_db;

\c wellness_db

CREATE TABLE users (
    student_number VARCHAR(20) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) NOT NULL,
    password TEXT NOT NULL
);

CREATE USER wellness_user WITH PASSWORD 'wellness123';

GRANT CONNECT ON DATABASE wellness_db TO wellness_user;
GRANT USAGE ON SCHEMA public TO wellness_user;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO wellness_user;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO wellness_user;
