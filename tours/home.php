<!DOCTYPE html>
<html lang="en">
    <?php 
        session_start(); 
        require 'connection.php';
        $conn = Connect();
    ?>
    <head>
        <meta charset="UTF-8">
        <title>Travel Bug | Home</title>
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
        <!-- Home -->
        <section class="home" id="home">
            <div class="text">
                <h1><span>Getting</span> ready<br>for a trip</h1>
                <p>From Night To Twenty Four Hours, <br> Book now and get the experience of a lifetime.</p>
            </div>

            <div class="form-container">
                <form action="">
                    <div class="input-box">
                        <span>Location</span>
                        <input type="search" name="" id="" placeholder="Enter Location" required>
                    </div>
                    <div class="input-box">
                        <span>Trip Start Date</span>
                        <input type="date"  name="" id="" required>
                    </div>
                    <a href="packages.php"><input type="submit" name="" id="" class="btn"></a>
                </form>
            </div>
        </section>
        <!-- End Home -->
    </body>
</html>