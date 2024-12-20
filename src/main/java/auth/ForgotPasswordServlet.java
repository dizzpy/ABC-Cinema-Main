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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.UUID;

@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        boolean emailSent = false;

        try (Connection conn = Database.getConnection()) {
            String query = "SELECT user_id, full_name FROM user_auth WHERE email = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int userId = rs.getInt("user_id");
                String fullName = rs.getString("full_name");
                String token = UUID.randomUUID().toString();

                String updateQuery = "UPDATE user_auth SET reset_token = ? WHERE user_id = ?";
                PreparedStatement updateStmt = conn.prepareStatement(updateQuery);
                updateStmt.setString(1, token);
                updateStmt.setInt(2, userId);
                updateStmt.executeUpdate();

                emailSent = sendResetLinkEmail(email, fullName, token);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (emailSent) {
            response.sendRedirect("views/auth/reset-password.jsp?status=success");
        } else {
            response.sendRedirect("views/auth/reset-password.jsp?status=error");
        }
    }

    private boolean sendResetLinkEmail(String recipientEmail, String recipientName, String token) {
        Properties properties = new Properties();
        try (InputStream input = getClass().getClassLoader().getResourceAsStream("dbconfig.properties")) {
            if (input == null) {
                throw new RuntimeException("dbconfig.properties file not found in resources");
            }
            properties.load(input);
        } catch (IOException e) {
            e.printStackTrace();
            return false;
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
            message.setSubject("ABC Cinema - Password Reset");
            String resetLink = "http://localhost:8080/ResetPasswordServlet?token=" + token;
            message.setText("Dear " + recipientName + ",\nEww menn muta password ek mathk nallu apoo modaya ... \n\nTo reset your password, please click the link below:\n" + resetLink + "\n\nBest Regards,\nABC Cinema Team");

            Transport.send(message);
            return true;
        } catch (MessagingException | UnsupportedEncodingException e) {
            e.printStackTrace();
            return false;
        }
    }
}