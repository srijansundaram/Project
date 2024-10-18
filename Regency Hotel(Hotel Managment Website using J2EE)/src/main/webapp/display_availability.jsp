<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Regency Hotel|Availability</title>
    <link href="css/styles.css" rel="stylesheet" />
</head>
<body>
    <header style="position: fixed;">
        <a href="index.jsp" class="logo"><img src="images/logo.png" alt="Logo"></a>
        <div class="bx bx-menu" id="menu-icon"></div>
        <ul class="navbar">
		                <li><a href="index.jsp">Home</a></li>
		                <li><a href="booking.jsp">Booking Status</a></li>
		                <li><a href="availability.jsp">Room	Availability</a></li>
		                 <li><a href="booknow.jsp">Book Now</a></li>
		                <li><a href="about.jsp">About us</a></li>
		                <li><a href="contactus.jsp">Contact us</a></li>
        </ul>
        <div class="header-btn">
            <a href="login.jsp" class="sign-in">Sign In</a>
        </div>
    </header>
    <!-- End Header -->

    <div class="table-container">
    	<div class="transparent-box">
        <%
            String origin = request.getParameter("origin");
            String startDate = request.getParameter("start-date");

            String url = "jdbc:mysql://localhost:3306/hotel";
            String user = "root";
            String password = "password";
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, password);

                String sql = "SELECT RoomType, Fare, Capacity, Status FROM Room " +
                             "WHERE RoomType = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, origin);
                rs = pstmt.executeQuery();

                if (!rs.isBeforeFirst()) {
        %>
                    <p>No trains available for the selected route and date.</p>
        <%
                } else {
        %>
                    <table>
                        <thead>
                            <tr>
                                <th>Room Type</th>
                                <th>Fare</th>
                                <th>Capacity</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
        <%
                    while (rs.next()) {
        %>
                            <tr>
                                <td><%= rs.getString("RoomType") %></td>
                                <td><%= rs.getString("Fare") %></td>
                                <td><%= rs.getString("Capacity") %></td>
                                <td><%= rs.getString("Status") %></td>
                                
                            </tr>
        <%
                    }
        %>
                        </tbody>
                    </table>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
        %>
                <p>Error fetching data: <%= e.getMessage() %></p>
        <%
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        %>
        </div>
    </div>
</body>
</html>
