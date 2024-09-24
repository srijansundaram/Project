<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>



<%
    String trainId = request.getParameter("trainId");
    String url = "jdbc:mysql://localhost:3306/journeyexpress";
    String user = "root";
    String password = "password";

    response.setContentType("application/json");
    PrintWriter writer = response.getWriter(); // Renamed to writer

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);

        String sql = "SELECT sl_fare, three_a_fare, two_a_fare, one_a_fare FROM fare WHERE train_id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, Integer.parseInt(trainId));
        rs = pstmt.executeQuery();

        if (rs.next()) {
            writer.print("{");
            writer.print("\"sl_fare\":" + rs.getBigDecimal("sl_fare") + ",");
            writer.print("\"three_a_fare\":" + rs.getBigDecimal("three_a_fare") + ",");
            writer.print("\"two_a_fare\":" + rs.getBigDecimal("two_a_fare") + ",");
            writer.print("\"one_a_fare\":" + rs.getBigDecimal("one_a_fare"));
            writer.print("}");
        } else {
            writer.print("{\"error\": \"No fare data found for the given train ID.\"}");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        writer.print("{\"error\": \"Error fetching fare data: " + e.getMessage() + "\"}");
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>