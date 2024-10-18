<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // Get the selected room type from the request
    String roomType = request.getParameter("roomType");
    String url = "jdbc:mysql://localhost:3306/hotel";
    String user = "root";
    String password = "password";
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String fare = "0"; // Default fare

    try {
        // Load MySQL JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        // Establish connection to the database
        conn = DriverManager.getConnection(url, user, password);
        // Prepare SQL statement to fetch fare based on room type
        String sql = "SELECT fare FROM Room WHERE RoomType = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, roomType); // Set the room type parameter
        rs = pstmt.executeQuery(); // Execute the query

        // If a record is found, retrieve the fare
        if (rs.next()) {
            fare = rs.getString("fare");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close resources to prevent memory leaks
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }

    // Output the fare as the response
    out.print(fare);
%>
