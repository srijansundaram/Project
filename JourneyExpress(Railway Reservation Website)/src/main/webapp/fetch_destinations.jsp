<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String origin = request.getParameter("origin");
    String url = "jdbc:mysql://localhost:3306/journeyexpress"; // Replace with your database name
    String user = "root";
    String password = "password";
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);
        String sql = "SELECT DISTINCT destination_station FROM train WHERE source_station = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, origin);
        rs = pstmt.executeQuery();

        while (rs.next()) {
%>
            <option value="<%= rs.getString("destination_station") %>"><%= rs.getString("destination_station") %></option>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
