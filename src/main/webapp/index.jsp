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

    <!-- Configure Tailwind -->
    <script>
        tailwind.config = {
            theme: {
                fontFamily: {
                    sans: ['Inter', 'system-ui', 'sans-serif'],
                },
                extend: {
                    colors: {
                        custom: {
                            black: '#171717',
                            red: '#E64C45',
                            white: '#FFFFFF',
                            gray: '#282727',
                            textgray: '#B1B1B1'
                        }
                    },
                },
                plugins: {
                    tailwindcss: {},
                    autoprefixer: {},
                },
            }
        }
    </script>

    <!-- Add component classes -->
    <style type="text/tailwindcss">
        @layer base {
            html {
                font-family: Inter, system-ui, sans-serif;
            }
        }

        @layer components {
            .custom-primary-button {
                @apply px-4 py-2 bg-custom-red text-custom-white font-normal rounded-[8px] transition-colors duration-200;
            }

            .custom-secondary-button {
                @apply px-4 py-2 bg-custom-white text-custom-black border border-custom-black hover:bg-gray-50 font-normal rounded-lg transition-colors duration-200;
            }
        }
    </style>
</head>

<body class="bg-custom-black min-h-screen flex flex-col">
<!-- Main content wrapper -->
<div class="flex flex-col flex-grow">
    <!-- Navbar -->
    <%@ include file="views/components/shared/navbar.jsp" %>

    <!-- Include the carousel -->
    <%@ include file="views/components/home/carousel.jsp" %>

    <!-- Now Showing Movies Section -->
    <section class="container mx-auto py-12 px-4 md:px-8">
        <h2 class="text-3xl text-custom-white text-center mb-8">Now Showing Movies</h2>
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-6">
            <!-- Movie Card 1 -->
            <div class="bg-gray-800 rounded-lg overflow-hidden shadow-lg">
                <img src="path-to-your-movie-image-1.jpg" alt="Movie 1" class="w-full h-64 object-cover">
                <div class="p-4">
                    <h3 class="text-xl text-white font-semibold">Movie Title 1</h3>
                    <p class="text-sm text-gray-400 mt-2">Released: 2024</p>
                    <div class="mt-4 flex gap-2">
                        <a href="#" class="custom-primary-button w-full">Buy Ticket</a>
                        <a href="#" class="custom-secondary-button w-full">Watch Trailer</a>
                    </div>
                </div>
            </div>

            <!-- Movie Card 2 -->
            <div class="bg-gray-800 rounded-lg overflow-hidden shadow-lg">
                <img src="path-to-your-movie-image-2.jpg" alt="Movie 2" class="w-full h-64 object-cover">
                <div class="p-4">
                    <h3 class="text-xl text-white font-semibold">Movie Title 2</h3>
                    <p class="text-sm text-gray-400 mt-2">Coming Soon</p>
                    <div class="mt-4 flex gap-2">
                        <a href="#" class="custom-primary-button w-full">Buy Ticket</a>
                        <a href="#" class="custom-secondary-button w-full">Watch Trailer</a>
                    </div>
                </div>
            </div>

            <!-- Movie Card 3 -->
            <div class="bg-gray-800 rounded-lg overflow-hidden shadow-lg">
                <img src="path-to-your-movie-image-3.jpg" alt="Movie 3" class="w-full h-64 object-cover">
                <div class="p-4">
                    <h3 class="text-xl text-white font-semibold">Movie Title 3</h3>
                    <p class="text-sm text-gray-400 mt-2">Released: 2024</p>
                    <div class="mt-4 flex gap-2">
                        <a href="#" class="custom-primary-button w-full">Buy Ticket</a>
                        <a href="#" class="custom-secondary-button w-full">Watch Trailer</a>
                    </div>
                </div>
            </div>

            <!-- Movie Card 4 -->
            <div class="bg-gray-800 rounded-lg overflow-hidden shadow-lg">
                <img src="path-to-your-movie-image-4.jpg" alt="Movie 4" class="w-full h-64 object-cover">
                <div class="p-4">
                    <h3 class="text-xl text-white font-semibold">Movie Title 4</h3>
                    <p class="text-sm text-gray-400 mt-2">Now Showing</p>
                    <div class="mt-4 flex gap-2">
                        <a href="#" class="custom-primary-button w-full">Buy Ticket</a>
                        <a href="#" class="custom-secondary-button w-full">Watch Trailer</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <%@ include file="views/components/shared/footer.jsp" %>
</div>
</body>
</html>
