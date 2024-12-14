package services;

import com.paypal.api.payments.*;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;
import util.PayPalConfig;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/PayPalPaymentServlet")
public class PayPalPaymentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data and user ID from session
        String userId = (String) request.getSession().getAttribute("user_id");
        String fullName = request.getParameter("name");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String amountInput = request.getParameter("amount");

        // Check if amount is null or empty
        if (amountInput == null || amountInput.trim().isEmpty()) {
            // Redirect to error page if the amount is invalid
            response.sendRedirect("error/paymentError.jsp?error=Invalid amount");
            return;
        }

        // Validate and format the amount
        double parsedAmount;
        try {
            parsedAmount = Double.parseDouble(amountInput.trim());
        } catch (NumberFormatException e) {
            // Handle invalid number format
            response.sendRedirect("error/paymentError.jsp?error=Invalid amount format");
            return;
        }

        // Format the amount to two decimal places
        DecimalFormat decimalFormat = new DecimalFormat("0.00");
        String formattedAmount = decimalFormat.format(parsedAmount);

        // Initialize PayPal API context
        APIContext apiContext = PayPalConfig.getAPIContext();

        // Set up transaction details
        Amount paymentAmount = new Amount();
        paymentAmount.setCurrency("USD");
        paymentAmount.setTotal(formattedAmount); // Set the validated and formatted amount

        Transaction transaction = new Transaction();
        transaction.setAmount(paymentAmount);
        transaction.setDescription("Payment for movie ticket at ABC Cinema");

        List<Transaction> transactions = new ArrayList<>();
        transactions.add(transaction);

        // Set up payer and redirect URLs
        Payer payer = new Payer();
        payer.setPaymentMethod("paypal");

        String baseUrl = request.getRequestURL().toString().replace(request.getRequestURI(), request.getContextPath());

        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl(baseUrl + "/views/payment/cancel.jsp");
        redirectUrls.setReturnUrl(baseUrl + "/PayPalPaymentSuccessServlet");

        // Create payment
        Payment payment = new Payment();
        payment.setIntent("sale");
        payment.setPayer(payer);
        payment.setTransactions(transactions);
        payment.setRedirectUrls(redirectUrls);

        try {
            Payment createdPayment = payment.create(apiContext);

            // Save payment ID to session
            request.getSession().setAttribute("paymentId", createdPayment.getId());

            // Redirect user to PayPal approval URL
            for (Links link : createdPayment.getLinks()) {
                if (link.getRel().equals("approval_url")) {
                    response.sendRedirect(link.getHref());
                    return;
                }
            }

            // Redirect to error page if no approval URL is found
            response.sendRedirect(baseUrl + "/error/paymentError.jsp");

        } catch (PayPalRESTException e) {
            e.printStackTrace();
            response.sendRedirect(baseUrl + "/error/paymentError.jsp");
        }
    }
}
