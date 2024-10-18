package com.journeyexpress.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddTrainServlet")
public class AddTrainServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:3306/journeyexpress";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "password";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String trainId = request.getParameter("trainId");
        String trainName = request.getParameter("trainName");
        String sourceStation = request.getParameter("sourceStation");
        String destinationStation = request.getParameter("destinationStation");
        String trainType = request.getParameter("trainType");
        String serviceDays = request.getParameter("serviceDays");
        String route = request.getParameter("route");
        String departureTime = request.getParameter("departureTime");
        String arrivalTime = request.getParameter("arrivalTime");
        String availability = request.getParameter("availability");
        int availableSeats = Integer.parseInt(request.getParameter("availableSeats"));
        int slfare = Integer.parseInt(request.getParameter("slfare"));
        int threeafare = Integer.parseInt(request.getParameter("threeafare"));
        int twoafare = Integer.parseInt(request.getParameter("twoafare"));
        int oneafare = Integer.parseInt(request.getParameter("oneafare"));
        

        Connection conn = null;
        PreparedStatement pstmt = null;
        PreparedStatement pstmta = null;
        String message;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "INSERT INTO train (train_id, train_name, source_station, destination_station, route, train_type, service_days, departure_time, arrival_time, availability, available_seats) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, trainId);
            pstmt.setString(2, trainName);
            pstmt.setString(3, sourceStation);
            pstmt.setString(4, destinationStation);
            pstmt.setString(5, route);
            pstmt.setString(6, trainType);
            pstmt.setString(7, serviceDays);
            pstmt.setString(8, departureTime);
            pstmt.setString(9, arrivalTime);
            pstmt.setString(10, availability);
            pstmt.setInt(11, availableSeats);
                        
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                String sqla = "INSERT INTO fare (train_id, sl_fare, three_a_fare, two_a_fare, one_a_fare) VALUES (?, ?, ?, ?, ?)";
                pstmta = conn.prepareStatement(sqla);
                pstmta.setString(1, trainId);
                pstmta.setInt(2, slfare);
                pstmta.setInt(3, threeafare);
                pstmta.setInt(4, twoafare);
                pstmta.setInt(5, oneafare);
                int fareRowsAffected = pstmta.executeUpdate();

                // Check if fare data was inserted successfully
                if (fareRowsAffected > 0) {
                    message = "success";
                } else {
                    message = "error in fare insertion";
                }
            } else {
                message = "error in train insertion";
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            message = "error";
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        request.setAttribute("message", message);
        request.getRequestDispatcher("train.jsp").forward(request, response);
    }
}
