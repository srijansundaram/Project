<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Regency Hotel|Bookings</title>
    <link href="css/styles.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body style="margin: 0; padding: 0; height: 100vh; width: 100vw; display: flex; justify-content: center; align-items: center;">
<header style="position: fixed;">
    <a href="admin.jsp" class="logo"><img src="images/logo.png" alt=""></a>
    <div class="bx bx-menu" id="menu-icon"></div>
    <ul class="navbar">
			<li><a href="admin.jsp">Home</a></li>
			<li><a href="display_booking.jsp">Booked Rooms</a></li>
			<li><a href="display_room.jsp">Room Details</a></li>
			<li><a href="display_team.jsp">Team Details</a></li>
			<li><a href="display_query.jsp">Query</a></li>
    </ul>
    <li><a href="logout" class="sign-in"><%= session.getAttribute("name") %></a></li>
</header>
<!-- End Header -->
<div class="table-container">
    <div class="transparent-box">
        <%
            String url = "jdbc:mysql://localhost:3306/hotel";
            String user = "root";
            String password = "password";

            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;

            int pageSize = 6; // Records per page
            int currentPage = 1; // Default to first page

            // Get the page number from request parameter
            String pageParam = request.getParameter("page");
            if (pageParam != null) {
                try {
                    currentPage = Integer.parseInt(pageParam);
                } catch (NumberFormatException e) {
                    currentPage = 1; // Default to first page on error
                }
            }

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(url, user, password);
                statement = connection.createStatement();

                // Total count of records
                String countSql = "SELECT COUNT(*) AS total FROM Booked";
                ResultSet countResultSet = statement.executeQuery(countSql);
                int totalRecords = 0;
                if (countResultSet.next()) {
                    totalRecords = countResultSet.getInt("total");
                }
                countResultSet.close();

                // Calculate total pages
                int totalPages = (int) Math.ceil(totalRecords / (double) pageSize);

                // Fetch records for the current page
                String sql = "SELECT BookingNumber, RoomType, CheckInDate, Name, Email, CheckOutDate, Fare, Age, MobileNumber " +
                             "FROM Booked " +
                             "LIMIT " + pageSize + " OFFSET " + ((currentPage - 1) * pageSize);
                resultSet = statement.executeQuery(sql);

                if (!resultSet.isBeforeFirst()) {
        %>
                    <p>No tickets available.</p>
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
                            </tr>
                        </thead>
                        <tbody>
        <%
                    while (resultSet.next()) {
        %>
                            <tr>
                                <td><%= resultSet.getString("BookingNumber") %></td>
                                <td><%= resultSet.getString("Name") %></td>
                                <td><%= resultSet.getString("Age") %></td>
                                <td><%= resultSet.getString("MobileNumber") %></td>
                                <td><%= resultSet.getString("Email") %></td>
                                <td><%= resultSet.getString("RoomType") %></td>
                                <td><%= resultSet.getString("CheckInDate") %></td>
                                <td><%= resultSet.getString("CheckOutDate") %></td>
                                <td><%= resultSet.getString("Fare") %></td>   
                            </tr>
        <%
                    }
        %>
                        </tbody>
                    </table>
        <%
                    // Pagination controls
                    if (totalPages > 1) {
        %>
                        <div class="pagination">
        <%
                        for (int i = 1; i <= totalPages; i++) {
                            if (i == currentPage) {
        %>
                                <span><%= i %></span>
        <%
                            } else {
        %>
                                <a href="?page=<%= i %>"><%= i %></a>
        <%
                            }
                        }
        %>
                        </div>
        <%
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
        %>
                <p>Error fetching data: <%= e.getMessage() %></p>
        <%
            } finally {
                if (resultSet != null) try { resultSet.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (statement != null) try { statement.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (connection != null) try { connection.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        %>
        </div>
    </div>
</body>
</html>
