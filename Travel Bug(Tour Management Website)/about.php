<!DOCTYPE html>
<html lang="en">
    <?php 
        session_start(); 
        require 'connection.php';
        $conn = Connect();
    ?>
    <head>
        <meta charset="UTF-8">
        <title>Travel Bug| About</title>
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
        <!-- About --> 
        <section class="about" id="about">
            <div class="heading">
                <span>About Us</span>
                <h1>Best Customer Experience</h1>
            </div>
            <div class="about-container">
                <div class="about-text">
                    <p>Welcome to Travel Bug, your ultimate companion in exploration and adventure! At Travel Bug, we believe that every journey is an 
                        opportunity to discover the wonders of the world and create unforgettable memories. With our passion for travel and commitment to
                        excellence, we strive to provide unparalleled experiences tailored to your desires.
                    </p>
                    <p>Founded on the principle of wanderlust, Travel Bug is dedicated to crafting bespoke itineraries that cater to your unique interests, whether 
                        you're a thrill-seeker craving adrenaline-pumping adventures, a culture enthusiast yearning to immerse yourself in the richness of diverse 
                        traditions, or a nature lover seeking solace in breathtaking landscapes.
                    </p>
                </div>
            </div>
        </section>
        <!-- End About --> 
    </body>
</html>