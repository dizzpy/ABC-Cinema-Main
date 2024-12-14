package services;

import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;
import util.Database;
import util.PayPalConfig;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.HashMap;

import static javax.swing.UIManager.put;

@WebServlet("/PayPalPaymentSuccessServlet")
public class PayPalPaymentSuccessServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paymentId = request.getParameter("paymentId");
        String payerId = request.getParameter("PayerID");

        if (paymentId == null || payerId == null) {
            response.sendRedirect("error/paymentError.jsp");
            return;
        }

        APIContext apiContext = PayPalConfig.getAPIContext();

        try {
            Payment payment = Payment.get(apiContext, paymentId);
            PaymentExecution paymentExecution = new PaymentExecution();
            paymentExecution.setPayerId(payerId);

            Payment executedPayment = payment.execute(apiContext, paymentExecution);

            if ("approved".equalsIgnoreCase(executedPayment.getState())) {
                // Payment successful, redirect to success page
                response.sendRedirect("views/payment/success.jsp");
            } else {
                // Payment not approved
                response.sendRedirect("error/paymentError.jsp");
            }

        } catch (PayPalRESTException e) {
            e.printStackTrace();
            response.sendRedirect("error/paymentError.jsp");
        }
    }
}


