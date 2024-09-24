package com.journeyexpress.registration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;

@WebServlet("/DownloadJPG")
public class DownloadJPG extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set content type for the response
        response.setContentType("image/jpeg");
        response.setHeader("Content-Disposition", "attachment; filename=ticket.jpg");

        // Create a buffered image for the ticket
        int width = 400;
        int height = 400; // Adjust height as needed
        BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics2D g2d = bufferedImage.createGraphics();

        try {
            // Draw background and ticket details
            g2d.setColor(Color.WHITE);
            g2d.fillRect(0, 0, width, height);
            g2d.setColor(Color.BLACK);
            g2d.setFont(new Font("Arial", Font.PLAIN, 16));

            // Add static text
            g2d.drawString("Thank you for choosing Journey Express", 10, 20);
            g2d.drawString("Ticket Confirmation", 10, 50);

            // Retrieve ticket details from the request
            String pnr = request.getParameter("pnr");
            String name = request.getParameter("name");
            String age = request.getParameter("age");
            String mobile = request.getParameter("mobile");
            String origin = request.getParameter("origin");
            String destination = request.getParameter("destination");
            String travelDate = request.getParameter("travelDate");
            String berthPreference = request.getParameter("berthPreference");
            String trainName = request.getParameter("trainName");
            String departureTime = request.getParameter("departureTime");
            String arrivalTime = request.getParameter("arrivalTime");
            String trainClass = request.getParameter("class"); // Class
            String fare = request.getParameter("fare"); // Fare

            // Draw ticket details
            int y = 70; // Starting Y position
            g2d.drawString("PNR: " + (pnr != null ? pnr : "N/A"), 10, y);
            y += 20;
            g2d.drawString("Name: " + (name != null ? name : "N/A"), 10, y);
            y += 20;
            g2d.drawString("Age: " + (age != null ? age : "N/A"), 10, y);
            y += 20;
            g2d.drawString("Mobile Number: " + (mobile != null ? mobile : "N/A"), 10, y);
            y += 20;
            g2d.drawString("Origin: " + (origin != null ? origin : "N/A"), 10, y);
            y += 20;
            g2d.drawString("Destination: " + (destination != null ? destination : "N/A"), 10, y);
            y += 20;
            g2d.drawString("Travel Date: " + (travelDate != null ? travelDate : "N/A"), 10, y);
            y += 20;
            g2d.drawString("Berth Preference: " + (berthPreference != null ? berthPreference : "N/A"), 10, y);
            y += 20;
            g2d.drawString("Train Name: " + (trainName != null ? trainName : "N/A"), 10, y);
            y += 20;
            g2d.drawString("Departure Time: " + (departureTime != null ? departureTime : "N/A"), 10, y);
            y += 20;
            g2d.drawString("Arrival Time: " + (arrivalTime != null ? arrivalTime : "N/A"), 10, y);
            y += 20;
            g2d.drawString("Class: " + (trainClass != null ? trainClass : "N/A"), 10, y); // Class
            y += 20;
            g2d.drawString("Fare: " + (fare != null ? fare : "N/A"), 10, y); // Fare

            // Output the image
            OutputStream out = response.getOutputStream();
            javax.imageio.ImageIO.write(bufferedImage, "jpg", out);
            out.close();
        } finally {
            g2d.dispose(); // Clean up graphics
        }
    }

    // Optionally handle POST requests as well
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response); // Redirect POST to GET if needed
    }
}
