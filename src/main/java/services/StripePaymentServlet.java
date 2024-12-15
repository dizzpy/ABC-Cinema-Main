package services;

import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.PaymentIntent;
import com.stripe.param.PaymentIntentCreateParams;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/StripePaymentServlet")
public class StripePaymentServlet extends HttpServlet {

    // Replace with your Stripe secret key
    private static final String SECRET_KEY = "sk_test_51QRbfPRosLYWPB033ArkluDajWHHuAdmqv02SYSpTc2mRZAF9zXmEWyOE6w2piIVMsSQrujVzG5FICHmZj1yQti3003OjCuMa0";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        // Check session validity
        if (session == null || session.getAttribute("calculatedTotalPrice") == null) {
            response.sendRedirect("error/paymentError.jsp?error=Missing%20total%20price");
            return;
        }

        // Retrieve the total price from the session
        Double totalPrice = (Double) session.getAttribute("calculatedTotalPrice");

        // Validate the total price
        if (totalPrice == null || totalPrice <= 0) {
            response.sendRedirect("error/paymentError.jsp?error=Invalid%20total%20price");
            return;
        }

        // Convert amount to cents (Stripe requires amounts in the smallest currency unit)
        long amountInCents = (long) (totalPrice * 100);

        try {
            // Set your Stripe secret key
            Stripe.apiKey = SECRET_KEY;

            // Create a PaymentIntent with the specified amount and currency
            PaymentIntentCreateParams params = PaymentIntentCreateParams.builder()
                    .setAmount(amountInCents)
                    .setCurrency("usd") // Replace with your preferred currency code
                    .build();

            PaymentIntent paymentIntent = PaymentIntent.create(params);

            // Respond with the client secret
            response.setContentType("application/json");
            response.getWriter().write("{\"clientSecret\": \"" + paymentIntent.getClientSecret() + "\"}");

        } catch (StripeException e) {
            e.printStackTrace();
            response.sendRedirect("error/paymentError.jsp?error=Stripe%20payment%20error");
        }
    }
}
