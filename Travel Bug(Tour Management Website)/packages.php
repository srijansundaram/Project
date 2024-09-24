<!DOCTYPE html>
<html lang="en">
    <?php 
        session_start(); 
        require 'connection.php';
        $conn = Connect();
    ?>
    <head>
        <meta charset="UTF-8">
        <title>Travel Bug | Packages</title>
        <!-- Link to CSS -->
        <link rel="stylesheet" href="style.css"> 
        <!-- Box Icons -->
        <link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    </head>
    <body>
        <header>
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
        <!-- Packages -->
        <section class="packages" id="packages">
        <div class="signheading">
            <br><h1>Experience Seamless Travel <br> with Our Packages</h1>
        </div>
        <section class="menu-content">
            <!-- PHP code for tour listing -->
            <?php   
            $sql1 = "SELECT * FROM tour WHERE tour_availability='yes'";
            $result1 = mysqli_query($conn,$sql1);

            if(mysqli_num_rows($result1) >= 0) {
                while($row1 = mysqli_fetch_assoc($result1)){
                    $tour_id = $row1["tour_id"];
                    $tour_name = $row1["tour_name"];
                    $tour_time = $row1["tour_time"];
                    $tour_price = $row1["tour_price"];
                    $tour_img = $row1["tour_img"];
                    ?>
            <div class="flip-card">
                <a href="booking.php?id=<?php echo($tour_id) ?>"></a>
                <div class="flip-card-inner">
                    <div class="flip-card-front">
                        <img src="<?php echo $tour_img; ?>" alt="Card image cap" style="width:250px; height:250px;">
                    </div>
                    <div class="flip-card-back">
                        <h4><b> <?php echo $tour_name; ?> </b></h4>
                        <h4><b> <?php echo $tour_time; ?> </b></h4>
                        <h4><b><?php echo ("Rs. " . $tour_price); ?> </b></h4>
                        <a href="booking.php?id=<?php echo($tour_id) ?>"><input type="submit" value="Book Now" name="" id="" class="btn"></a>
                        <a href="iti.php?id=<?php echo($tour_id) ?>"><input type="submit" value="Check Itinerary" name="" id="" class="btn"></a>
                    </div> 
                </div>
            </div>
            <?php }}
            else {
                ?>
            <h1> No packages available </h1>
            <?php
            }
            ?>                                   
        </section>          
        <!-- End Packages -->
    </body>
</html>