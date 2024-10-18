<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Regency Hotel|Home</title>
		<link href="css/styles.css" rel="stylesheet" />
		 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
	    <!-- End Header -->
	        <!-- Index -->
	    <section class="home" id="home">
	    	<div class="text">
	    		<br><br><br><br><br>
	        	<h1><span>Getting</span> ready<br>for a trip</h1>
	            <p>From Night To Twenty Four Hours, <br> Book now and get the experience of a lifetime.</p>
	        </div>
	    </section>
	        <!-- End Home -->
	    <script type="text/javascript">
	        document.addEventListener("DOMContentLoaded", function() {
	            const urlParams = new URLSearchParams(window.location.search);
	            const status = urlParams.get('status');
	            
	            if (status === 'loggedOut') {
	                Swal.fire({
	                    title: 'Goodbye!',
	                    text: 'You have successfully logged out.',
	                    icon: 'success',
	                    confirmButtonText: 'OK'
	                });
	            }
	        });
    	</script>    
	</body>
</html>