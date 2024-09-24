<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    response.setContentType("application/json;charset=UTF-8");
    String trainId = request.getParameter("trainId");
    String url = "jdbc:mysql://localhost:3306/journeyexpress";
    String user = "root";
    String password = "password";
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String jsonResponse = "{}"; // Default response

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);
        pstmt = conn.prepareStatement("SELECT departure_time, arrival_time FROM train WHERE train_id = ?");
        pstmt.setString(1, trainId);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            String departureTime = rs.getString("departure_time");
            String arrivalTime = rs.getString("arrival_time");
            jsonResponse = String.format("{\"departure\":\"%s\",\"arrival\":\"%s\"}", departureTime, arrivalTime);
        } else {
            jsonResponse = "{\"error\":\"No train found for ID: " + trainId + "\"}";
        }
    } catch (Exception e) {
        jsonResponse = "{\"error\":\"" + e.getMessage() + "\"}"; // Capture any errors
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) {}
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
    }

    response.getWriter().write(jsonResponse); // Send JSON response
%>

