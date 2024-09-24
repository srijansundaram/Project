<!DOCTYPE html>
<html lang="en">
    <?php 
        session_start(); 
        require 'connection.php';
        $conn = Connect();
    ?>
    <head>
        <meta charset="UTF-8">
        <title>Travel Bug | Tour</title>
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
        <!-- Tour -->
        <section class="tour" id="tour">
            <div class="heading">
                <span>How It Works</span>
                <h1>Book With 3 Easy Steps</h1>
            </div>
            <br>
            <div class="tour-container">
                <div class="box">
                    <i class="bx bxs-map"></i>
                    <h2>Choose A Location</h2>
                    <p>You don't have to worry. Our services are available across across the globe. 
                        Just enter your location.
                    </p>
                </div>

                <div class="box">
                    <i class="bx bxs-calendar-check"></i>
                    <h2>Trip Date</h2>
                    <p>Whether it's a weekday or a weekend, we're here to make your trip hassle-free. Feel free to 
                        schedule your trip any time that you're able.
                    </p>
                </div>

                <div class="box">
                    <i class="bx bxs-calendar-star"></i>
                    <h2>Book A Trip</h2>
                    <p>The tour packages of our company offers a wide variety of locations for every budget. Feel free to 
                        choose the location according to your desire.
                    </p>
                </div>
            </div>
        </section>
        <!-- End Tour -->
    </body>
</html>