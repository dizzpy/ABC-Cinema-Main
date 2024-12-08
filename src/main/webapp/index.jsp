<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

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
                Statement stmt = null;

                try {
                    // Fetch movies from the database
                    String queryScreening = "SELECT * FROM movies WHERE is_screening = 1";
                    conn = Database.getConnection(); // Use your Database class for connection
                    stmt = conn.createStatement();
                    ResultSet rsScreening = stmt.executeQuery(queryScreening);

                    // Loop through each movie and generate a card
                    while (rsScreening.next()) {
                        int movieId = rsScreening.getInt("id");
                        String title = rsScreening.getString("title");
                        String imageUrl = rsScreening.getString("image_url");
                        double rating = rsScreening.getDouble("rating");
                        String genres = rsScreening.getString("genres");
            %>

            <!-- Movie Card 1 -->
            <a href="<%= request.getContextPath() %>/views/movies/movie-details.jsp?id=<%= movieId %>"
               class="flex justify-center">
                <div class="w-64 overflow-hidden hover:scale-105 transform transition-all duration-300">
                    <!-- Movie Image -->
                    <img src="<%= imageUrl %>" alt="<%= title %>" class="w-full h-[370px] object-cover">
                    <!-- Movie Info -->
                    <div class="pt-3">
                        <!-- Movie Name & Rating -->
                        <div class="flex justify-between items-center">
                            <h3 class="text-xl font-normal text-white"><%= title %>
                            </h3>
                            <div class="flex items-center justify-center">
                                <img src="<%= request.getContextPath() %>/static/assets/icons/star.svg"
                                     alt="star" class="w-4 h-4 text-yellow-300 mr-2">
                                <p class="text-sm text-yellow-300"><%= String.format("%.1f", rating) %>/10</p>
                            </div>
                        </div>
                        <!-- Movie Genres -->
                        <p class="text-sm text-gray-200 mt-1"><%= genres %>
                        </p>
                    </div>
                </div>
            </a>

            <%--Error Handling--%>
            <%
                    }
                } catch (Exception e) {
                    System.out.println("<p>Error fetching movies: " + e.getMessage() + "</p>");
                } finally {
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
