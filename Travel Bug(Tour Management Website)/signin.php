<!DOCTYPE html>
<html lang="en">
    <?php 
        session_start(); 
        require 'connection.php';
        $conn = Connect();
    ?>
    <head>
        <meta charset="UTF-8">
        <title>Travel Bug | Sign-In</title>
        <!-- Link to CSS -->
        <link rel="stylesheet" href="style.css"> 
        <!-- Box Icons -->
        <link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    </head>
    <body>
            <header>
            <a href="home.html" class="logo"><img src="img/jeep.png" alt=""></a>

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
        <!-- Sign In -->
        <section class="login">
            <div class="login-img">
                <h1><span>Travel Bug - </span> Employee Panel</h1>
            </div>
            <div class="logincontainer">  
                <form action="login_client.php" method="POST">
                    <div class="input-box">
                        <span>Username</span>
                        <input type="text" name="client_username" id="" placeholder="Username" required>
                    </div>
                    <div class="input-box">
                        <span>Password</span>
                        <input type="text" name="client_password" placeholder="Password"required="">
                    </div>
                    <div class="btn">
                        <input type="submit"name="submit" value="Sign In" class="btn">  
                    </div>
                </form>
                
            </div>
        </section>
        <!-- End Sign-In -->
    </body>
</html>
        