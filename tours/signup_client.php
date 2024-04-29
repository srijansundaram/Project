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
                <li><a href="home.php">Home</a></li>
                <li><a href="availtour.php">Available Tour</a></li>
                <li><a href="bookedtour.php">Booked Tour</a></li>
                <li><a href="addtour.php">Add Tour</a></li>
                <li><a href="query.php">Query</a></li>
            </ul>
            <div class="header-btn">
                <a href="signup.php" class="">Sign Up</a>
                <a href="signout.php" class="sign-in">Sign Out</a>
            </div>
        </header>
        <!-- End Header -->
        <!-- Sign up Confirmation -->
        <?php
        if($conn === false){
			die("ERROR: Could not connect. "
				. mysqli_connect_error());
		}

		$client_username = $_POST['client_username'];
		$client_name = $_POST['client_name'];
		$client_phone = $_POST['client_phone'];
		$client_email = $_POST['client_email'];
		$client_address = $_POST['client_address'];
		$client_password = $_POST['client_password'];


        
		$sqlquery = "INSERT INTO clients VALUES ('$client_username', '$client_name', '$client_phone', '$client_email', '$client_address','$client_password')";
        $result1 = $conn->query($sqlquery);
		// Close connection
		mysqli_close($conn);
		?>
    		<div class="booking-img">
            <center>
            <br><br><br><br><br><br><br><br><br><br><br>
            <h1><span>Welcome to </span>Travel Bug</h1>
            <h2 style="color: #fff">Kindly Sign-In using your credentials.</h2>
            </center>
        </div>
    </body>
</html>

