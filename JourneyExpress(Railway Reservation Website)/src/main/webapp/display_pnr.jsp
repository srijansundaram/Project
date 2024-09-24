<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Journey Express | Availability</title>
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
            String pnr = request.getParameter("pnr");

            String url = "jdbc:mysql://localhost:3306/journeyexpress";
            String user = "root";
            String password = "password";
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, password);

                String sql = "SELECT pnr, name, age, mobile_number, origin, destination, travel_date, berth_preference, train_name, departure_time, arrival_time, class, fare FROM tickets " +
                             "WHERE pnr = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, pnr);
                rs = pstmt.executeQuery();

                if (!rs.isBeforeFirst()) {
        %>
                    <p>No records found..</p>
        <%
                } else {
        %>
                    <table>
                        <thead>
                            <tr>
                                <th>PNR</th>
                                <th>Name</th>
                                <th>Age</th>
                                <th>Mobile Number</th>
                                <th>Origin</th>
                                <th>Destination</th>
                                <th>Travel Date</th>
                                <th>Berth</th>
                                <th>Class</th>
                                <th>Fare</th>
                                <th>Train Name</th>
                                <th>Departure Time</th>
                                <th>Arrival Time</th>
                                <th>Actions</th> <!-- New column for actions -->
                            </tr>
                        </thead>
                        <tbody>
        <%
                    while (rs.next()) {
                        String ticketPNR = rs.getString("pnr");
                        String name = rs.getString("name");
                        String age = rs.getString("age");
                        String mobile = rs.getString("mobile_number");
                        String origin = rs.getString("origin");
                        String destination = rs.getString("destination");
                        String travelDate = rs.getString("travel_date");
                        String berthPreference = rs.getString("berth_preference");
                        String trainclass = rs.getString("class");
                        String fare = rs.getString("fare");
                        String trainName = rs.getString("train_name");
                        String departureTime = rs.getString("departure_time");
                        String arrivalTime = rs.getString("arrival_time");
        %>
                            <tr>
                                <td><%= ticketPNR %></td>
                                <td><%= name %></td>
                                <td><%= age %></td>
                                <td><%= mobile %></td>
                                <td><%= origin %></td>
                                <td><%= destination %></td>
                                <td><%= travelDate %></td>
                                <td><%= berthPreference %></td>
                                <td><%= trainclass %></td>
                                <td><%= fare %></td>
                                <td><%= trainName %></td>
                                <td><%= departureTime %></td>
                                <td><%= arrivalTime %></td>
                                <td>
                                    <a href="DownloadJPG?pnr=<%= ticketPNR %>&name=<%= name %>&age=<%= age %>&mobile=<%= mobile %>&origin=<%= origin %>&destination=<%= destination %>&travelDate=<%= travelDate %>&berthPreference=<%= berthPreference %>&trainName=<%= trainName %>&departureTime=<%= departureTime %>&arrivalTime=<%= arrivalTime %>" class="download-button">Download Ticket</a>
                                </td>
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
