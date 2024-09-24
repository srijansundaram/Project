<!DOCTYPE html>
<html lang="en">
    <?php 
        session_start(); 
        require 'connection.php';
        $conn = Connect();

        // Checking for connections
        if($conn === false){
			die("ERROR: Could not connect. "
				. mysqli_connect_error());
		}
        
        // SQL query to select data from database
        $sql = " SELECT * FROM bookedtours";
        $result = $conn->query($sql);
        $conn->close();
        
    ?>
    <head>
        <meta charset="UTF-8">
        <title>Travel Bug | Booked Tour</title>
        <!-- Link to CSS -->
        <link rel="stylesheet" href="style.css"> 
        <!-- Box Icons -->
        <link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <style>
            table {
                background-color: rgba(0,0,0, 0.4);
                font-size: large;
                border: 1px solid black;
            
            }
            h1 {
                text-align: center;
                color: black;
                font-size: xx-large;
            }
            td {
                border: 1px solid black;
                }
            th,
            td {
                color: white;
                font-weight: bold;
                border: 1px solid black;
                padding: 2px;
                text-align: center;
            }
            td {
                font-weight: lighter;
            }
        </style>
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
        <!-- Available Tour -->
        <section>
            <center>
                <br><br>
                <h1>Booked Tours</h1>
                <!-- TABLE CONSTRUCTION -->
                <table>
                    <tr>
                        <th>Tour Id</th>
                        <th>Tour Name</th>
                        <th>Customer Name</th>
                        <th>Customer Address</th>
                        <th>Customer E-mail</th>
                        <th>Customer Mobile</th>
                        <th>Tour Start Date</th>
                        <th>Fare</th>
                    </tr>
                    <!-- PHP CODE TO FETCH DATA FROM ROWS -->
                    <?php 
                        // LOOP TILL END OF DATA
                        while($rows=$result->fetch_assoc())
                        {
                    ?>
                    <tr>
                        <!-- FETCHING DATA FROM EACH
                            ROW OF EVERY COLUMN -->
                        <td><?php echo $rows['tour_id'];?></td>
                        <td><?php echo $rows['tour_name'];?></td>
                        <td><?php echo $rows['customer_name'];?></td>
                        <td><?php echo $rows['customer_address'];?></td>
                        <td><?php echo $rows['customer_email'];?></td>
                        <td><?php echo $rows['customer_mobile'];?></td>
                        <td><?php echo $rows['tour_start_date'];?></td>
                        <td><?php echo $rows['fare'];?></td>
                    </tr>
                    <?php
                        }
                    ?>
                </table>
            </center>
         </section>
    </body>
 
</html>