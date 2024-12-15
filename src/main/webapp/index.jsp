<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection, java.sql.ResultSet, java.sql.PreparedStatement" %>
<%@ page import="util.Database" %>

<!DOCTYPE html>
<html lang="en" class="h-full">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Add Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap"
          rel="stylesheet">

    <title>ABC Cinema</title>

    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Tailwind config file -->
    <script src="${pageContext.request.contextPath}/static/js/tailwind-config.js"></script>
    <link href="${pageContext.request.contextPath}/static/css/style.css">
</head>

<body class="bg-custom-black min-h-screen flex flex-col">

<!-- Main content wrapper -->
<div class="flex flex-col flex-grow">
    <!-- Navbar -->
    <%@ include file="views/components/shared/navbar.jsp" %>

    <!-- Include the carousel -->
    <%@ include file="views/components/home/carousel.jsp" %>

    <!-- Now Showing Movies Section -->
    <section class="container max-w-7xl mx-auto py-12 px-4 md:px-8">
        <div class="p-4 flex justify-between items-center mt-5 mb-5 flex-wrap text-center">
            <h2 class="text-xl sm:text-3xl text-custom-white w-auto mb-2 sm:mb-0">Movies in Theaters</h2>
            <p class="text-sm sm:text-base text-white cursor-pointer w-auto text-center sm:text-right ml-0 sm:ml-4">
                <a href="/movies">View All</a>
            </p>
        </div>

        <!-- Card Section -->
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6 p-4">

            <%-- Database Configuration --%>
            <%
                // Using try-with-resources to manage the connection and statement automatically
                try (Connection conn = Database.getConnection()) {
                    String queryScreening = "SELECT * FROM movies_management WHERE category = 'Screening Now Home' AND status = 'Published'";

                    try (PreparedStatement stmt = conn.prepareStatement(queryScreening);
                         ResultSet rsScreening = stmt.executeQuery()) {

                        // Loop through each movie and generate a card
                        while (rsScreening.next()) {
                            int movieId = rsScreening.getInt("id");
                            String title = rsScreening.getString("title");
                            String posterUrl = rsScreening.getString("poster_url");
                            String genres = rsScreening.getString("genres");
            %>

            <!-- Movie Card -->
            <a href="<%= request.getContextPath() %>/views/movies/movie-details.jsp?id=<%= movieId %>"
               class="flex justify-center">
                <div class="w-64 overflow-hidden hover:scale-105 transform transition-all duration-300">
                    <img src="<%= posterUrl %>" alt="<%= title %>" class="w-full h-[370px] object-cover">
                    <div class="pt-3">
                        <h3 class="text-xl font-normal text-white"><%= title %>
                        </h3>
                        <p class="text-sm text-gray-200 mt-1"><%= genres %>
                        </p>
                    </div>
                </div>
            </a>

            <%
                        }
                    }
                } catch (Exception e) {
                    System.out.println("<p class='text-red-500'>Error fetching movies: " + e.getMessage() + "</p>");
                }
            %>
        </div>
    </section>


    <!-- Upcoming Movies Section -->
    <section class="container max-w-7xl mx-auto py-12 px-4 md:px-8">
        <div class="p-4 flex justify-between items-center mt-5 mb-5 flex-wrap text-center">
            <h2 class="text-xl sm:text-3xl text-custom-white w-auto mb-2 sm:mb-0">Movies Releasing Soon</h2>
            <p class="text-sm sm:text-base text-white cursor-pointer w-auto text-center sm:text-right ml-0 sm:ml-4">
                <a href="/movies">View All</a>
            </p>
        </div>

        <!-- Card Section -->
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6 p-4">

            <%-- Database Configuration --%>
            <%
                // Using try-with-resources to manage the connection and statement automatically
                try (Connection conn = Database.getConnection()) {
                    String queryScreening = "SELECT * FROM movies_management WHERE category = 'Coming Soon Home' AND status = 'Published'";

                    try (PreparedStatement stmt = conn.prepareStatement(queryScreening);
                         ResultSet rsScreening = stmt.executeQuery()) {

                        // Loop through each movie and generate a card
                        while (rsScreening.next()) {
                            int movieId = rsScreening.getInt("id");
                            String title = rsScreening.getString("title");
                            String posterUrl = rsScreening.getString("poster_url");
                            String genres = rsScreening.getString("genres");
            %>

            <!-- Movie Card -->
            <a class="flex justify-center">
                <div class="w-64 overflow-hidden hover:scale-105 transform transition-all duration-300">
                    <img src="<%= posterUrl %>" alt="<%= title %>" class="w-full h-[370px] object-cover">
                    <div class="pt-3">
                        <h3 class="text-xl font-normal text-white"><%= title %>
                        </h3>
                        <p class="text-sm text-gray-200 mt-1"><%= genres %>
                        </p>
                    </div>
                </div>
            </a>

            <%
                        }
                    }
                } catch (Exception e) {
                    System.out.println("<p class='text-red-500'>Error fetching movies: " + e.getMessage() + "</p>");
                }
            %>
        </div>
    </section>


    <!-- Reviews Section -->
    <!-- Reviews Section -->
    <section class="container max-w-7xl mx-auto py-12 px-4 md:px-8">
        <div class="p-4 flex justify-between items-center mt-5 mb-5 flex-wrap text-center">
            <h2 class="text-xl sm:text-3xl text-custom-white w-auto mb-2 sm:mb-0">Your Movie Experiences</h2>
            <p class="text-sm sm:text-base text-white cursor-pointer w-auto text-center sm:text-right ml-0 sm:ml-4">
                <a href="/reviews">View All</a>
            </p>
        </div>

        <!-- Review Card Section -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mt-8">
            <%-- Database Configuration --%>
            <%
                // Using try-with-resources to manage the connection and statement automatically
                try (Connection conn = Database.getConnection()) {
                    String queryReviews = "SELECT * FROM reviews WHERE rating >= 3.5 ORDER BY created_at DESC LIMIT 5";

                    try (PreparedStatement stmt = conn.prepareStatement(queryReviews);
                         ResultSet rsReviews = stmt.executeQuery()) {

                        // Loop through each review and generate a card
                        while (rsReviews.next()) {
                            String reviewerName = rsReviews.getString("reviewer_name");
                            double rating = rsReviews.getDouble("rating");
                            String reviewDescription = rsReviews.getString("review_description");
            %>

            <!-- Review Card -->
            <div class="bg-custom-gray p-4 rounded-md">
                <!-- Top Section -->
                <div class="flex items-center space-x-4">
                    <!-- Reviewer display img -->
                    <div class="rounded-full bg-custom-red w-10 h-10 flex items-center justify-center">
                        <%= reviewerName.substring(0, 1).toUpperCase() %>
                    </div>

                    <!-- Reviewer details, name + rating -->
                    <div class="flex flex-col justify-center">
                        <p class="text-custom-white"><%= reviewerName %>
                        </p>
                        <div class="flex items-center">
                            <span class="text-yellow-500 text-[16px]">★</span>
                            <p class="text-custom-textgray ml-2 text-[16px]"><%= rating %>/5</p>
                        </div>
                    </div>
                </div>

                <!-- Review Description -->
                <p class="text-custom-textgray mb-4 mt-5">
                    <%= reviewDescription %>
                </p>
            </div>

            <%
                        }
                    }
                } catch (Exception e) {
                    System.out.println("<p class='text-red-500'>Error fetching reviews: " + e.getMessage() + "</p>");
                }
            %>
        </div>
    </section>

    <!-- Footer -->
    <%@ include file="views/components/shared/footer.jsp" %>

</div>
</body>
</html>
