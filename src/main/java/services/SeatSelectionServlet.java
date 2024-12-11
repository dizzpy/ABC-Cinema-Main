package services;

import util.Database;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet("/SeatSelectionServlet")
public class SeatSelectionServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Ensure user is logged in
        if (session == null || session.getAttribute("user_id") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Retrieve data from session and request
        String userId = (String) session.getAttribute("user_id");
        Integer movieId = (Integer) session.getAttribute("movie_id");
        String selectedSeatsJson = request.getParameter("selectedSeats");
        String totalPriceStr = request.getParameter("totalPrice");
        String showDateStr = request.getParameter("showDate");
        String showTimeStr = request.getParameter("showTime"); // New field

        if (movieId == null || showDateStr == null || showTimeStr == null) {
            System.out.println("Error: Missing essential parameters.");
            response.sendRedirect("error.jsp");
            return;
        }

        int totalPrice = Integer.parseInt(totalPriceStr);

        try {
            if (selectedSeatsJson != null && !selectedSeatsJson.isEmpty()) {
                List<String> selectedSeats = new ArrayList<>(
                        Arrays.asList(selectedSeatsJson.replace("[", "").replace("]", "").split(","))
                );

                // Database Connection
                Connection conn = Database.getConnection();

                // SQL query to insert order with show date and time
                String sql = "INSERT INTO orders (user_id, movie_id, seat_numbers, total_price, show_date, show_time, booking_date) " +
                        "VALUES (?, ?, ?, ?, ?, ?, NOW())";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, userId);
                stmt.setInt(2, movieId);
                stmt.setString(3, String.join(",", selectedSeats));
                stmt.setInt(4, totalPrice);
                stmt.setString(5, showDateStr);
                stmt.setString(6, showTimeStr); // Add show time

                stmt.executeUpdate();

                // Redirect to the payment page
                response.sendRedirect("payment.jsp");
            } else {
                response.sendRedirect("error.jsp"); // Handle empty seat selection
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
