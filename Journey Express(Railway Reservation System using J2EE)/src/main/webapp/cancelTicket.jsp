<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cancel Ticket | Journey Express</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        function showAlert(isCancelled) {
            Swal.fire({
                title: isCancelled ? 'Ticket Canceled' : 'Cancellation Failed',
                text: isCancelled ? 'Your ticket has been successfully canceled.' : 'No ticket found with the provided PNR.',
                icon: isCancelled ? 'success' : 'error',
                confirmButtonText: 'OK'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = "pnr.jsp"; // Redirect to PNR status page
                }
            });
        }
    </script>
</head>
<body>
    <%
        String pnr = request.getParameter("pnr");

        String url = "jdbc:mysql://localhost:3306/journeyexpress";
        String user = "root";
        String password = "password";
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);

            String sql = "DELETE FROM tickets WHERE pnr = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, pnr);
            int rowsAffected = pstmt.executeUpdate();

            // Check if the ticket was successfully canceled
            if (rowsAffected > 0) {
    %>
                <script>showAlert(true);</script>
    <%
            } else {
    %>
                <script>showAlert(false);</script>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
    %>
            <script>showAlert(false);</script>
    <%
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    %>
</body>
</html>
