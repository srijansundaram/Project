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
        <!-- Contact Confirmation -->
        <?php
            if($conn === false){
                die("ERROR: Could not connect. "
                    . mysqli_connect_error());
            }

            $name = $_POST['name'];
            $email = $_POST['email'];
            $mobile = $_POST['mobile'];
            $subject = $_POST['subject'];
            
            $sqlquery = "INSERT INTO query VALUES ('$name', '$email','$mobile','$subject')";
            $result1 = $conn->query($sqlquery);
            // Close connection
            mysqli_close($conn);
        ?>
		<div class="booking-img">
            <center>
            <br><br><br><br><br><br><br><br><br><br><br><br><br>
            <h1><span>We will Contact</span> you soon..</h1>
            </center>
        </div>
    </body>

</html>
