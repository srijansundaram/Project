<!DOCTYPE html>
<html lang="en">
    <?php 
        session_start(); 
        require 'connection.php';
        $conn = Connect();
    ?>
    <head>
        <meta charset="UTF-8">
        <title>Travel Bug | Reviews</title>
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
        <!-- Reviews -->
        <section class="reviews" id="reviews">
            <div class="heading">
                <span>Reviews</span>
                <h1>Whats Our Customer Say</h1>
            </div>
            <div class="reviews-container">
                <div class="box">
                    <div class="rev-img">
                       <img src="img/rev1.jpg" alt=""> 
                    </div>
                    <h2>Dogesh Rathod</h2>
                    <div class="stars">
                        <i class="bx bxs-star" > </i>
                        <i class="bx bxs-star" > </i>
                        <i class="bx bxs-star" > </i>
                        <i class="bx bxs-star" > </i>
                        <i class="bx bxs-star-half" > </i>
                    </div>
                    <p>My recent trip with Travel Bug was nothing short of extraordinary! From the moment I booked my journey until the final farewell, 
                        every detail was flawlessly executed. The itinerary was meticulously planned, allowing me to explore iconic landmarks while also 
                        immersing myself in the local culture. Thanks to Travel Bug, I've made memories that will last a lifetime.Can't wait to plan my next adventure with them!
                    </p>     
                </div>

                <div class="box">
                    <div class="rev-img">
                       <img src="img/rev2.jpg" alt=""> 
                    </div>
                    <h2>Aditya Singh</h2>
                    <div class="stars">
                        <i class="bx bxs-star" > </i>
                        <i class="bx bxs-star" > </i>
                        <i class="bx bxs-star" > </i>
                        <i class="bx bxs-star" > </i>
                        <i class="bx bx-star" > </i>
                    </div>
                    <p>Travel Bug's attention to detail was impeccable from seamless transportation arrangements to personalized guided tours, every aspect of 
                        our trip was carefully curated. The memories we made together are priceless, and we're grateful to Travel Bug for making our dream 
                        vacation a reality.We'll definitely be returning for more adventures in the future!
                    </p>     
                </div>

                <div class="box">
                    <div class="rev-img">
                       <img src="img/rev3.jpg" alt=""> 
                    </div>
                    <h2>Disha Bhatnagar</h2>
                    <div class="stars">
                        <i class="bx bxs-star" > </i>
                        <i class="bx bxs-star" > </i>
                        <i class="bx bxs-star" > </i>
                        <i class="bx bxs-star" > </i>
                        <i class="bx bxs-star" > </i>
                    </div>
                    <p>As a seasoned traveler, I've had my fair share of experiences with tour companies, but Travel Bug truly stands out from the rest. Not only did 
                        they offer competitive pricing, but the value they provided far exceeded my expectations. From the moment I inquired about their tours, their 
                        team was responsive and accommodating, addressing all my concerns with professionalism and care.
                    </p>     
                </div>
            </div>
        </section>
        <!-- End Reviews -->
    </body>
</html>