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

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@WebServlet("/SavePaymentServlet")
public class SavePaymentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user_id") == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        String userId = (String) session.getAttribute("user_id");

        // Parse JSON request body
        JsonObject jsonData = JsonParser.parseReader(request.getReader()).getAsJsonObject();
        String orderId = jsonData.get("orderId").getAsString();
        String paymentId = jsonData.get("paymentId").getAsString();
        String fullName = jsonData.get("payerName").getAsString();
        String email = jsonData.get("payerEmail").getAsString();
        String mobile = jsonData.has("payerPhone") ? jsonData.get("payerPhone").getAsString() : "";
        double amount = jsonData.get("amount").getAsDouble();

        try (Connection con = Database.getConnection()) {
            String insertPaymentQuery = "INSERT INTO payments (user_id, order_id, payment_id, full_name, email, mobile, amount, payment_date) VALUES (?, ?, ?, ?, ?, ?, ?, NOW())";
            try (PreparedStatement ps = con.prepareStatement(insertPaymentQuery)) {
                ps.setString(1, userId);
                ps.setString(2, orderId);
                ps.setString(3, paymentId);
                ps.setString(4, fullName);
                ps.setString(5, email);
                ps.setString(6, mobile);
                ps.setDouble(7, amount);

                int rowsAffected = ps.executeUpdate();
                response.setContentType("application/json");
                response.getWriter().write("{\"success\": " + (rowsAffected > 0) + "}");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}

