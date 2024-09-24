<!DOCTYPE html>
<html lang="en">
    <?php 
        session_start(); 
        require 'connection.php';
        $conn = Connect();
    ?>
    <head>
        <meta charset="UTF-8">
        <title>Travel Bug | Contact Us</title>
        <!-- Link to CSS -->
        <link rel="stylesheet" href="style.css"> 
        <!-- Box Icons -->
        <link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- JS -->
        <script type="text/javascript" src="angular.min.js"> </script>
    </head>
    <body ng-app="">
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
        <!-- Contact -->
        <section class="booking">
            <div class="booking-img">
                <h1><span>Contact</span> Us</h1>
            </div>
            <div class="bookingcontainer">  
                        <form action="contact.php" method="POST">
                            <div class="input-box">
                                <span style="color: #fff">Enter Your Name:</span>
                                <input type="text" name="name" placeholder="Full Name"required="">
                            </div>
                            <div class="input-box">
                                <span style="color: #fff">Email:</span>
                                <input type="text" name="email" placeholder="Email"required="">
                            </div>
                            <div class="input-box">
                                <span style="color: #fff">Mobile Number:</span>
                                <input type="text" name="mobile" placeholder="Mobile Number"required="">
                            </div>
                            <div class="input-box">
                                <span style="color: #fff">Subject:</span>
                                <input type="text" name="subject" placeholder="Subject"required="">
                            </div>
                            <br>
                            <div class="btn">
                            <input type="submit"name="submit" value="Contact Us" class="btn">  
                            </div>
                        
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Booking -->
        </body>
</html>

