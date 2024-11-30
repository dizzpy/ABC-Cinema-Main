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

    <!-- Hero Section Carousel -->
    <div class="relative flex-grow" id="carousel">
        <!-- Carousel container -->
        <div class="absolute inset-0" id="slider">

            <!-- Slide 1 -->
            <div class="absolute inset-0 w-full h-full bg-cover bg-center transform transition-all duration-500 ease-in-out"
                 style="background-image: url('${pageContext.request.contextPath}/static/assets/images/caro.png');"
                 data-slide="0">
                <div class="absolute inset-0" style="background: linear-gradient(to bottom,
                rgba(0, 0, 0, 0) 0%,
                rgba(0, 0, 0, 0.2) 40%,
                rgba(0, 0, 0, 0.7) 70%,
                rgba(0, 0, 0, 0.9) 85%,
                rgba(0, 0, 0, 1) 100%);">
                    <div class="absolute bottom-0 left-0 p-6 md:bottom-20 md:left-20 md:pl-[70px] md:pb-[70px] text-white w-full md:w-auto">
                        <p class="text-base md:text-lg mb-2">In Cinemas 8th November</p>
                        <h1 class="text-4xl md:text-[67px] font-normal mb-2 md:mb-4 uppercase leading-tight">
                            Inception</h1>
                        <div class="flex items-center space-x-3 md:space-x-4 mb-4 text-custom-textgray">
                            <p class="text-sm md:text-base">Action, Comedy</p>
                            <div class="w-1 h-1 bg-custom-textgray rounded-full"></div>
                            <p class="text-sm md:text-base">2024</p>
                        </div>
                        <div class="flex flex-col space-y-3 sm:flex-row sm:space-y-0 sm:space-x-4 md:mb-4">
                            <a class="custom-primary-button text-center w-full sm:w-auto" href="#">Buy Ticket</a>
                            <a class="custom-secondary-button text-center w-full sm:w-auto" href="#">Watch Trailer</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Slide 2 -->
            <div class="absolute inset-0 w-full h-full bg-cover bg-center transform transition-all duration-500 ease-in-out translate-x-full"
                 style="background-image: url('${pageContext.request.contextPath}/static/assets/images/caro2.png');"
                 data-slide="1">
                <div class="absolute inset-0" style="background: linear-gradient(to bottom,
                rgba(0, 0, 0, 0) 0%,
                rgba(0, 0, 0, 0.2) 40%,
                rgba(0, 0, 0, 0.7) 70%,
                rgba(0, 0, 0, 0.9) 85%,
                rgba(0, 0, 0, 1) 100%);">
                    <div class="absolute bottom-0 left-0 p-6 md:bottom-20 md:left-20 md:pl-[70px] md:pb-[70px] text-white w-full md:w-auto">
                        <p class="text-base md:text-lg mb-2">In Cinemas 15th December</p>
                        <h1 class="text-4xl md:text-[67px] font-normal mb-2 md:mb-4 uppercase leading-tight">The
                            Matrix</h1>
                        <div class="flex items-center space-x-3 md:space-x-4 mb-4 text-custom-textgray">
                            <p class="text-sm md:text-base">Sci-Fi, Action</p>
                            <div class="w-1 h-1 bg-custom-textgray rounded-full"></div>
                            <p class="text-sm md:text-base">2024</p>
                        </div>
                        <div class="flex flex-col space-y-3 sm:flex-row sm:space-y-0 sm:space-x-4 md:mb-4">
                            <a class="custom-primary-button text-center w-full sm:w-auto" href="#">Buy Ticket</a>
                            <a class="custom-secondary-button text-center w-full sm:w-auto" href="#">Watch Trailer</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Slide 3 -->
            <div class="absolute inset-0 w-full h-full bg-cover bg-center transform transition-all duration-500 ease-in-out translate-x-full"
                 style="background-image: url('${pageContext.request.contextPath}/static/assets/images/caro3.png');"
                 data-slide="2">
                <div class="absolute inset-0" style="background: linear-gradient(to bottom,
                rgba(0, 0, 0, 0) 0%,
                rgba(0, 0, 0, 0.2) 40%,
                rgba(0, 0, 0, 0.7) 70%,
                rgba(0, 0, 0, 0.9) 85%,
                rgba(0, 0, 0, 1) 100%);">
                    <div class="absolute bottom-0 left-0 p-6 md:bottom-20 md:left-20 md:pl-[70px] md:pb-[70px] text-white w-full md:w-auto">
                        <p class="text-base md:text-lg mb-2">In Cinemas 22nd December</p>
                        <h1 class="text-4xl md:text-[67px] font-normal mb-2 md:mb-4 uppercase leading-tight">Dune</h1>
                        <div class="flex items-center space-x-3 md:space-x-4 mb-4 text-custom-textgray">
                            <p class="text-sm md:text-base">Sci-Fi, Adventure</p>
                            <div class="w-1 h-1 bg-custom-textgray rounded-full"></div>
                            <p class="text-sm md:text-base">2024</p>
                        </div>
                        <div class="flex flex-col space-y-3 sm:flex-row sm:space-y-0 sm:space-x-4 md:mb-4">
                            <a class="custom-primary-button text-center w-full sm:w-auto" href="#">Buy Ticket</a>
                            <a class="custom-secondary-button text-center w-full sm:w-auto" href="#">Watch Trailer</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Slide 4 -->
            <div class="absolute inset-0 w-full h-full bg-cover bg-center transform transition-all duration-500 ease-in-out translate-x-full"
                 style="background-image: url('${pageContext.request.contextPath}/static/assets/images/caro4.png');"
                 data-slide="3">
                <div class="absolute inset-0" style="background: linear-gradient(to bottom,
                rgba(0, 0, 0, 0) 0%,
                rgba(0, 0, 0, 0.2) 40%,
                rgba(0, 0, 0, 0.7) 70%,
                rgba(0, 0, 0, 0.9) 85%,
                rgba(0, 0, 0, 1) 100%);">
                    <div class="absolute bottom-0 left-0 p-6 md:bottom-20 md:left-20 md:pl-[70px] md:pb-[70px] text-white w-full md:w-auto">
                        <p class="text-base md:text-lg mb-2">In Cinemas 29th December</p>
                        <h1 class="text-4xl md:text-[67px] font-normal mb-2 md:mb-4 uppercase leading-tight">Blade
                            Runner</h1>
                        <div class="flex items-center space-x-3 md:space-x-4 mb-4 text-custom-textgray">
                            <p class="text-sm md:text-base">Sci-Fi, Thriller</p>
                            <div class="w-1 h-1 bg-custom-textgray rounded-full"></div>
                            <p class="text-sm md:text-base">2024</p>
                        </div>
                        <div class="flex flex-col space-y-3 sm:flex-row sm:space-y-0 sm:space-x-4 md:mb-4">
                            <a class="custom-primary-button text-center w-full sm:w-auto" href="#">Buy Ticket</a>
                            <a class="custom-secondary-button text-center w-full sm:w-auto" href="#">Watch Trailer</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Dots Navigation -->
            <div class="absolute bottom-5 left-0 right-0">
                <div class="flex items-center justify-center gap-2">
                    <button onclick="goToSlide(0)"
                            class="w-3 h-3 rounded-full bg-white bg-opacity-50 hover:bg-opacity-100 transition duration-300 ease-in-out"></button>
                    <button onclick="goToSlide(1)"
                            class="w-3 h-3 rounded-full bg-white bg-opacity-50 hover:bg-opacity-100 transition duration-300 ease-in-out"></button>
                    <button onclick="goToSlide(2)"
                            class="w-3 h-3 rounded-full bg-white bg-opacity-50 hover:bg-opacity-100 transition duration-300 ease-in-out"></button>
                    <button onclick="goToSlide(3)"
                            class="w-3 h-3 rounded-full bg-white bg-opacity-50 hover:bg-opacity-100 transition duration-300 ease-in-out"></button>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <%@ include file="views/components/shared/footer.jsp" %>

    <!-- Carousel JavaScript -->
    <script>
        let currentSlide = 0;
        const slides = document.querySelectorAll('[data-slide]');
        const dots = document.querySelectorAll('.bottom-5 button');

        function updateSlides() {
            slides.forEach((slide, index) => {
                if (index === currentSlide) {
                    slide.classList.remove('translate-x-full', '-translate-x-full');
                } else if (index > currentSlide) {
                    slide.classList.remove('-translate-x-full');
                    slide.classList.add('translate-x-full');
                } else {
                    slide.classList.remove('translate-x-full');
                    slide.classList.add('-translate-x-full');
                }
            });

            // Update dots
            dots.forEach((dot, index) => {
                if (index === currentSlide) {
                    dot.classList.add('bg-opacity-100');
                } else {
                    dot.classList.remove('bg-opacity-100');
                }
            });
        }

        function goToSlide(slideIndex) {
            currentSlide = slideIndex;
            updateSlides();
        }

        // Auto-advance slides every 5 seconds
        setInterval(() => {
            currentSlide = (currentSlide + 1) % slides.length;
            updateSlides();
        }, 5000);

        // Initial setup
        updateSlides();
    </script>
</body>
</html>