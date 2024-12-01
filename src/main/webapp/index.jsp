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

    <title>MyWebApp</title>

    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Tailwind Config -->
    <script src="<%= request.getContextPath() %>/static/js/tailwind-config.js"></script>

    <!-- Custom Styles -->
    <link rel="stylesheet" type="text/tailwindcss" href="<%= request.getContextPath() %>/static/css/style.css">
</head>

<body class="bg-custom-black min-h-screen flex flex-col">
<div class="flex flex-col flex-grow">
    <!-- Navbar -->
    <%@ include file="views/components/shared/navbar.jsp" %>

    <!-- Hero Section -->
    <section class="relative h-screen flex items-center">
        <!-- Background Image with Overlay -->
        <div class="absolute inset-0 z-0">
            <img src="<%= request.getContextPath() %>/static/assets/images/hero-bg.jpg"
                 alt="Hero Background"
                 class="w-full h-full object-cover">
            <div class="absolute inset-0 bg-black bg-opacity-60"></div>
        </div>

        <!-- Content -->
        <div class="relative z-10 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 w-full">
            <div class="max-w-2xl">
                <h1 class="text-5xl font-bold text-white mb-4">Experience the Magic of Cinema</h1>
                <p class="text-lg text-gray-300 mb-8">Book your tickets now and enjoy the latest blockbusters in ultimate comfort</p>
                <button class="custom-primary-button">
                    Book Tickets Now
                </button>
            </div>
        </div>
    </section>

    <!-- Now Showing Movies Section -->
    <section class="py-16">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <!-- Section Header -->
            <div class="flex justify-between items-center mb-8">
                <h2 class="text-2xl font-bold text-white">Now Showing</h2>
                <a href="#" class="text-custom-red hover:text-custom-white transition-colors duration-200">View All</a>
            </div>

            <!-- Movie Grid -->
            <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
                <!-- Movie Card 1 -->
                <div class="bg-custom-gray rounded-lg overflow-hidden">
                    <div class="relative">
                        <img src="<%= request.getContextPath() %>/static/assets/images/movie1.jpg"
                             alt="Movie 1"
                             class="w-full h-[400px] object-cover">
                        <div class="absolute top-2 right-2 bg-custom-red text-white px-2 py-1 rounded text-sm">
                            4.5
                        </div>
                    </div>
                    <div class="p-4">
                        <h3 class="text-white font-semibold mb-2">Movie Title</h3>
                        <div class="flex justify-between items-center">
                            <span class="text-custom-textgray text-sm">2h 35m</span>
                            <button class="custom-primary-button !py-1 !px-3 text-sm">
                                Book Now
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Repeat Movie Card structure 3 more times for grid -->
                <!-- ... -->

            </div>
        </div>
    </section>

    <!-- Footer -->
    <%@ include file="views/components/shared/footer.jsp" %>
</div>
</body>
</html>