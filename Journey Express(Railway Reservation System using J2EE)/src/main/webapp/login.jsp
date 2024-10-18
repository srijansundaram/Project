<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<title>Journey Express|SignIn</title>
		
		<!-- Font Icon -->
		<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
		
		<!-- Main css -->
		<link rel="stylesheet" href="css/styles.css">
		<link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
	</head>
	<body>
		<input type="hidden" id="status" value="<%= request.getAttribute("status") != null ? request.getAttribute("status") : "" %>">
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

		<div class="main">
			<br><br>
			<!-- Sing in  Form -->
			<section class="sign-in">
				<div class="container">
					<div class="signin-content">
						<div class="signin-image">
							<figure>
								<img src="images/signin-image.jpg" alt="sing up image">
							</figure>
							
						</div>
		
						<div class="signin-form">
							<h2 class="form-title">Sign In</h2>
							<form method="post" action="login" class="register-form"
								id="login-form">
								<div class="form-group">
									<label for="username"><i
										class="zmdi zmdi-account material-icons-name"></i></label> <input
										type="text" name="username" id="username"
										placeholder="Your Name" />
								</div>
								<div class="form-group">
									<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
										type="password" name="password" id="password"
										placeholder="Password" />
								</div>
								<div class="form-group">
									<input type="checkbox" name="remember-me" id="remember-me"
										class="agree-term" /> 
										<label for="remember-me" class="label-agree-term"><span><span></span></span>Remember
										me</label>
								</div>
								<div class="form-group form-button">
									<input type="submit" name="signin" id="signin" class="form-submit" value="Log in" />
								</div>
							</form>
							<div class="social-login">
								<span class="social-label">Or login with</span>
								<ul class="socials">
									<li><a href="#"><i
											class="display-flex-center zmdi zmdi-facebook"></i></a></li>
									<li><a href="#"><i
											class="display-flex-center zmdi zmdi-twitter"></i></a></li>
									<li><a href="#"><i
											class="display-flex-center zmdi zmdi-google"></i></a></li>
								</ul>
							</div>
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
			var status = document.getElementById("status").value;
			   console.log("Status:", status); 
			if(status == "failed"){
				Swal.fire({
					  title: 'Sorry!',
					  text: 'Wrong Username or Password.',
					  icon: 'error',
					  confirmButtonText: 'OK'
					});
			}
			/* If client side validation fails */
			if(status == "invalidEmail"){
				Swal.fire({
					  title: 'Sorry!',
					  text: 'Please Enter Username.',
					  icon: 'error',
					  confirmButtonText: 'OK'
					});
			}
			if(status == "invalidUpwd"){
				Swal.fire({
					  title: 'Sorry!',
					  text: 'Please Enter Password.',
					  icon: 'error',
					  confirmButtonText: 'OK'
					});
			}
			console.log(status); // Check what status is being retrieved

		    if (status === "success") {
		        Swal.fire({
		            title: 'Welcome!',
		            text: 'to Journey Express Admin Panel',
		            icon: 'success',
		            confirmButtonText: 'OK'
		        });
		    }
		</script>
	</body>
</html>