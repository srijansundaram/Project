<!DOCTYPE html>
<html lang="en">
    <?php 
        session_start(); 
        require 'connection.php';
        $conn = Connect();
    ?>
    <head>
        <meta charset="UTF-8">
        <title>Travel Bug | Booking</title>
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
        <!-- Booking -->
        <section class="booking">
            <?php
                $tour_id = $_GET["id"];
                $sql1 = "SELECT * FROM tour WHERE tour_id = '$tour_id'";  
                $result1 = mysqli_query($conn, $sql1);
                            
                if(mysqli_num_rows($result1)){
                    while($row1 = mysqli_fetch_assoc($result1)){
                        $tour_id = $row1["tour_id"];
                        $tour_name = $row1["tour_name"];
                        $tour_time = $row1["tour_time"];
                        $tour_price = $row1["tour_price"];
                        $tour_img = $row1["tour_img"];
                    }
                }
            ?>
            <div class="booking-img">
                <h1><span>Book</span> your tour now!</h1>
            </div>
            <div class="bookingcontainer">  
                        <form action="bookingconfirm.php" method="POST">
                            <div class="input-box">
                                <span style="color: #fff">Enter Your Name:</span>
                                <input type="text" name="name" placeholder="Full Name"required="">
                            </div>
                            <div class="input-box">
                                <span style="color: #fff">Address:</span>
                                <input type="text" name="address" placeholder="Address"required="">
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
                                <span style="color: #fff">
                                    Selected Tour:&nbsp;  <?php echo($tour_name);?>
                                </span>
                            </div>
                            <div class="input-box">
                                <?php $today = date("Y-m-d") ?>
                                <span style="color: #fff">Trip Start Date:</span>
                                <input type="date" name="start_date" min="<?php echo($today);?>" required="">
                            </div>
                            <div class="input-box"> 
                                <span style="color: #fff">Fare: <?php echo ("Rs. " . $tour_price); ?></span>  
                            </div>
                            <input type="hidden" name="hidden_tourid" value="<?php echo $tour_id; ?>">
                            <input type="hidden" name="hidden_tourname" value="<?php echo $tour_name; ?>">
                            <br>
                            <div class="btn">
                            <input type="submit"name="submit" value="Book Now" class="btn">  
                            </div>
                        
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Booking -->
        </body>
</html>

