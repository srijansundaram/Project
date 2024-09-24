<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Journey Express |About Us</title>
    	<link href="css/styles.css" rel="stylesheet">
   		<style>
	        body {
	            font-family: Arial, sans-serif;
	            background-color: #f0f0f0;
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
	            margin-top: 60px; /* Positioning lower */
	        }
	        .about-us {
	            width: 600px; /* Increased width */
	            padding: 30px; /* Increased padding */
	            background-color: rgba(255, 255, 255, 0.85);
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
    	</style>
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
	    <div class="container">
	        <div class="title">
	        	<h1>
            		<span style="color:#fe5b3d;">About</span> Us
        		</h1>
	        </div>
	        <div class="about-us">
	            <h2>Journey Express</h2>
	            <p>
	                Welcome to Journey Express, your premier railway reservation service. With years of experience in the travel industry, we are dedicated to providing you with a seamless travel experience, offering easy booking, reliable schedules, and top-notch customer service. Our platform is designed to cater to the needs of every traveler, whether you are a frequent commuter or an adventurous explorer.
	            </p>
	            <p>
	                Our mission is to make train travel accessible and enjoyable for everyone. We understand that traveling can sometimes be stressful, which is why we strive to simplify the booking process with our user-friendly interface. With just a few clicks, you can reserve your tickets, check train availability, and receive real-time updates on your journey. 
	            </p>
	            <p>
	                At Journey Express, we believe in the importance of safety and comfort. Our trains are equipped with modern amenities, ensuring that you have a pleasant journey. We take pride in our commitment to customer satisfaction; our friendly support team is available 24/7 to assist you with any queries or concerns. Whether you need help with your booking or have questions about your travel plans, we are here for you.
	            </p>
	        </div>
	    </div>
	
	</body>
</html>
