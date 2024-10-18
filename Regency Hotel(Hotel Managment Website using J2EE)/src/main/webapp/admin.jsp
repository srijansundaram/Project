<%
	if (session.getAttribute("name") == null) {
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>Regency Hotel| Admin</title>
		<link href="css/styles.css" rel="stylesheet" />
		<style>
			body {
				display: flex;
				flex-direction: column;
				justify-content: center;
				align-items: center;
				height: 100vh; /* Full height of the viewport */
				margin: 0; /* Remove default margin */
				text-align: center; /* Center text */
			}
			.admin {
				display: flex;
				flex-direction: column;
				justify-content: center;
				align-items: center;
			}
			.avatar {
				width: 400px; /* Adjust size as needed */
				height: auto; /* Adjust size as needed */
				border-radius: 50%; /* Circular avatar */
			}
			h1 {
				margin-top: 20px; /* Space between avatar and text */
				font-size: 24px; 
    			color: #d9d5d4; /* Primary color */
			}
			span{
				color: #edc8ac;
			}
		</style>
	</head>
	<body>
		<header style="position: fixed; width: 100%;">
			<a href="admin.jsp" class="logo"><img src="images/logo.png" alt=""></a>
				<div class="bx bx-menu" id="menu-icon"></div>
				<ul class="navbar">
					<li><a href="admin.jsp">Home</a></li>
					<li><a href="display_booking.jsp">Booked Rooms</a></li>
					<li><a href="display_room.jsp">Room Details</a></li>
					<li><a href="display_team.jsp">Team Details</a></li>
					<li><a href="display_query.jsp">Query</a></li>
				</ul>
				<li> <a href="logout" class="sign-in"><%= session.getAttribute("name") %></a></li>
		</header>
		<!-- Logo Image -->
		<div class="admin">
			<img class="avatar" src="images/logo.png" alt="Company Logo"/>
			<h1><span>Welcome</span> to <span>Regency Hotel</span> Admin Panel</h1>
		</div>
		<input type="hidden" id="status" value="<%= request.getAttribute("status") != null ? request.getAttribute("status") : "" %>">

		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
		<script type="text/javascript">
			document.addEventListener("DOMContentLoaded", function() {
				var status = document.getElementById("status").value;
				console.log("Status:", status); // Debugging line
				if (status === "success") {
					Swal.fire({
						title: 'Welcome!',
						text: 'to Journey Express Admin Panel',
						icon: 'success',
						confirmButtonText: 'OK'
					});
				}
			});
		</script>
	</body>
</html>
