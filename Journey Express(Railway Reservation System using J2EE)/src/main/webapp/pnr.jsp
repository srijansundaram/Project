<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Journey Express|PNR Status</title>
		<link href="css/styles.css" rel="stylesheet" />
	</head>
	<body style="margin: 0; padding: 0; height: 100vh; width: 100vw; display: flex; 
		justify-content: center; align-items: center;">
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
	    <!-- End Header -->
	    <!-- Availability -->
		<div class="center-container">
	        <h1>
	            <span style="color:#fe5b3d;">Check</span> PNR Status
	        </h1>
   		</div>	
		<div class="form-container" style = "background-color: rgba(255, 255, 255, 0.85);">
		    <form action="display_pnr.jsp" method="post">
	        	<div class="form-group">
		            <div class="input-box">
		                <label for="name">PNR</label>
		                <input type="search" name="pnr" id="name" placeholder="Enter Your PNR" required>
		            </div>
		        </div>
		        <button type="submit" class="btn">Check Now</button>
		    </form>
		</div>

	</body>
</html>