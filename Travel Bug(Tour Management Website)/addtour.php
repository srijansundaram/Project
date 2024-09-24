<!DOCTYPE html>
<html lang="en">
    <?php 
        session_start(); 
        require 'connection.php';
        $conn = Connect();
    ?>
    <head>
        <meta charset="UTF-8">
        <title>Travel Bug | Add Tour</title>
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
        <!-- Add Tour -->
        <section class="booking">
            <div class="booking-img">
                <h1><span>Add</span> a new tour now!</h1>
            </div>
            <div class="bookingcontainer">  
                <form action="addtour1.php" method="POST">
                    <div class="input-box">
                        <span style="color: #fff">Tour Id:</span>
                        <input type="text" name="id" placeholder="Tour Id"required="">
                    </div>
                    <div class="input-box">
                        <span style="color: #fff">Tour Name:</span>
                        <input type="text" name="name" placeholder="Tour Name"required="">
                    </div>
                    <div class="input-box">
                        <span style="color: #fff">Tour Time:</span>
                        <input type="text" name="time" placeholder="Tour Time"required="">
                    </div>
                    <div class="input-box">
                        <span style="color: #fff">Tour Price:</span>
                        <input type="text" name="price" placeholder="Tour Price"required="">
                    </div>
                    <div class="input-box">
                    <span style="color: #fff">Tour Image:</span>
                    <input name="uploadedimage" type="file">
                    </div>
                    <div class="input-box">
                    <span style="color: #fff">Tour Itinerary:</span>
                    <input name="uploadedit" type="file">
                    </div>
                    <br>
                    <div class="btn">
                        <input type="submit"name="submit" value="Add Now" class="btn">  
                    </div>
                            
                </form>
            </div>

        </section>
            <!-- endTour -->