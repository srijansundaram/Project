<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Journey Express|Query Raised</title>
    <link href="css/styles.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body style="margin: 0; padding: 0; height: 100vh; width: 100vw; display: flex; justify-content: center; align-items: center;">
<header style="position: fixed;">
    <a href="admin.jsp" class="logo"><img src="images/logo.png" alt=""></a>
    <div class="bx bx-menu" id="menu-icon"></div>
    <ul class="navbar">
        <li><a href="admin.jsp">Home</a></li>
        <li><a href="display_booking.jsp">Booked Tickets</a></li>
        <li><a href="display_seat.jsp">Seat Availability</a></li>
        <li><a href="display_train.jsp">Train Details</a></li>
        <li><a href="display_team.jsp">Team Details</a></li>
        <li><a href="display_query.jsp">Query</a></li>
    </ul>
    <li><a href="logout" class="sign-in"><%= session.getAttribute("name") %></a></li>
</header>
<!-- End Header -->
<div class="table-container">
    <div class="transparent-box">
        <%
            String url = "jdbc:mysql://localhost:3306/journeyexpress";
            String user = "root";
            String password = "password";

            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;

            int pageSize = 10; // Number of records per page
            int currentPage = 1; // Default to the first page

            // Get the current page from request parameter
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

                // Count total records
                String countSql = "SELECT COUNT(*) AS total FROM ContactUs";
                ResultSet countResultSet = statement.executeQuery(countSql);
                int totalRecords = 0;
                if (countResultSet.next()) {
                    totalRecords = countResultSet.getInt("total");
                }
                countResultSet.close();

                // Calculate total pages
                int totalPages = (int) Math.ceil(totalRecords / (double) pageSize);

                // Fetch records for the current page
                int offset = (currentPage - 1) * pageSize;
                String sql = "SELECT name, email, message, submitted_at FROM ContactUs LIMIT " + pageSize + " OFFSET " + offset;
                resultSet = statement.executeQuery(sql);

                if (!resultSet.isBeforeFirst()) {
        %>
                    <p>No messages available.</p>
        <%
                } else {
        %>
                    <table>
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Message</th>
                                <th>Submitted At</th>
                            </tr>
                        </thead>
                        <tbody>
        <%
                    while (resultSet.next()) {
        %>
                            <tr>
                                <td><%= resultSet.getString("name") %></td>
                                <td><%= resultSet.getString("email") %></td>
                                <td><%= resultSet.getString("message") %></td>
                                <td><%= resultSet.getTimestamp("submitted_at") %></td>
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
