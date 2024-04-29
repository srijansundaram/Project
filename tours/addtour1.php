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
        <!-- Add Tour confirm -->
        <?php
        if($conn === false){
			die("ERROR: Could not connect. "
				. mysqli_connect_error());
		}

		$tour_id = $_POST['id'];
		$tour_name = $_POST['name'];
		$tour_time = $_POST['time'];
		$tour_price = $_POST['price'];
        $imagename=$_POST["uploadedimage"];
        $tour_img = "img/cars".$imagename;
        $tour_availability = "yes";

        
		$sqlquery = "INSERT INTO tour VALUES ('$tour_id', '$tour_name', '$tour_time', '$tour_img', '$tour_price','$tour_availability')";
        $result1 = $conn->query($sqlquery);
		// Close connection
		mysqli_close($conn);
		?>
    		<div class="booking-img">
            <center>
            <br><br><br><br><br><br><br><br><br><br><br>
            <h1><span>Tour is </span>now available</h1>
            </center>
        </div>
    </body>
</html>

