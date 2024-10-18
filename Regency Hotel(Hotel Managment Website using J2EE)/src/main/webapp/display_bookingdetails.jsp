<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Regency Hotel |Booking Status</title>
    <link href="css/styles.css" rel="stylesheet" />
</head>
<body>
    <header style="position: fixed;">
        <a href="index.jsp" class="logo"><img src="images/logo.png" alt="Logo"></a>
        <div class="bx bx-menu" id="menu-icon"></div>
        <ul class="navbar">
		                <li><a href="index.jsp">Home</a></li>
		                <li><a href="booking.jsp">Booking Status</a></li>
		                <li><a href="availability.jsp">Room	 Availability</a></li>
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

            String url = "jdbc:mysql://localhost:3306/hotel";
            String user = "root";
            String password = "password";
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, password);

                String sql = "SELECT BookingNumber, RoomType, CheckInDate, Name, Email, CheckOutDate, Fare, Age, MobileNumber FROM Booked " +
                             "WHERE BookingNumber = ?";
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
                                <th>Booking Number</th>
                                <th>Name</th>
                                <th>Age</th>
                                <th>Mobile Number</th>
                                <th>Email</th>
                                <th>Room Type</th>
                                <th>Check-In Date</th>
                                <th>Check-Out Date</th>
                                <th>Fare</th>
                                <th>Actions</th> <!-- New column for actions -->
                            </tr>
                        </thead>
                        <tbody>
        <%
                    while (rs.next()) {
                        String BookingNumber = rs.getString("BookingNumber");
                        String name = rs.getString("Name");
                        String age = rs.getString("Age");
                        String mobile = rs.getString("MobileNumber");
                        String email = rs.getString("Email");
                        String roomtype = rs.getString("RoomType");
                        String checkinDate = rs.getString("CheckInDate");
                        String checkoutDate = rs.getString("CheckOutDate");
                        String fare = rs.getString("Fare");
        %>
                            <tr>
                                <td><%= BookingNumber %></td>
                                <td><%= name %></td>
                                <td><%= age %></td>
                                <td><%= mobile %></td>
                                <td><%= email %></td>
                                <td><%= roomtype %></td>
                                <td><%= checkinDate %></td>
                                <td><%= checkoutDate %></td>
                                <td><%= fare %></td>
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
