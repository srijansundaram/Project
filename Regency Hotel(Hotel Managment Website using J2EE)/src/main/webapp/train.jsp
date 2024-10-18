<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Journey Express | Add Train</title>
    <link href="css/styles.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .form-container {
        	margin-bottom: 12px;
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            width: 400px;
            max-width: 90%;
        }
        input, select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            background-color: #5cb85c;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        h2 {
            text-align: center;
            margin: 0 0 20px 0;
        }
        .flex-container {
            display: flex;
            justify-content: space-between;
            gap: 10px; /* Space between elements */
        }
        .flex-item {
            flex: 1; /* Make items flexible */
        }
        .flex-item-small {
            flex: 0 0 48%; /* Take up 48% of the width */
        }
    </style>
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
    <li><a href="logout" class="sign-in"><%= session.getAttribute("name") %></a></li>
</header>
    <div class="form-container">
        <h2>Add Train Details</h2>
        <form action="AddTrainServlet" method="POST">
            <div class="flex-container">
                <div class="flex-item">
                    <input type="text" name="trainId" placeholder="Train ID" required>
                </div>
                <div class="flex-item">
                    <input type="text" name="trainName" placeholder="Train Name" required>
                </div>
            </div>
            <div class="flex-container">
                <div class="flex-item-small">
                    <input type="text" name="sourceStation" placeholder="Source Station" required>
                </div>
                <div class="flex-item-small">
                    <input type="text" name="destinationStation" placeholder="Destination Station" required>
                </div>
            </div>
            <div class="flex-container">
                <div class="flex-item-small">
                    <select name="trainType" required>
                        <option value="" disabled selected>Select Train Type</option>
						<option value="Express">Superfast</option>
                        <option value="Express">Express</option>
                        <option value="Local">Local</option>
                        <option value="Intercity">Intercity</option>
                    </select>
                </div>
                <div class="flex-item-small">
                    <select name="availability" required>
                        <option value="" disabled selected>Select Availability</option>
                        <option value="Yes">Yes</option>
                        <option value="No">No</option>
                    </select>
                </div>
            </div>
            <div class="flex-container">
            <input type="text" name="serviceDays" placeholder="Service Days (e.g., Mon, Tue)" required>
            <input type="text" name="route" placeholder="Route" required>
            </div>
            <div class="flex-container">
                <div class="flex-item-small">
                    <input type="time" name="departureTime" required>
                     <div class="note">* 24-hour format</div>
                </div>
                <div class="flex-item-small">
                    <input type="time" name="arrivalTime" required>
                     <div class="note">* 24-hour format</div>
                </div>
            </div>
            <div class="flex-container">
				<input type="text" name="slfare" placeholder="Sl Fare" required>
				<input type="text" name="threeafare" placeholder="3A Fare" required>
           		<input type="text" name="twoafare" placeholder="2A Fare" required>
           		<input type="text" name="oneafare" placeholder="1A Fare" required>
           	</div>
           	<input type="number" name="availableSeats" placeholder="Available Seats" min="0" required>
            <button type="submit">Add Train</button>
        </form>
    </div>

     <script>
        // Check for message attribute from servlet
        <% 
            String message = (String) request.getAttribute("message"); 
            if (message != null) { 
        %>
            const message = "<%= message %>";
            if (message === "success") {
                Swal.fire({
                    title: 'Train Added Successfully',
                    text: 'The train details have been stored.',
                    icon: 'success',
                    confirmButtonText: 'OK'
                }).then(() => {
                    window.location.href = 'display_train.jsp'; // Redirect to train list page
                });
            } else {
                Swal.fire({
                    title: 'Error',
                    text: 'There was a problem adding the train. Please try again.',
                    icon: 'error',
                    confirmButtonText: 'OK'
                });
            }
        <% 
            } 
        %>
    </script>
</body>
</html>