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
            <p class="text-sm sm:text-base text-white cursor-pointer w-auto text-center sm:text-right ml-0 sm:ml-4">View
                All</p>
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
            <p class="text-sm sm:text-base text-white cursor-pointer w-auto text-center sm:text-right ml-0 sm:ml-4">View
                All</p>
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
            <a  class="flex justify-center">
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
    <section class="container max-w-7xl mx-auto py-12 px-4 md:px-8">
        <div class="p-4 flex justify-between items-center mt-5 mb-5 flex-wrap text-center">
            <h2 class="text-xl sm:text-3xl text-custom-white w-auto mb-2 sm:mb-0">Your Movie Experiences</h2>
            <p class="text-sm sm:text-base text-white cursor-pointer w-auto text-center sm:text-right ml-0 sm:ml-4">View
                All</p>
        </div>

        <!-- Review Card Section -->
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-3 gap-6 p-4">

            <%-- Database Configuration --%>
            <%
                try (Connection conn = Database.getConnection()) {
                    String queryReviews = "SELECT * FROM reviews WHERE display_review = TRUE ORDER BY created_at DESC LIMIT 6";

                    try (PreparedStatement stmtReviews = conn.prepareStatement(queryReviews);
                         ResultSet rsReviews = stmtReviews.executeQuery()) {

                        while (rsReviews.next()) {
                            String description = rsReviews.getString("rating_description");
                            String name = rsReviews.getString("users_name");
                            double rating = rsReviews.getDouble("rating_count");
            %>

            <!-- Review Card -->
            <div class="bg-custom-gray text-white p-6 rounded-lg shadow-md">
                <p class="text-base text-normal"><%= description %>
                </p>
                <hr class="border-custom-textgray my-4"/>
                <div class="flex justify-between items-center text-sm">
                    <span class="font-normal"><%= name %></span>
                    <span class="text-custom-textgray"><%= String.format("%.1f", rating) %> / 5</span>
                </div>
            </div>

            <%
                        }
                    }
                } catch (Exception e) {
                    System.out.println("<p>Error fetching reviews: " + e.getMessage() + "</p>");
                }
            %>
        </div>
    </section>

    <!-- Footer -->
    <%@ include file="views/components/shared/footer.jsp" %>

</div>
</body>
</html>
