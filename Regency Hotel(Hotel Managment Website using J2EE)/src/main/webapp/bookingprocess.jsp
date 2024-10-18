<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking Confirmation</title>
</head>
<body>
<%
    // Generate a random booking number
    Random rand = new Random();
    String bookingNumber = String.format("%08d", rand.nextInt(10000000));
    
    // Fetch parameters from the request
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String age = request.getParameter("age");
    String mobile = request.getParameter("mobile");
    String roomType = request.getParameter("room-type"); // Corrected position
    String checkInDate = request.getParameter("start-date"); // Ensure this matches your form
    String checkOutDate = request.getParameter("end-date"); // Ensure this matches your form
    String fare = request.getParameter("fare");

    // Database connection details
    String url = "jdbc:mysql://localhost:3306/hotel";
    String user = "root";
    String password = "password";
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);

        // Prepare SQL insert statement
        String sql = "INSERT INTO Booked (BookingNumber, RoomType, CheckInDate, Name, Email, CheckOutDate, Fare, Age, MobileNumber) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        
        // Set parameters for the SQL statement
        pstmt.setString(1, bookingNumber);
        pstmt.setString(2, roomType);
        pstmt.setDate(3, java.sql.Date.valueOf(checkInDate));
        pstmt.setString(4, name);
        pstmt.setString(5, email);
        pstmt.setDate(6, java.sql.Date.valueOf(checkOutDate));
        pstmt.setString(7, fare);
        pstmt.setInt(8, Integer.parseInt(age)); // Convert age to integer
        pstmt.setString(9, mobile);

        // Execute the update
        int rowsInserted = pstmt.executeUpdate();
        if (rowsInserted > 0) {
            // Redirect to confirmation page with booking details
            response.sendRedirect("confirmation.jsp?bookingNumber=" + URLEncoder.encode(bookingNumber, "UTF-8") +
                "&name=" + URLEncoder.encode(name, "UTF-8") +
                "&email=" + URLEncoder.encode(email, "UTF-8") +
                "&age=" + age +
                "&mobile=" + URLEncoder.encode(mobile, "UTF-8") +
                "&roomType=" + URLEncoder.encode(roomType, "UTF-8") +
                "&checkInDate=" + URLEncoder.encode(checkInDate, "UTF-8") +
                "&checkOutDate=" + URLEncoder.encode(checkOutDate, "UTF-8") +
                "&fare=" + URLEncoder.encode(fare, "UTF-8"));
            return; // Ensure no further processing occurs after redirect
        } else {
            out.println("<h1>Error: Booking could not be completed.</h1>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h1>Error: " + e.getMessage() + "</h1>");
    } finally {
        // Close resources
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
    }
%>
</body>
</html>
