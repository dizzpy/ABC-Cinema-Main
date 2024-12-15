package services;

import dao.ReviewDAO;
import models.Review;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/reviews")
public class ReviewServlet extends HttpServlet {
    private ReviewDAO reviewDAO;

    @Override
    public void init() throws ServletException {
        reviewDAO = new ReviewDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Review> reviews = reviewDAO.getAllReviews();
            request.setAttribute("reviews", reviews);
            request.getRequestDispatcher("/views/review/all-review.jsp").forward(request, response);
        } catch (Exception e) {
            // Log the error
            getServletContext().log("Error in ReviewServlet.doGet(): ", e);
            response.sendRedirect(request.getContextPath() + "/error/databaseError.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String fullName = (String) session.getAttribute("full_name");

        if (fullName == null) {
            response.sendRedirect(request.getContextPath() + "/views/auth/login.jsp");
            return;
        }

        try {
            // Get and validate the rating
            String ratingStr = request.getParameter("rating");
            if (ratingStr == null || ratingStr.trim().isEmpty()) {
                throw new IllegalArgumentException("Rating is required");
            }
            double rating = Double.parseDouble(ratingStr);
            if (rating < 0 || rating > 5) {
                throw new IllegalArgumentException("Rating must be between 0 and 5");
            }

            // Get and validate the description
            String description = request.getParameter("description");
            if (description == null || description.trim().isEmpty()) {
                throw new IllegalArgumentException("Review description is required");
            }

            // Create and save the review
            Review review = new Review();
            review.setReviewerName(fullName);
            review.setRating(rating);
            review.setReviewDescription(description.trim());

            reviewDAO.addReview(review);

            // Set success message and redirect
            session.setAttribute("successMessage", "Review submitted successfully!");
            response.sendRedirect(request.getContextPath() + "/reviews");

        } catch (IllegalArgumentException e) {
            request.setAttribute("error", e.getMessage());
            doGet(request, response);
        } catch (Exception e) {
            getServletContext().log("Error in ReviewServlet.doPost(): ", e);
            response.sendRedirect(request.getContextPath() + "/error/databaseError.jsp");
        }
    }

    @Override
    public void destroy() {
        // Clean up resources if needed
        reviewDAO = null;
    }
}