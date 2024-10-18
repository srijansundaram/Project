<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Regency Hotel|Availability</title>
		<link href="css/styles.css" rel="stylesheet" />
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	</head>
	<body style="margin: 0; padding: 0; height: 100vh; width: 100vw; display: flex; 
		justify-content: center; align-items: center;">
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
	    <!-- Availability -->
		<div class="center-containers" >
	        <h1>
	            <span style="color:#fe5b3d;">Check</span> Availability
	        </h1>
   		</div>	
		<div class="form-container" style = "background-color: rgba(255, 255, 255, 0.85);">
		    <form action="display_availability.jsp" method="post">
		        <div class="form-group">
		        	<div class="input-box">
		                <label for="origin">Room Type</label>
						<select name="origin" id="origin" required>
                    	<option value="">Select Room</option>
	                    <!-- Populate dynamically using JSP -->
	         <%
	                        String url = "jdbc:mysql://localhost:3306/hotel";
	                        String user = "root";
	                        String password = "password";
	                        Connection conn = null;
	                        Statement stmt = null;
	                        ResultSet rs = null;
	
	                        try {
	                            Class.forName("com.mysql.cj.jdbc.Driver");
	                            conn = DriverManager.getConnection(url, user, password);
	                            stmt = conn.createStatement();
	                            rs = stmt.executeQuery("SELECT DISTINCT RoomType FROM Room");
	                            while (rs.next()) {
	                    %>
	                            <option value="<%= rs.getString("RoomType") %>"><%= rs.getString("RoomType") %></option>
	                    <%
	                            }
	                        } catch (Exception e) {
	                            e.printStackTrace();
	                        } finally {
	                            if (rs != null) rs.close();
	                            if (stmt != null) stmt.close();
	                            if (conn != null) conn.close();
	                        }
	                    %> 
                	</select>
		         	</div>
		  	        <div class="input-box">
		            <label for="start-date">Check-In Date</label>
		             <input type="date" name="start-date" id="start-date" required />
					<!-- Date should start from tommorow only  -->
					<script>
					    // Get today's date and set the min attribute to tomorrow
					    const today = new Date();
					    today.setDate(today.getDate() + 1); // Set to tomorrow
					    document.getElementById("start-date").min = today.toISOString().split("T")[0]; // Format as YYYY-MM-DD
					</script>
		        </div>
		        </div>
	
		        <button type="submit" class="btn">Check Availability</button>
		    </form>
		</div>
	</body>
</html>