package models;

import java.sql.Timestamp;

public class Review {
    private Long reviewId;
    private String reviewerName;
    private Double rating;
    private String reviewDescription;
    private Timestamp createdAt;

    public Review() {}

    public Review(String reviewerName, Double rating, String reviewDescription) {
        this.reviewerName = reviewerName;
        this.rating = rating;
        this.reviewDescription = reviewDescription;
    }

    // Getters and Setters
    public Long getReviewId() { return reviewId; }
    public void setReviewId(Long reviewId) { this.reviewId = reviewId; }

    public String getReviewerName() { return reviewerName; }
    public void setReviewerName(String reviewerName) { this.reviewerName = reviewerName; }

    public Double getRating() { return rating; }
    public void setRating(Double rating) { this.rating = rating; }

    public String getReviewDescription() { return reviewDescription; }
    public void setReviewDescription(String reviewDescription) { this.reviewDescription = reviewDescription; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
}