<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>

<%@ page import="java.sql.*, databaseInfo.Database" %>

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

    <%-- Tailwind config file --%>
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
        <!-- Title Section -->
        <div class="p-4 flex justify-between items-center mt-5 mb-5 flex-wrap text-center">
            <!-- Title Section -->
            <h2 class="text-xl sm:text-3xl text-custom-white w-auto mb-2 sm:mb-0">Movies in Theaters</h2>
            <!-- View All Section -->
            <p class="text-sm sm:text-base text-white cursor-pointer w-auto text-center sm:text-right ml-0 sm:ml-4">View
                All</p>
        </div>


        <!-- Card Section -->
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6 p-4">

            <%--Database Configuration--%>
            <%
                Connection conn = null;
                PreparedStatement stmt = null;

                try {
                    // SQL query to fetch movies in "Screening Now Home" category
                    String queryScreening = "SELECT * FROM movies_management WHERE category = 'Screening Now Home' AND status = 'Published'";
                    conn = Database.getConnection(); // Use your Database class for connection
                    stmt = conn.prepareStatement(queryScreening);
                    ResultSet rsScreening = stmt.executeQuery();

                    // Loop through each movie and generate a card
                    while (rsScreening.next()) {
                        int movieId = rsScreening.getInt("id");
                        String title = rsScreening.getString("title");
                        String posterUrl = rsScreening.getString("poster_url");
                        String genres = rsScreening.getString("genres");
            %>

            <!-- Movie Card -->
            <a href="<%= request.getContextPath() %>/views/movies/movie-details.jsp?id=<%= movieId %>" class="flex justify-center">
                <div class="w-64 overflow-hidden hover:scale-105 transform transition-all duration-300">
                    <!-- Movie Image -->
                    <img src="<%= posterUrl %>" alt="<%= title %>" class="w-full h-[370px] object-cover">
                    <!-- Movie Info -->
                    <div class="pt-3">
                        <!-- Movie Name -->
                        <h3 class="text-xl font-normal text-white"><%= title %></h3>
                        <!-- Movie Genres -->
                        <p class="text-sm text-gray-200 mt-1"><%= genres %></p>
                    </div>
                </div>
            </a>

            <%-- Error Handling --%>
            <%
                    }
                } catch (Exception e) {
                    System.out.println("<p class='text-red-500'>Error fetching movies: " + e.getMessage() + "</p>");
                } finally {
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                }
            %>

        </div>

    </section>

    <!-- Reviews Section -->
    <section class="container max-w-7xl mx-auto py-12 px-4 md:px-8">

        <!-- Title Section -->
        <div class="p-4 flex justify-between items-center mt-5 mb-5 flex-wrap text-center">
            <!-- Title Section -->
            <h2 class="text-xl sm:text-3xl text-custom-white w-auto mb-2 sm:mb-0">Your Movie Experiences</h2>
            <!-- View All Section -->
            <p class="text-sm sm:text-base text-white cursor-pointer w-auto text-center sm:text-right ml-0 sm:ml-4">View
                All</p>
        </div>

        <!-- Review Card Section -->
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-3 gap-6 p-4">

            <%-- Database Configuration --%>
            <%
                ResultSet rsReviews = null;

                try {
                    // Fetch the latest 6 reviews from the db
                    String queryReviews = "SELECT * FROM reviews WHERE display_review = TRUE ORDER BY created_at DESC LIMIT 6";
                    conn = Database.getConnection(); // Use your Database class for connection
                    stmt = conn.createStatement();
                    rsReviews = stmt.executeQuery(queryReviews);

                    // Loop through the result set and generate a card for each review
                    while (rsReviews.next()) {
                        String description = rsReviews.getString("rating_description");
                        String name = rsReviews.getString("users_name");
                        double rating = rsReviews.getDouble("rating_count");
            %>

            <!-- Review Card -->
            <div class="bg-custom-gray text-white p-6 rounded-lg shadow-md">
                <!-- Review Text -->
                <p class="text-base text-normal">
                    <%= description %>
                </p>

                <!-- Divider -->
                <hr class="border-custom-textgray my-4"/>

                <!-- Reviewer Info -->
                <div class="flex justify-between items-center text-sm">
                    <span class="font-normal"><%= name %></span>
                    <span class="text-custom-textgray"><%= String.format("%.1f", rating) %> / 5</span>
                </div>
            </div>

            <%-- Error Handling --%>
            <%
                    }
                } catch (Exception e) {
                    System.out.println("<p>Error fetching reviews: " + e.getMessage() + "</p>");
                } finally {
                    if (rsReviews != null) rsReviews.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                }
            %>
        </div>
    </section>


    <!-- Footer -->
    <%@ include file="views/components/shared/footer.jsp" %>

</div>
</body>
</html>
