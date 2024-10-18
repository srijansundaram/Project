<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Regency Hotel|About Us</title>
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
            		<span style="color:#fe5b3d;">About</span> Us
        		</h1>
	        </div>
	        <div class="about-us">
	            <h2>Regency Hotel</h2>
	            <p>
	               Welcome to Regency Hotel, where comfort meets luxury in the heart of Navi Mumbai. Our hotel is dedicated to providing an exceptional experience for every guest, blending modern amenities with a warm, inviting atmosphere.
	            </p>
	            <p>
	                Founded in 1855, Regency Hotel has become a beloved destination for travelers seeking relaxation and adventure. Our team is passionate about hospitality, ensuring that your stay is not just a visit, but a memorable experience.
	            </p>
	            <p>
	               Our beautifully appointed rooms offer stunning views and the latest conveniences, while our on-site dining options feature locally sourced ingredients and a diverse menu. Whether you’re here for business or leisure, we provide a range of services and facilities, including a fitness center, spa, and event spaces tailored to your needs.
	            </p>
	        </div>
	    </div>
	
	</body>
</html>
