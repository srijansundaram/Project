<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String origin = request.getParameter("origin");
    String destination = request.getParameter("destination");
    String url = "jdbc:mysql://localhost:3306/journeyexpress"; // Replace with your database name
    String user = "root";
    String password = "password";
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);
        String sql = "SELECT train_id, train_name FROM train WHERE source_station = ? AND destination_station = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, origin);
        pstmt.setString(2, destination);
        rs = pstmt.executeQuery();

        // Check if there are results and populate the dropdown
        if (!rs.isBeforeFirst()) { // no results
            out.print("<option value=''>No trains available</option>");
        } else {
            while (rs.next()) {
%>
                <%-- <option value="<%= rs.getString("train_id") %>"><%= rs.getString("train_name") %></option> --%>
                <option data-id="<%= rs.getString("train_id") %>"><%= rs.getString("train_name") %></option>
                
<%
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
