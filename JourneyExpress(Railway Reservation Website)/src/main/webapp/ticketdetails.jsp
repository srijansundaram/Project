<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Journey Express|Availability</title>
		<link href="css/styles.css" rel="stylesheet" />
	</head>
	<style>
	        body {
	            font-family: Arial, sans-serif;
	            display: flex;
	            justify-content: center;
	            align-items: center;
	            height: 100vh; /* Full viewport height */
	            margin: 0;
	        }
	        .ticket-details {
	            margin: 20px;
	            padding: 20px;
	            border: 2px solid #ccc;
	            border-radius: 10px;
	            background-color: rgba(255, 255, 255, 0.9); /* White with transparency */
	            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow */
	            width: 400px; /* Fixed width */
	        }
	        h2 {
	            color: #333;
	            text-align: center;
	        }
	        p {
	            line-height: 1.6;
	            margin: 5px 0; /* Margin for paragraph spacing */
	        }
	        button {
	            display: block;
	            margin: 10px auto; /* Center the button */
	            padding: 10px 20px;
	            font-size: 16px;
	            cursor: pointer;
	        }
	</style>
	<body>
		<header style="position: fixed;">
			<a href="index.jsp" class="logo"><img src="images/logo.png" alt=""></a>
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
		<div class="ticket-details">
		    <h2>Ticket Confirmation</h2>
		    <p><strong>PNR:</strong> <%= request.getParameter("pnr") %></p>
		    <p><strong>Name:</strong> <%= request.getParameter("name") %></p>
		    <p><strong>Age:</strong> <%= request.getParameter("age") %></p>
		    <p><strong>Mobile Number:</strong> <%= request.getParameter("mobile") %></p>
		    <p><strong>Origin:</strong> <%= request.getParameter("origin") %></p>
		    <p><strong>Destination:</strong> <%= request.getParameter("destination") %></p>
		    <p><strong>Travel Date:</strong> <%= request.getParameter("travelDate") %></p>
		    <p><strong>Berth Preference:</strong> <%= request.getParameter("berthPreference") %></p>
		    <p><strong>Train Name:</strong> <%= request.getParameter("trainName") %></p>
		    <p><strong>Departure Time:</strong> <%= request.getParameter("departureTime") %></p>
		    <p><strong>Arrival Time:</strong> <%= request.getParameter("arrivalTime") %></p>
			<p><strong>Class:</strong> <%= request.getParameter("class") %></p>
			<p><strong>Fare:</strong> <%= request.getParameter("fare") %></p>
			
		    <form action="DownloadJPG" method="post">
		        <input type="hidden" name="pnr" value="<%= request.getParameter("pnr") %>">
		        <input type="hidden" name="name" value="<%= request.getParameter("name") %>">
		        <input type="hidden" name="age" value="<%= request.getParameter("age") %>">
		        <input type="hidden" name="mobile" value="<%= request.getParameter("mobile") %>">
		        <input type="hidden" name="origin" value="<%= request.getParameter("origin") %>">
		        <input type="hidden" name="destination" value="<%= request.getParameter("destination") %>">
		        <input type="hidden" name="travelDate" value="<%= request.getParameter("travelDate") %>">
		        <input type="hidden" name="berthPreference" value="<%= request.getParameter("berthPreference") %>">
		        <input type="hidden" name="trainName" value="<%= request.getParameter("trainName") %>">
		        <input type="hidden" name="departureTime" value="<%= request.getParameter("departureTime") %>">
		        <input type="hidden" name="arrivalTime" value="<%= request.getParameter("arrivalTime") %>">
		        <input type="hidden" name="class" value="<%= request.getParameter("class") %>">
		        <input type="hidden" name="fare" value="<%= request.getParameter("fare") %>">
		        <button type="submit">Download as JPG</button>
		    </form>
		</div>
	</body>
</html>
