package dao;

import models.Review;
import util.Database;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {

    public void addReview(Review review) throws SQLException {
        String sql = "INSERT INTO reviews (reviewer_id, reviewer_name, rating, review_description) VALUES (?, ?, ?, ?)";

        try (Connection conn = Database.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setLong(1, review.getReviewerId());
            pstmt.setString(2, review.getReviewerName());
            pstmt.setDouble(3, review.getRating());
            pstmt.setString(4, review.getReviewDescription());

            pstmt.executeUpdate();

            try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    review.setReviewId(generatedKeys.getLong(1));
                }
            }
        }
    }

    public List<Review> getAllReviews() throws SQLException {
        List<Review> reviews = new ArrayList<>();
        String sql = "SELECT * FROM reviews ORDER BY created_at DESC";

        try (Connection conn = Database.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Review review = new Review();
                review.setReviewId(rs.getLong("review_id"));
                review.setReviewerId(rs.getLong("reviewer_id"));
                review.setReviewerName(rs.getString("reviewer_name"));
                review.setRating(rs.getDouble("rating"));
                review.setReviewDescription(rs.getString("review_description"));
                review.setCreatedAt(rs.getTimestamp("created_at"));
                reviews.add(review);
            }
        }
        return reviews;
    }
}