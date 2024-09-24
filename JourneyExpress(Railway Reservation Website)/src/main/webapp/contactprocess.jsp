<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ticket Confirmation</title>
</head>
<body>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String message = request.getParameter("message");

    String url = "jdbc:mysql://localhost:3306/journeyexpress";
    String user = "root";
    String password = "password";
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);

        String sql = "INSERT INTO ContactUs (name, email, message) VALUES (?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        
        pstmt.setString(1, name);
        pstmt.setString(2, email);
        pstmt.setString(3, message);

        int rowsInserted = pstmt.executeUpdate();
        if (rowsInserted > 0) {
            response.sendRedirect("contactconfiramtion.jsp");
        } else {
            out.println("<h1>Error: Unable to Insert Data.</h1>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h1>Error: " + e.getMessage() + "</h1>");
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
    }
%>
</body>
</html>
