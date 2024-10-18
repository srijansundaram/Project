<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Regency Hotel | Booking Confirmation</title>
    <link href="css/styles.css" rel="stylesheet" />
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .confirmation-details {
            margin: 20px;
            padding: 20px;
            border: 2px solid #ccc;
            border-radius: 10px;
            background-color: rgba(255, 255, 255, 0.9);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }
        h2 {
            color: #333;
            text-align: center;
        }
        p {
            line-height: 1.6;
            margin: 5px 0;
        }
        button {
            display: block;
            margin: 10px auto;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <header style="position: fixed;">
        <a href="index.jsp" class="logo"><img src="images/logo.png" alt=""></a>
        <div class="bx bx-menu" id="menu-icon"></div>
        <ul class="navbar">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="booking.jsp">Booking Status</a></li>
            <li><a href="availability.jsp">Room Availability</a></li>
            <li><a href="booknow.jsp">Book Now</a></li>
            <li><a href="about.jsp">About us</a></li>
            <li><a href="contactus.jsp">Contact us</a></li>
        </ul>
        <div class="header-btn">
            <a href="login.jsp" class="sign-in">Sign In</a>
        </div>
    </header>
    <div class="confirmation-details">
        <h2>Booking Confirmation</h2>
        <p><strong>Booking Number:</strong> <%= request.getParameter("bookingNumber") %></p>
        <p><strong>Name:</strong> <%= request.getParameter("name") %></p>
        <p><strong>Email:</strong> <%= request.getParameter("email") %></p>
        <p><strong>Check-In Date:</strong> <%= request.getParameter("checkInDate") %></p>
        <p><strong>Check-Out Date:</strong> <%= request.getParameter("checkOutDate") %></p>
        <p><strong>Room Type:</strong> <%= request.getParameter("roomType") %></p>
        <p><strong>Fare:</strong> <%= request.getParameter("fare") %></p>
        <button onclick="window.location.href='index.jsp'">Go to Home</button>
    </div>
</body>
</html>
