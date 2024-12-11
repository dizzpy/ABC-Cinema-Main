<%@ page import="java.sql.*" %>
<%@ page import="databaseInfo.Database" %>

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

    <title>Movie Name | ABC Cinema</title>

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
    <%@ include file="../components/shared/navbar.jsp" %>

    <!-- Now Showing Movies Section -->
    <section class="container max-w-7xl mx-auto py-12 px-4 md:px-8">

        <%-- Movie Preview Section --%>
        <div class="mx-auto container mt-10">
            <div class="flex flex-col md:flex-row items-start justify-center space-x-0 md:space-x-16">


                <%-- Database Configuration and Fetch Movie Details --%>
                <%
                    Connection conn = null;
                    PreparedStatement stmt = null;

                    // Get the movieId from the URL parameter
                    String movieIdParam = request.getParameter("id");

                    try {
                        if (movieIdParam != null && !movieIdParam.isEmpty()) {
                            int movieId = Integer.parseInt(movieIdParam); // Convert movie ID to integer

                            // Establish database connection
                            conn = Database.getConnection(); // Use your Database class for connection
                            String query = "SELECT * FROM movies_management WHERE id = ?";
                            stmt = conn.prepareStatement(query);
                            stmt.setInt(1, movieId);
                            ResultSet rs = stmt.executeQuery();

                            if (rs.next()) {
                                // Retrieve movie details from the database
                                String posterUrl = rs.getString("poster_url");
                                String title = rs.getString("title");
                                String description = rs.getString("description");
                                String genres = rs.getString("genres");
                                String pg = rs.getString("pg");
                                String category = rs.getString("category");
                %>


                <!-- Movie Poster -->
                <div class="w-[268.53px] h-[355px] mx-auto md:mx-0">
                    <img src="<%= posterUrl %>"
                         alt="Venom"
                         class="rounded w-full h-full object-cover">
                </div>

                <!-- Movie Details -->
                <div class="w-full md:w-2/3 md:mt-0 mt-10">
                    <!-- Movie Title -->
                    <p class="text-[36px] md:text-[42px] text-custom-white font-bold">
                        <%= title %>
                    </p>

                    <!-- Runtime, Category, Ratings -->
                    <div class="flex flex-row items-center space-x-4 mt-4">
                        <!-- Run Time -->
                        <div class="flex flex-row items-center">
                            <img src="${pageContext.request.contextPath}/static/assets/icons/clock-white.svg"
                                 alt="Run Time" class="h-5 w-5">
                            <p class="text-sm md:text-base text-custom-textgray ml-1 font-normal">1h 37m</p>
                        </div>

                        <!-- Separator -->
                        <div class="h-2 w-2 rounded-full bg-custom-white"></div>

                        <!-- Category -->
                        <div class="flex flex-row items-center">
                            <p class="text-sm md:text-base text-custom-textgray font-normal"><%= pg %></p>
                        </div>

                        <!-- Separator -->
                        <div class="h-2 w-2 rounded-full bg-custom-white"></div>

                        <!-- IMDb Ratings -->
                        <div class="flex flex-row items-center space-x-2">
                            <img src="${pageContext.request.contextPath}/static/assets/icons/imdb-logo.png"
                                 alt="IMDb Logo" class="h-5 w-auto">
                            <p class="text-sm md:text-base text-custom-textgray font-normal">8.2/10</p>
                        </div>
                    </div>

                    <p class="text-xl text-custom-white mt-4">Overview</p>

                    <!-- Movie Description -->
                    <p class="text-sm md:text-base text-custom-textgray mt-4">
                        <%= description %>
                    </p>

                    <p class="text-xl text-custom-white mt-5">Category</p>

                    <p class="text-sm md:text-base text-custom-textgray mt-2">
                        <%= genres %>
                    </p>

                    <!-- Buttons Section -->
                    <div class="flex flex-row space-x-4 mt-5">
                        <!-- Watch Trailer Button -->
                        <a href="#"
                           class="flex flex-row items-center px-4 py-2 bg-custom-white text-custom-black border border-custom-black hover:bg-gray-50 font-medium rounded-lg transition-colors duration-200 decoration-none">
                            <span class="text-base">Watch Trailer</span>
                            <img src="${pageContext.request.contextPath}/static/assets/icons/play.svg"
                                 alt="play" class="h-4 w-4 ml-2">
                        </a>

                        <!-- Book Now Button -->
                        <a href="#SelectSeats"
                           class="px-4 py-2 bg-custom-red text-custom-white font-normal rounded-[8px] transition-colors duration-200">
                            <span class="text-base">Book Now</span>
                        </a>
                    </div>
                </div>

                    <%
                    } else {
                    %>
                    <p class="error-message text-red-500">Movie not found for the provided ID.</p>
                    <%
                            }
                        }
                    } catch (NumberFormatException e) {
                    %>
                    <p class="error-message text-red-500">Invalid movie ID format. Please provide a valid ID.</p>
                    <%
                    } catch (Exception e) {
                    %>
                    <p class="error-message text-red-500">Error retrieving movie details: <%= e.getMessage() %></p>
                    <%
                        } finally {
                            if (stmt != null) stmt.close();
                            if (conn != null) conn.close();
                        }
                    %>

            </div>
        </div>

        <!-- Sheets Section Bar Section Start -->
        <!-- Title Section -->
        <p class="text-xl text-custom-red w-auto mt-24">
            Select Your Seats Here
        </p>

        <%--  select bar  --%>
        <div class="bg-custom-gray text-white p-6 rounded-lg flex flex-col md:flex-row justify-around items-center md:space-x-4 space-y-6 md:space-y-0 max-w-7xl mx-auto mt-6">
            <!-- Location -->
            <div class="w-full md:w-auto flex flex-col">
                <div class="flex items-center space-x-2">
                    <img src="<%= request.getContextPath() %>/static/assets/icons/location.svg" alt="Location"
                         class="h-5 w-5 text-custom-red">
                    <span class="text-[16px] font-normal text-custom-textgray">Location</span>
                </div>
                <select
                        class="mt-1 w-full md:w-auto text-[18px] font-normal bg-custom-gray text-white border-none rounded-md focus:ring-2 focus:ring-custom-red focus:outline-none cursor-pointer">
                    <option value="Wellawatta">ABC Wellawatta</option>
                    <option value="Colombo">ABC Colombo</option>
                    <option value="Kandy">ABC Kandy</option>
                </select>
            </div>

            <!-- Show Time -->
            <div class="w-full md:w-auto flex flex-col">
                <div class="flex items-center space-x-2">
                    <img src="<%= request.getContextPath() %>/static/assets/icons/time.svg" alt="Show Time"
                         class="h-5 w-5 text-custom-red">
                    <span class="text-[16px] font-normal text-custom-textgray">Show Time</span>
                </div>
                <select
                        class="mt-1 w-full md:w-auto text-[18px] font-normal bg-custom-gray text-white border-none rounded-md focus:ring-2 focus:ring-custom-red focus:outline-none cursor-pointer">
                    <option value="10.30">10.30 PM</option>
                    <option value="1.30">1.30 PM</option>
                    <option value="7.30">7.30 PM</option>
                </select>
            </div>

            <!-- Date -->
            <div class="w-full md:w-auto flex flex-col">
                <div class="flex items-center space-x-2">
                    <img src="<%= request.getContextPath() %>/static/assets/icons/calender.svg" alt="Date"
                         class="h-5 w-5 text-custom-red">
                    <span class="text-[16px] font-normal text-custom-textgray">Date</span>
                </div>
                <select
                        class="mt-1 w-full md:w-auto text-[18px] font-normal bg-custom-gray text-white border-none rounded-md focus:ring-2 focus:ring-custom-red focus:outline-none cursor-pointer">
                    <option value="25-Dec">25 December</option>
                    <option value="26-Dec">26 December</option>
                    <option value="27-Dec">27 December</option>
                </select>
            </div>
        </div>
        <!-- Sheets Section Bar Section End -->

    </section>

    <!-- SCREEN -->
    <img src="${pageContext.request.contextPath}/static/assets/screen.png" alt="Seats"
         class="w-full h-[550px] mx-auto mt-10 object-cover">

    <!--
    --------------------------------------------------------------
    Seats Section Start
    --------------------------------------------------------------
    -->

    <div id="SelectSeats" class="max-w-4xl h-[400px] mx-auto container">
        <!-- Seat Grid -->
        <div class="grid grid-cols-10 gap-1 h-full">
            <%
                // Define rows and columns
                String[] rows = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J"};
                int columns = 10;

                // Loop through rows and columns to create seats
                for (String row : rows) {
                    for (int col = 1; col <= columns; col++) {
                        String seatId = row + col;
            %>
            <!-- Seat Button -->
            <button
                    id="<%= seatId %>"
                    class="seat w-full h-full border border-custom-white rounded hover:text-custom-textgray text-white transition"
                    onclick="toggleSeatSelection('<%= seatId %>')">
                <%= seatId %>
            </button>
            <%
                    }
                }
            %>
        </div>

        <!-- Selected Seats Section | @akila me tik ain krl dnn.nikn damme ubt lesi wenn. -->
        <%-- <div class="my-20"> --%>
        <%-- <h2 class="text-xl text-white">Selected Seats:</h2> --%>
        <%-- <div id="selectedSeats" class="text-white"></div> --%>
        <%-- </div> --%>
    </div>

    <!--
    --------------------------------------------------------------
    Seats Section End
    --------------------------------------------------------------
    -->

    <!-- Available | Selected | Booked -->
    <div class="flex flex-row space-x-16 mx-auto my-12">
        <div class="flex flex-row items-center space-x-2">
            <div class="w-4 h-4 border border-custom-white rounded"></div>
            <span class="text-[16px] font-normal text-custom-textgray">Available</span>
        </div>

        <div class="flex flex-row items-center space-x-2">
            <div class="w-4 h-4 bg-custom-red rounded"></div>
            <span class="text-[16px] font-normal text-custom-textgray">Selected</span>
        </div>

        <div class="flex flex-row items-center space-x-2">
            <div class="w-4 h-4 bg-custom-white rounded"></div>
            <span class="text-[16px] font-normal text-custom-textgray">Booked</span>
        </div>
    </div>

    <!-- Total Price for selected seats -->
    <div class="flex flex-row justify-center mt-[20px]">
        <p class="text-xl text-custom-white">Total Price: LKR 1000</p>
    </div>

    <!-- Continue to Payment | Discard buttons -->
    <div class="flex flex-row justify-center space-x-4 mt-10 mb-[80px]">

        <!-- Discard Button -->
        <a href="#"
           class="px-4 py-2 bg-custom-gray text-white font-normal rounded-[8px] transition-colors duration-200">
            <span class="text-base">Discard</span>
        </a>

        <!-- Continue to Payment Button -->
        <a href="#"
           class="px-4 py-2 bg-custom-red text-custom-white font-normal rounded-[8px] transition-colors duration-200">
            <span class="text-base">Continue to Payment</span>
        </a>
    </div>


    <!-- Footer -->
    <%@ include file="/views/components/shared/footer.jsp" %>


    <!-- JavaScript to Handle Seat Selection -->
    <script>
        // Array to store selected seat IDs
        let selectedSeats = [];

        // Function to toggle seat selection
        function toggleSeatSelection(seatId) {
            const seat = document.getElementById(seatId);

            // Toggle selected class for the seat
            if (seat.classList.contains('bg-custom-red')) {
                // Remove from selected seats array and update button style
                selectedSeats = selectedSeats.filter(item => item !== seatId);
                seat.classList.remove('bg-custom-red');
                seat.classList.add('hover:bg-custom-red');
            } else {
                // Add to selected seats array and update button style
                selectedSeats.push(seatId);
                seat.classList.add('bg-custom-red');
                seat.classList.remove('hover:bg-custom-red');
            }

            // Update the displayed selected seats at the bottom
            displaySelectedSeats();
        }

        // Function to display selected seats at the bottom
        function displaySelectedSeats() {
            const selectedSeatsDiv = document.getElementById('selectedSeats');
            selectedSeatsDiv.innerHTML = selectedSeats.join(', '); // Display selected seats as a comma-separated list
        }
    </script>
</div>
</body>
</html>
