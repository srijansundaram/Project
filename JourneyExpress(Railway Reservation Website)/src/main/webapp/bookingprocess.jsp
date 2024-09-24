<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ticket Confirmation</title>
</head>
<body>
<%
    Random rand = new Random();
    String pnr = String.format("%08d", rand.nextInt(10000000));
    String name = request.getParameter("name");
    int age = Integer.parseInt(request.getParameter("age"));
    String mobile = request.getParameter("mobile");
    String origin = request.getParameter("origin");
    String destination = request.getParameter("destination");
    String travelDate = request.getParameter("start-date");
    String berthPreference = request.getParameter("berth");
    String trainName = request.getParameter("train");
    String departureTime = request.getParameter("departure-time");
    String arrivalTime = request.getParameter("arrival-time");
    String trainClass = request.getParameter("class"); // New: Class
    String fare = request.getParameter("fare"); // Fare as String

    String url = "jdbc:mysql://localhost:3306/journeyexpress";
    String user = "root";
    String password = "password";
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);

        // Update SQL to include class and fare
        String sql = "INSERT INTO tickets (pnr, name, age, mobile_number, origin, destination, travel_date, berth_preference, train_name, departure_time, arrival_time, class, fare) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        
        pstmt.setString(1, pnr);
        pstmt.setString(2, name);
        pstmt.setInt(3, age);
        pstmt.setString(4, mobile);
        pstmt.setString(5, origin);
        pstmt.setString(6, destination);
        pstmt.setDate(7, java.sql.Date.valueOf(travelDate));
        pstmt.setString(8, berthPreference);
        pstmt.setString(9, trainName);
        pstmt.setTime(10, java.sql.Time.valueOf(departureTime));
        pstmt.setTime(11, java.sql.Time.valueOf(arrivalTime)); // Corrected variable name
        pstmt.setString(12, trainClass); // New: Class
        pstmt.setString(13, fare); // Fare as String

        int rowsInserted = pstmt.executeUpdate();
        if (rowsInserted > 0) {
            // Redirect to ticket details page with parameters
            response.sendRedirect("ticketdetails.jsp?pnr=" + URLEncoder.encode(pnr, "UTF-8") +
                "&name=" + URLEncoder.encode(name, "UTF-8") +
                "&age=" + age +
                "&mobile=" + URLEncoder.encode(mobile, "UTF-8") +
                "&origin=" + URLEncoder.encode(origin, "UTF-8") +
                "&destination=" + URLEncoder.encode(destination, "UTF-8") +
                "&travelDate=" + URLEncoder.encode(travelDate, "UTF-8") +
                "&berthPreference=" + URLEncoder.encode(berthPreference, "UTF-8") +
                "&trainName=" + URLEncoder.encode(trainName, "UTF-8") +
                "&departureTime=" + URLEncoder.encode(departureTime, "UTF-8") +
                "&arrivalTime=" + URLEncoder.encode(arrivalTime, "UTF-8") +
                "&class=" + URLEncoder.encode(trainClass, "UTF-8") + // New: Class
                "&fare=" + URLEncoder.encode(fare, "UTF-8")); // Fare as String
            return; // Ensure no further processing occurs after redirect
        } else {
            out.println("<h1>Error: Ticket could not be booked.</h1>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h1>Error: " + e.getMessage() + "</h1>");
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
    }
%>
</body>
</html>
