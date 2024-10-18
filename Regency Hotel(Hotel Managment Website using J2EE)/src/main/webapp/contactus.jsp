<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Regency Hotel |Contact Us</title>
	    <link href="css/styles.css" rel="stylesheet">
	    <style>
	        body {
	            font-family: Arial, sans-serif;
	            margin: 0;
	            padding: 20px;
	            display: flex;
	            justify-content: center;
	            align-items: center;
	            height: 100vh;
	        }
	        .container {
	            display: flex;
	            align-items: center;
	            margin: 20px 0;
	            margin-top: 50px;
	        }
	        .contact-us {
	            width: 600px; /* Width of the box */
	            padding: 30px; /* Padding inside the box */
	            background-color: rgba(255, 255, 255, 0.85); /* Increased transparency */
	            border-radius: 10px;
	            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
	            transition: all 0.3s ease;
	        }
	        .title {
	            margin-right: 20px;
	            font-size: 24px;
	            font-weight: bold;
	            color: #333;
	        }
	        input, textarea {
	            width: 100%;
	            padding: 10px;
	            margin: 10px 0;
	            border: 1px solid #ccc;
	            border-radius: 10px;
	        }
	        button {
	            background-color:  #474fa0;
	            color: white;
	            padding: 10px;
	            border: none;
	            border-radius: 10px;
	            cursor: pointer;
	            transition: background-color 0.3s;
	        }
	        button:hover {
	            background-color: #fe5b3d;
	        }
	    </style>
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
	    <div class="container">
	        <div class="title">
	        	<h1>
            		<span style="color:#fe5b3d;">Contact</span> Us
        		</h1>
	        </div>
	        <div class="contact-us">
	            <h2>Get in Touch</h2>
	            <form action="contactprocess.jsp" method="post">
	                <label for="name">Name:</label>
	                <input type="text" id="name" name="name" required>
	
	                <label for="email">Email:</label>
	                <input type="email" id="email" name="email" required>
	
	                <label for="message">Message:</label>
	                <textarea id="message" name="message" rows="5" required></textarea>
	
	                <button type="submit">Submit</button>
	            </form>
	        </div>
	    </div>
	
	</body>
</html>
