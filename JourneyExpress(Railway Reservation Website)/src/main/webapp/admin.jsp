<%
	if (session.getAttribute("name")==null){
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>Journey Express|Admin</title>
		<link href="css/styles.css" rel="stylesheet" />
	</head>
	<body>
		<header style="position: fixed;">
			<a href="admin.jsp" class="logo"><img src="images/logo.png" alt=""></a>
				<div class="bx bx-menu" id="menu-icon"></div>
	            	<ul class="navbar">
		                <li><a href="admin.jsp">Home</a></li>
		                <li><a href="display_booking.jsp">Booked Tickets</a></li>
		                <li><a href="display_seat.jsp">Seat Availability</a></li>
		                <li><a href="display_train.jsp">Train Details</a></li>
		                <li><a href="display_team.jsp">Team Details</a></li>
		                <li><a href="display_query.jsp">Query</a></li>
	            	</ul>
	            		<li> <a href="logout" class="sign-in"><%= session.getAttribute("name") %></a></li>
		</header>
				<!-- Logo Image-->
		<br><br><br><br><br><br>
    	<div class="admin">
    		<br><br><br>
        	<img class="avatar" src="images/logo.png" alt="Company Logo"/>
        	<h1><span>Welcome</span> to <span>Journey Express</span> Admin Panel</h1>
    	</div>
	</body>
</html>
