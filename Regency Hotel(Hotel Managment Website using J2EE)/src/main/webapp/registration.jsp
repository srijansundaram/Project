<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<title>Regency Hotel|Sign Up</title>
		
		<!-- Font Icon -->
		<link rel="stylesheet"
			href="fonts/material-icon/css/material-design-iconic-font.min.css">
		
		<!-- Main css -->
		<link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/styles.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
	</head>
	<body>
		<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
		<header style="position: fixed;">
			<a href="index.jsp" class="logo"><img src="images/logo.png" alt=""></a>
				<div class="bx bx-menu" id="menu-icon"></div>
	            	<ul class="navbar">
		<li><a href="admin.jsp">Home</a></li>
			<li><a href="display_booking.jsp">Booked Rooms</a></li>
			<li><a href="display_room.jsp">Room Details</a></li>
			<li><a href="display_team.jsp">Team Details</a></li>
			<li><a href="display_query.jsp">Query</a></li>
    </ul>
    <li><a href="logout" class="sign-in"><%= session.getAttribute("name") %></a></li>
		</header>
	    <!-- End Header -->
		<div class="main">
			<br>
	
			<!-- Sign up form -->
			<br><br><br><br>
			<section class="signup">
				<div class="signupcontainer">
					<div class="signup-content">
						<div class="signup-form">
							<h2 class="form-title">Sign up</h2>
						
							<form method="post" action="register" class="register-form"
								id="register-form">
								<div class="form-group">
									<label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label> 
									<input type="text" name="name" id="name" placeholder="Your Name"/>
								</div>
								<div class="form-group">
									<label for="email"><i class="zmdi zmdi-email"></i></label> 
									<input type="email" name="email" id="email" placeholder="Your Email"/>
								</div>
								<div class="form-group">
									<label for="pass"><i class="zmdi zmdi-lock"></i></label> 
									<input type="password" name="pass" id="pass" placeholder="Password"/>
								</div>
								<div class="form-group">
									<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
									<input type="password" name="re_pass" id="re_pass" placeholder="Repeat your password" />
								</div>
								<div class="form-group">
									<label for="contact"><i class="zmdi zmdi-lock-outline"></i></label>
									<input type="text" name="contact" id="contact" placeholder="Contact no" />
								</div>
								<div class="form-group">
									<input type="checkbox" name="agree-term" id="agree-term" class="agree-term" /> 
									<label for="agree-term" class="label-agree-term"><span><span></span></span>I
										agree all statements in <a href="#" class="term-service">Terms of service</a></label>
								</div>
								<div class="form-group form-button">
									<input type="submit" name="signup" id="signup" class="form-submit" value="Register" />
								</div>
							</form>
						</div>
						<div class="signup-image">
							<figure>
								<img src="images/signup-image.jpg" alt="sing up image">
							</figure>
							<a href="login.jsp" class="signup-image-link">I am already
								member</a>
						</div>
					</div>
				</div>
			</section>
	
	
		</div>
		<!-- JS -->
		<script src="vendor/jquery/jquery.min.js"></script>
		<script src="js/main.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

		<script type="text/javascript">
		  // Ensure the script runs after the DOM has fully loaded
		  document.addEventListener('DOMContentLoaded', function () {
		    var status = document.getElementById("status").value;
		
		    if (status === "success") {
		      Swal.fire({
		        title: 'Success!',
		        text: 'You can LogIn now using your email.',
		        icon: 'success',
		        confirmButtonText: 'OK'
		      });
		    } else if (status === "invalidName") {
		      Swal.fire({
		        title: 'Sorry!',
		        text: 'Please Enter Name.',
		        icon: 'error',
		        confirmButtonText: 'OK'
		      });
		    } else if (status === "invalidEmail") {
		      Swal.fire({
		        title: 'Sorry!',
		        text: 'Please Enter Email.',
		        icon: 'error',
		        confirmButtonText: 'OK'
		      });
		    } else if (status === "invalidUpwd") {
		      Swal.fire({
		        title: 'Sorry!',
		        text: 'Please Enter Password.',
		        icon: 'error',
		        confirmButtonText: 'OK'
		      });
		    } else if (status === "invalidConfirmpwd") {
		      Swal.fire({
		        title: 'Sorry!',
		        text: 'Confirm Password does not match with the current password.',
		        icon: 'error',
		        confirmButtonText: 'OK'
		      });
		    } else if (status === "invalidUmobile") {
		      Swal.fire({
		        title: 'Sorry!',
		        text: 'Please Enter Mobile Number.',
		        icon: 'error',
		        confirmButtonText: 'OK'
		      });
		    } else if (status === "invalidUmobilelength") {
		      Swal.fire({
		        title: 'Sorry!',
		        text: 'Mobile Number should be of 10 digits.',
		        icon: 'error',
		        confirmButtonText: 'OK'
		      });
		    }
		  });
		</script>

	</body>
</html>