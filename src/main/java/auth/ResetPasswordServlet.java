package auth;

import util.Database;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String token = request.getParameter("token");

        try (Connection conn = Database.getConnection()) {
            String query = "SELECT user_id FROM user_auth WHERE reset_token = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, token);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                request.setAttribute("token", token);
                request.getRequestDispatcher("views/auth/new-password.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "Invalid or expired token.");
                request.setAttribute("messageType", "error");
                request.getRequestDispatcher("views/auth/login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", "Database error occurred. Please try again later.");
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher("views/auth/login.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String token = request.getParameter("token");
        String newPassword = request.getParameter("password");

        try (Connection conn = Database.getConnection()) {
            String query = "SELECT user_id FROM user_auth WHERE reset_token = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, token);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int userId = rs.getInt("user_id");

                String updateQuery = "UPDATE user_auth SET password = ?, reset_token = NULL WHERE user_id = ?";
                PreparedStatement updateStmt = conn.prepareStatement(updateQuery);
                updateStmt.setString(1, newPassword); // Consider hashing the password for security
                updateStmt.setInt(2, userId);
                updateStmt.executeUpdate();

                request.setAttribute("message", "Password reset successful! Please log in.");
                request.setAttribute("messageType", "success");
                request.getRequestDispatcher("views/auth/login.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "Invalid or expired token.");
                request.setAttribute("messageType", "error");
                request.getRequestDispatcher("views/auth/login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", "Database error occurred. Please try again later.");
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher("views/auth/login.jsp").forward(request, response);
        }
    }
}