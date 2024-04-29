<!DOCTYPE html>
<html lang="en">
    <?php 
        session_start(); 
        require 'connection.php';
        $conn = Connect();
    ?>
    <head>
        <meta charset="UTF-8">
        <title>Travel Bug | Itinerary</title>
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
        <!-- Itinerary -->
        <section class="itinerary">
            <?php
                $tour_id = $_GET["id"];
                $sql1 = "SELECT * FROM tour WHERE tour_id = '$tour_id'";  
                $result1 = mysqli_query($conn, $sql1);
                            
                if(mysqli_num_rows($result1)){
                    while($row1 = mysqli_fetch_assoc($result1)){
                        $tour_id = $row1["tour_id"];
                        $tour_it = $row1["tour_it"];
                    }
                }
            ?>
            <div class="itimg">
                <br>
                <img src="<?php echo $tour_it;?>" style="float:right" alt="Itinerary Image">
            </div>
        </section>
