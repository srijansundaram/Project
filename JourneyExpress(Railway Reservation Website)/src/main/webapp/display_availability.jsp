<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Journey Express|Availability</title>
    <link href="css/styles.css" rel="stylesheet" />
</head>
<body>
    <header style="position: fixed;">
        <a href="index.jsp" class="logo"><img src="images/logo.png" alt="Logo"></a>
        <div class="bx bx-menu" id="menu-icon"></div>
        <ul class="navbar">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="pnr.jsp">PNR Status</a></li>
            <li><a href="availability.jsp">Seat Availability</a></li>
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
            String destination = request.getParameter("destination");
            String startDate = request.getParameter("start-date");

            String url = "jdbc:mysql://localhost:3306/journeyexpress";
            String user = "root";
            String password = "password";
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, password);

                String sql = "SELECT train_id, train_name, departure_time, arrival_time, availability, available_seats FROM train " +
                             "WHERE source_station = ? AND destination_station = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, origin);
                pstmt.setString(2, destination);
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
                                <th>Train ID</th>
                                <th>Train Name</th>
                                <th>Departure Time</th>
                                <th>Arrival Time</th>
                                <th>Availability</th>
                                <th>Available Seats</th>
                            </tr>
                        </thead>
                        <tbody>
        <%
                    while (rs.next()) {
        %>
                            <tr>
                                <td><%= rs.getString("train_id") %></td>
                                <td><%= rs.getString("train_name") %></td>
                                <td><%= rs.getString("departure_time") %></td>
                                <td><%= rs.getString("arrival_time") %></td>
                                <td><%= rs.getString("availability") %></td>
                                <td><%= rs.getString("available_seats") %></td>
                                
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
