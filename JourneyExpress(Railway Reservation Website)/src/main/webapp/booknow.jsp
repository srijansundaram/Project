<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Journey Express |Book Now</title>
    <link href="css/styles.css" rel="stylesheet">
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body style="margin: 0; padding: 0; height: 100vh; width: 100vw; display: flex; justify-content: center; align-items: center;">
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
    <!-- End Header -->
    <!-- Booking Form -->
    <div class="center-containerss">
        <h1 style="left: 300px;">
            <span style="color:#fe5b3d;">Book</span> Now
        </h1>
    </div>
    <div class="form-container" style = "background-color: rgba(255, 255, 255, 0.85);">
        <form action="bookingprocess.jsp" method="post">
            <div class="form-group">
                <div class="input-box">
                    <label for="origin">From</label>
                    <select name="origin" id="origin" required>
                    	<option value="">Select Origin</option>
	                    <!-- Populate dynamically using JSP -->
	                    <%
	                        String url = "jdbc:mysql://localhost:3306/journeyexpress";
	                        String user = "root";
	                        String password = "password";
	                        Connection conn = null;
	                        Statement stmt = null;
	                        ResultSet rs = null;
	
	                        try {
	                            Class.forName("com.mysql.cj.jdbc.Driver");
	                            conn = DriverManager.getConnection(url, user, password);
	                            stmt = conn.createStatement();
	                            rs = stmt.executeQuery("SELECT DISTINCT source_station FROM train");
	                            while (rs.next()) {
	                    %>
	                            <option value="<%= rs.getString("source_station") %>"><%= rs.getString("source_station") %></option>
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
                    <label for="destination">To</label>
                   	<select name="destination" id="destination" required>
                   		<option value="" disabled selected>Select Destination</option>
                	</select>
                </div>
            </div>
            <div class="form-group">
                <div class="input-box">
                    <label for="start-date">Journey Date</label>
                    <input type="date" name="start-date" id="start-date" required />
					<!-- Date should start from tommorow only  -->
					<script>
					    // Get today's date and set the min attribute to tomorrow
					    const today = new Date();
					    today.setDate(today.getDate() + 1); // Set to tomorrow
					    document.getElementById("start-date").min = today.toISOString().split("T")[0]; // Format as YYYY-MM-DD
					</script>

                </div>
                <div class="input-box">
                    <label for="name">Name</label>
                    <input type="search" name="name" id="name" placeholder="Enter Your Name" required>
                </div>
            </div>
            <div class= "form-group">
            	<div class="input-box">
                    <label>Berth Preference</label>
                    <div class="radio-group">
                        <label><input type="radio" name="berth" value="Side Lower" required> SL</label>
                        <label><input type="radio" name="berth" value="Side Upper" required> SU</label>
                        <label><input type="radio" name="berth" value="Lower" required> L</label>
                        <label><input type="radio" name="berth" value="Middle" required> M</label>
                        <label><input type="radio" name="berth" value="Upper" required> U</label>
                    </div>
                </div>
            	<div class="input-box">
                    <label>Class</label>
                    <div class="radio-group">
                        <label><input type="radio" name="class" value="SL" required> SL</label>
                        <label><input type="radio" name="class" value="3A" required> 3A</label>
                        <label><input type="radio" name="class" value="2A" required> 2A</label>
                        <label><input type="radio" name="class" value="1A" required> 1A</label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="input-box">
                    <label for="train">Choose Train</label>
                   	<select name="train" id="train" required>
                    	<option value="">Select Train</option>
                	</select>
                </div>
                <div class="input-box">
	                <label for="fare">Fare</label>
	                <input type="text" name="fare" id="fare" placeholder="Fare" required readonly style="width: 100%; padding: 8px; border-radius: 10px; border: 1px solid #ccc;">
            	</div>
            </div>
            <input type="hidden" name="trainId" id="trainId">
            <div class="form-group" style="display: flex; justify-content: space-between; margin-bottom: 15px;">
            	<div class="input-box" style="flex: 1; margin-right: 10px;">
	                <label for="departure-time">Departure Time</label>
	                <input type="text" name="departure-time" id="departure-time" placeholder="Departure Time" required readonly style="width: 100%; padding: 8px; border-radius: 10px; border: 1px solid #ccc;">
            	</div>
            	<div class="input-box" style="flex: 1;">
	                <label for="arrival-time">Arrival Time</label>
	               <input type="text" name="arrival-time" id="arrival-time" placeholder="Arrival Time" required readonly style="width: 100%; padding: 8px; border-radius: 10px; border: 1px solid #ccc;">
            	</div>
        	</div>
            <div class="form-group">
                <div class="input-box">
                    <label for="age">Age</label>
                    <input type="number" name="age" id="age" placeholder="Enter your Age" min="1" required>
                </div>
                <div class="input-box">
                    <label for="mobile">Mobile Number</label>
                    <input type="tel" name="mobile" id="mobile" placeholder="Enter your Mobile Number" required>
                </div>
            </div>
            <button type="submit">Book Now</button>
        </form>
    </div>
    <script>
    $(document).ready(function() {
        $('#origin').change(function() {
            var origin = $(this).val();
            $.ajax({
                type: "POST",
                url: "fetch_destinations.jsp",
                data: { origin: origin },
                success: function(data) {
                    $('#destination').html(data);
                    $('#destination').val(''); // Reset destination selection
                    $('#train').html('<option value="">Select Train</option>'); // Reset train dropdown
                    $('#trainId').val(''); // Clear train ID
                    $('#departure-time').val(''); // Clear departure time
                    $('#arrival-time').val(''); // Clear arrival time
                }
            });
        });

        $('#destination').change(function() {
            var origin = $('#origin').val();
            var destination = $(this).val();
            $.ajax({
                type: "POST",
                url: "fetch_trains.jsp",
                data: { origin: origin, destination: destination },
                success: function(data) {
                    $('#train').html(data);
                    $('#train').val(''); // Reset train selection
                    $('#trainId').val(''); // Clear train ID
                    $('#departure-time').val(''); // Clear departure time
                    $('#arrival-time').val(''); // Clear arrival time
                }
            });
        });

        $('#train').change(function() {
            var selectedOption = $(this).find('option:selected');
            var trainId = selectedOption.data('id');
            $('#trainId').val(trainId);

            $.ajax({
                type: "POST",
                url: "fetch_times.jsp",
                data: { trainId: trainId },
                success: function(data) {
                    console.log("Raw response data:", data);
                    // Check if data is a string
                    if (typeof data === "string") {
                        try {
                            var times = JSON.parse(data);
                            $('#departure-time').val(times.departure);
                            $('#arrival-time').val(times.arrival);
                        } catch (e) {
                            console.error("Error parsing JSON:", e);
                        }
                    } else {
                        // If it's already an object
                        $('#departure-time').val(data.departure);
                        $('#arrival-time').val(data.arrival);
                    }
                },
                error: function(xhr, status, error) {
                    console.error("AJAX Error: ", status, error);
                }
            });

        });
        $('#train').change(function() {
            var selectedOption = $(this).find('option:selected');
            var trainId = selectedOption.data('id');
            $('#trainId').val(trainId);

            // Fetch fare information based on selected train
            $.ajax({
                type: "POST",
                url: "fetch_fare.jsp",
                data: { trainId: trainId },
                dataType: "json", // Expecting JSON response
                success: function(fareInfo) {
                    console.log("Fare data received:", fareInfo);

                    // Ensure fareInfo is an object
                    if (fareInfo && !fareInfo.error) {
                        var selectedClass = $('input[name="class"]:checked').val();
                        setFare(fareInfo, selectedClass);

                        // Update fare when class changes
                        $('input[name="class"]').change(function() {
                            selectedClass = $(this).val();
                            setFare(fareInfo, selectedClass);
                        });
                    } else {
                        console.error("Error in fare data:", fareInfo.error);
                    }
                },
                error: function(xhr, status, error) {
                    console.error("AJAX Error: ", status, error);
                    console.error("Response Text:", xhr.responseText); // Log the raw response
                }
            });
        });

        function setFare(fareInfo, selectedClass) {
            console.log("Setting fare for class:", selectedClass);
            switch (selectedClass) {
                case 'SL':
                    $('#fare').val(fareInfo.sl_fare);
                    break;
                case '3A':
                    $('#fare').val(fareInfo.three_a_fare);
                    break;
                case '2A':
                    $('#fare').val(fareInfo.two_a_fare);
                    break;
                case '1A':
                    $('#fare').val(fareInfo.one_a_fare);
                    break;
                default:
                    $('#fare').val(''); // Clear if no valid class selected
            }
        }
    });

	</script>   

</body>
</html>
