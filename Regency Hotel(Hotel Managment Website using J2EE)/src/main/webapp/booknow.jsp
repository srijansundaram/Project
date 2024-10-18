<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Regency Hotel|Book Now</title>
    <link href="css/styles.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body style="margin: 0; padding: 0; height: 100vh; width: 100vw; display: flex; justify-content: center; align-items: center;">
    <header style="position: fixed;">
        <a href="index.jsp" class="logo"><img src="images/logo.png" alt="Logo"></a>
        <div class="bx bx-menu" id="menu-icon"></div>
        <ul class="navbar">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="booking.jsp">Booking Status</a></li>
            <li><a href="availability.jsp">Room Availability</a></li>
            <li><a href="booknow.jsp">Book Now</a></li>
            <li><a href="about.jsp">About us</a></li>
            <li><a href="contactus.jsp">Contact us</a></li>
        </ul>
        <div class="header-btn">
            <a href="login.jsp" class="sign-in">Sign In</a>
        </div>
    </header>
    <div class="center-containerss">
        <h1 style="left: 300px;">
            <span style="color:#fe5b3d;">Book</span> Now
        </h1>
    </div>
    <div class="form-container" style="background-color: rgba(255, 255, 255, 0.85);">
        <form action="bookingprocess.jsp" method="post">
            <div class="form-group">
                <div class="input-box">
                    <label for="room-type">Room Type</label>
                    <select name="room-type" id="room-type" required>
                        <option value="">Select Room</option>
                        <%
                            String url = "jdbc:mysql://localhost:3306/hotel";
                            String user = "root";
                            String password = "password";
                            Connection conn = null;
                            Statement stmt = null;
                            ResultSet rs = null;

                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                conn = DriverManager.getConnection(url, user, password);
                                stmt = conn.createStatement();
                                rs = stmt.executeQuery("SELECT DISTINCT RoomType FROM Room");
                                while (rs.next()) {
                        %>
                            <option value="<%= rs.getString("RoomType") %>"><%= rs.getString("RoomType") %></option>
                        <%
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            } finally {
                                if (rs != null) rs.close();
                                if (stmt != null) stmt.close();
                                if (conn != null) conn.close();
                            }
                        %>
                    </select>
                </div>
                <div class="input-box">
                    <label for="start-date">Check-In Date</label>
                    <input type="date" name="start-date" id="start-date" required />
                    <script>
                        const today = new Date();
                        today.setDate(today.getDate() + 1);
                        document.getElementById("start-date").min = today.toISOString().split("T")[0];
                    </script>
                </div>
            </div>
            <div class="form-group">
                <div class="input-box">
                    <label for="name">Name</label>
                    <input type="search" name="name" id="name" placeholder="Enter Your Name" required>
                </div>
                <div class="input-box">
                    <label for="email">Email</label>
                    <input type="search" name="email" id="email" placeholder="Enter Your Email" required>
                </div>
            </div>
            <div class="form-group">
                <div class="input-box">
                    <label for="end-date">Check-Out Date</label>
                    <input type="date" name="end-date" id="end-date" required />
                    <script>
                        document.getElementById("start-date").addEventListener("change", function() {
                            const checkInDate = new Date(this.value);
                            checkInDate.setDate(checkInDate.getDate() + 1);
                            document.getElementById("end-date").min = checkInDate.toISOString().split("T")[0];
                        });
                    </script>
                </div>
                <div class="input-box">
                    <label for="fare">Fare</label>
                    <input type="text" name="fare" id="fare" placeholder="Fare" required readonly style="width: 100%; padding: 8px; border-radius: 10px; border: 1px solid #ccc;">
                </div>
            </div>
            <input type="hidden" name="trainId" id="trainId">
            <div class="form-group">
                <div class="input-box">
                    <label for="age">Age</label>
                    <input type="number" name="age" id="age" placeholder="Enter your Age" min="1" required>
                </div>
                <div class="input-box">
                    <label for="mobile">Mobile Number</label>
                    <input type="tel" name="mobile" id="mobile" placeholder="Enter your Mobile Number" required>
                </div>
            </div>
            <button type="submit">Book Now</button>
        </form>
    </div>
    <script>
        $(document).ready(function() {
            $('#room-type').change(function() {
                var roomType = $(this).val();
                $.ajax({
                    type: "POST",
                    url: "fetch_fare.jsp",
                    data: { roomType: roomType },
                    success: function(data) {
                        $('#fare').val(data);
                    },
                    error: function(xhr, status, error) {
                        console.error("Error fetching fare: ", error);
                    }
                });
            });
        });
    </script>
</body>
</html>
