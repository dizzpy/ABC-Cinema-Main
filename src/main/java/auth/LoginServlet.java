package auth;

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
import java.sql.SQLException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve email and password from the form
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Database connection
        try (Connection conn = Database.getConnection()) {
            // Query to validate user credentials
            String query = "SELECT user_id, full_name FROM user_auth WHERE email = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, email);
            stmt.setString(2, password); // Note: Use hashed passwords in production

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Retrieve user details
                int userId = rs.getInt("user_id");
                String fullName = rs.getString("full_name");

                // Create a session and store user details
                HttpSession session = request.getSession();
                session.setAttribute("user_id", String.valueOf(userId)); // Storing user ID as a string
                session.setAttribute("full_name", fullName);

                // Add message to session indicating login success
                session.setAttribute("message", "Login successful!");
                session.setAttribute("messageType", "success");

                // Redirect to the movies page (adjust the path as needed)
                response.sendRedirect("index.jsp");
            } else {
                // Invalid credentials, forward to login page with an error message
                request.setAttribute("message", "Invalid email or password!");
                request.setAttribute("messageType", "error");
                request.getRequestDispatcher("views/auth/login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log the error (replace with logger in production)
            request.setAttribute("message", "Database error occurred. Please try again later.");
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher("views/auth/login.jsp").forward(request, response);
        }
    }
}
