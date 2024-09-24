<!DOCTYPE html>
<html lang="en">
    <?php 
        session_start(); 
        require 'connection.php';
        $conn = Connect();
    ?>
    <head>
        <meta charset="UTF-8">
        <title>Travel Bug | Sign Up</title>
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
        <!-- Sign Up -->
        <section class="booking">
            <div class="login-img">
                <h1><span>Travel Bug - </span> Employee Panel</h1>
            </div>
            <div class="bookingcontainer">  
                <form action="signup_client.php" method="POST">
                    <div class="input-box">
                        <span style="color: tan">Username</span>
                        <input type="text" name="client_username" id="" placeholder="Username" required>
                    </div>
                    <div class="input-box">
                        <span style="color: tan">Full Name</span>
                        <input type="text" name="client_name" id="" placeholder="FullName" required>
                    </div>
                    <div class="input-box">
                        <span style="color: tan">Mobile</span>
                        <input type="text" name="client_phone" id="" placeholder="Mobile" required>
                    </div>
                    <div class="input-box">
                        <span style="color: tan">Email</span>
                        <input type="text" name="client_email" id="" placeholder="Email" required>
                    </div>
                    <div class="input-box">
                        <span style="color: tan">Address</span>
                        <input type="text" name="client_address" id="" placeholder="Address" required>
                    </div>
                    <div class="input-box">
                        <span style="color: tan">Password</span>
                        <input type="text" name="client_password" placeholder="Password"required="">
                    </div>
                    <br>
                    <div class="btn">
                        <input type="submit"name="submit" value="Sign Up" class="btn">  
                    </div>
                </form>
                
            </div>
        </section>
        <!-- End Sign-Up -->
    </body>
</html>
        