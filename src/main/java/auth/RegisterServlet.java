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
import java.sql.SQLException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            Connection conn = Database.getConnection();
            // Rest of your code
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().println("JDBC Driver not found.");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Database connection failed: " + e.getMessage());
        }


        try (Connection conn = Database.getConnection() ) {
            String query = "INSERT INTO user_auth (full_name, email, password) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, fullName);
            stmt.setString(2, email);
            stmt.setString(3, password); // Consider hashing the password for security
            stmt.executeUpdate();
            // Registration successful, pass success message to the JSP
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

}
