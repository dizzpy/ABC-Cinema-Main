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
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

@WebServlet("/SeatSelectionServlet")
public class SeatSelectionServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user_id") == null) {
            response.sendRedirect("views/auth/login.jsp?error=session_expired");
            return;
        }

        String userId = (String) session.getAttribute("user_id");

        // Get movieId from request parameter instead of session
        Integer movieId = Integer.parseInt(request.getParameter("movieId"));  // Get movieId from request

        if (movieId == null) {
            System.out.println("Movie ID is null. Redirecting to error page.");
            response.sendRedirect("error/404.jsp?error=missing_movie_id");
            return;
        }

        String selectedSeatsJson = request.getParameter("selectedSeats");
        String showDateStr = request.getParameter("showDate");

        if (selectedSeatsJson == null || showDateStr == null) {
            response.sendRedirect(request.getContextPath() + "/error/404.jsp?error=missing_params");
            return;
        }

        Gson gson = new Gson();
        List<String> selectedSeats;
        try {
            selectedSeats = gson.fromJson(selectedSeatsJson, new TypeToken<List<String>>() {}.getType());
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error/jsonError.jsp");
            return;
        }

        // Hardcoded show_time, for example
        String hardcodedShowTime = "14:30:00";  // Modify to the desired fixed time

        try (Connection con = Database.getConnection()) {
            // Check availability of selected seats
            String checkSeatsQuery = "SELECT seat_numbers FROM orders WHERE movie_id = ? AND show_date = ?";
            try (PreparedStatement checkSeatsPs = con.prepareStatement(checkSeatsQuery)) {
                checkSeatsPs.setInt(1, movieId);
                checkSeatsPs.setString(2, showDateStr);
                ResultSet rs = checkSeatsPs.executeQuery();

                // Collect all booked seats for the given show date
                List<String> bookedSeats = new ArrayList<>();
                while (rs.next()) {
                    String bookedSeatsJson = rs.getString("seat_numbers");
                    List<String> bookedSeatsList = gson.fromJson(bookedSeatsJson, new TypeToken<List<String>>() {}.getType());
                    bookedSeats.addAll(bookedSeatsList);
                }

                // Check if any selected seat is already booked
                for (String seat : selectedSeats) {
                    if (bookedSeats.contains(seat)) {
                        response.sendRedirect("error/seatAlreadyBooked.jsp?seat=" + seat);
                        return;
                    }
                }
            }

            // Calculate total price dynamically
            double ticketPrice = 1800.00; // Example ticket price
            double calculatedTotalPrice = selectedSeats.size() * ticketPrice;

            // Insert the new order into the database
            String insertOrderQuery = "INSERT INTO orders (user_id, movie_id, seat_numbers, total_price, show_date, booking_date) VALUES (?, ?, ?, ?, ?, NOW())";
            try (PreparedStatement ps = con.prepareStatement(insertOrderQuery)) {
                ps.setString(1, userId);
                ps.setInt(2, movieId);
                ps.setString(3, gson.toJson(selectedSeats)); // Store selected seats as JSON
                ps.setDouble(4, calculatedTotalPrice);
                ps.setString(5, showDateStr);

                int rowsAffected = ps.executeUpdate();
                if (rowsAffected > 0) {
                    // Store the total price in session for the payment process
                    session.setAttribute("calculatedTotalPrice", calculatedTotalPrice);

                    response.sendRedirect("payments/payment.jsp");
                } else {
                    System.out.println("Database insertion failed. Rows affected: " + rowsAffected);
                    response.sendRedirect("error/databaseError.jsp");
                }
            }
        } catch (Exception e) {
            System.out.println("Exception occurred during database operation: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("error/databaseError.jsp");
        }
    }
}
