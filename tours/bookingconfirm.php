<!DOCTYPE html>
<html lang="en">
    <?php 
        session_start(); 
        require 'connection.php';
        $conn = Connect();
    ?>
    <head>
        <meta charset="UTF-8">
        <title>Travel Bug | Confirmation</title>
        <!-- Link to CSS -->
        <link rel="stylesheet" href="style.css"> 
        <!-- Box Icons -->
        <link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    </head>
    <body>
            <header style="position: fixed;">
            <a href="home.php" class="logo"><img src="img/jeep.png" alt=""></a>

            <div class="bx bx-menu" id="menu-icon"></div>
            <ul class="navbar">
                <li><a href="index.php">Home</a></li>
                <li><a href="tour.php">Tour</a></li>
                <li><a href="packages.php">Packages</a></li>
                <li><a href="about.php">About us</a></li>
                <li><a href="reviews.php">Reviews</a></li>
                <li><a href="contactus.php">Contact us</a></li>
            </ul>
            <div class="header-btn">
                <a href="signin.php" class="sign-in">Sign In</a>
            </div>
            </header>
        <!-- End Header -->
        <!-- Booking confirm -->
        <?php
        if($conn === false){
			die("ERROR: Could not connect. "
				. mysqli_connect_error());
		}

		$customer_name = $_POST['name'];
		$customer_address = $_POST['address'];
		$customer_email = $_POST['email'];
		$customer_mobile = $_POST['mobile'];
        $tour_start_date =  date('Y-m-d', strtotime($_POST['start_date']));
        $tour_id = $conn->real_escape_string($_POST['hidden_tourid']);
        $tour_name = $conn->real_escape_string($_POST['hidden_tourname']);
        $fare = "NA";
        

        $sql0 = "SELECT * FROM tour WHERE tour_id = '$tour_id'";
        $result0 = $conn->query($sql0);
        if (mysqli_num_rows($result0) > 0) {
            while($row0 = mysqli_fetch_assoc($result0)) {
                $fare = $row0["tour_price"];
            }
        }
        
		$sqlquery = "INSERT INTO bookedtours VALUES ('$tour_id', '$tour_name', '$customer_name', '$customer_address', '$customer_email', '$customer_mobile','$tour_start_date', '$fare')";
        $result1 = $conn->query($sqlquery);
		// Close connection
		mysqli_close($conn);
		?>
    	<div class="booking-img">
            <center>
            <br><br><br><br><br><br><br><br><br><br><br>
            <h1><span>Booking Confirmed</span></h1>
            <h2 style="color: #fff">Thank you for using Travel Bug! We wish you have a safe trip.</h2>
            <h3 style="color: #a6b1b1">Your booking has been received and placed into our order processing system.</h3>
            </center>
        </div>
    </body>
</html>

