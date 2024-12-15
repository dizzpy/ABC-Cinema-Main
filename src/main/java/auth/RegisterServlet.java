package auth;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import util.Database;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Class.forName("org.mariadb.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().println("JDBC Driver not found.");
            return;
        }

        try (Connection conn = Database.getConnection()) {
            String query = "INSERT INTO user_auth (full_name, email, password) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, fullName);
            stmt.setString(2, email);
            stmt.setString(3, password); // Consider hashing the password for security
            stmt.executeUpdate();
            // Registration successful, send confirmation email
            sendConfirmationEmail(email, fullName);
            // Pass success message to the JSP
            request.setAttribute("message", "Registration successful! Redirecting...");
            request.setAttribute("messageType", "success");
            request.getRequestDispatcher("views/auth/login.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            // Registration failed, pass error message to the JSP
            request.setAttribute("message", "Registration failed! Error: " + e.getMessage());
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher("views/auth/register.jsp").forward(request, response);
        }
    }

    private void sendConfirmationEmail(String recipientEmail, String recipientName) {
        Properties properties = new Properties();
        try (InputStream input = getClass().getClassLoader().getResourceAsStream("dbconfig.properties")) {
            if (input == null) {
                throw new RuntimeException("dbconfig.properties file not found in resources");
            }
            properties.load(input);
        } catch (IOException e) {
            e.printStackTrace();
            return;
        }

        String smtpUsername = properties.getProperty("smtp.username");
        String smtpPassword = properties.getProperty("smtp.password");

        properties.put("mail.smtp.auth", properties.getProperty("smtp.auth"));
        properties.put("mail.smtp.starttls.enable", properties.getProperty("smtp.starttls.enable"));
        properties.put("mail.smtp.host", properties.getProperty("smtp.host"));
        properties.put("mail.smtp.port", properties.getProperty("smtp.port"));

        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(smtpUsername, smtpPassword);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("contact@abcmovies.com", "ABC Cinema"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("ABC Cinema - Registration Confirmation");
            message.setText("Dear " + recipientName + ",\n\nThank you for registering at ABC Cinema!\n\nBest Regards,\nABC Cinema Team");

            Transport.send(message);
        } catch (MessagingException | UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }
}