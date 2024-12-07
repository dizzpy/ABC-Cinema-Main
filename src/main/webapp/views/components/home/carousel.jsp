<div class="relative w-full overflow-hidden" id="carousel">
    <!-- Carousel container -->
    <div class="relative w-full" id="slider" style="height: calc(100vh - 60px);">
        <!-- Slide 1 -->
        <div class="carousel-slide absolute inset-0 w-full h-full bg-cover bg-center transform transition-all duration-500 ease-in-out"
             style="background-image: url('${pageContext.request.contextPath}/static/assets/images/caro1.jpg');"
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
                        <a class="px-4 py-2 bg-custom-red text-custom-white font-normal rounded-[8px] transition-colors duration-200 text-center w-full sm:w-auto" href="#">Buy Ticket</a>
                        <a class="px-4 py-2 bg-custom-white text-custom-black border border-custom-black hover:bg-gray-50 font-normal rounded-lg transition-colors duration-200 text-center w-full sm:w-auto" href="#">Watch Trailer</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Slide 2 -->
        <div class="carousel-slide absolute inset-0 w-full h-full bg-cover bg-center transform transition-all duration-500 ease-in-out"
             style="background-image: url('${pageContext.request.contextPath}/static/assets/images/caro2.jpg');"
             data-slide="1">
            <div class="absolute inset-0" style="background: linear-gradient(to bottom,
                rgba(0, 0, 0, 0) 0%,
                rgba(0, 0, 0, 0.2) 40%,
                rgba(0, 0, 0, 0.7) 70%,
                rgba(0, 0, 0, 0.9) 85%,
                rgba(0, 0, 0, 1) 100%);">
                <div class="absolute bottom-0 left-0 p-6 md:bottom-20 md:left-20 md:pl-[70px] md:pb-[70px] text-white w-full md:w-auto">
                    <p class="text-base md:text-lg mb-2">Coming Soon</p>
                    <h1 class="text-4xl md:text-[67px] font-normal mb-2 md:mb-4 uppercase leading-tight">
                        The Dark Knight</h1>
                    <div class="flex items-center space-x-3 md:space-x-4 mb-4 text-custom-textgray">
                        <p class="text-sm md:text-base">Action, Thriller</p>
                        <div class="w-1 h-1 bg-custom-textgray rounded-full"></div>
                        <p class="text-sm md:text-base">2024</p>
                    </div>
                    <div class="flex flex-col space-y-3 sm:flex-row sm:space-y-0 sm:space-x-4 md:mb-4">
                        <a class="px-4 py-2 bg-custom-red text-custom-white font-normal rounded-[8px] transition-colors duration-200 text-center w-full sm:w-auto" href="#">Buy Ticket</a>
                        <a class="px-4 py-2 bg-custom-white text-custom-black border border-custom-black hover:bg-gray-50 font-normal rounded-lg transition-colors duration-200 text-center w-full sm:w-auto" href="#">Watch Trailer</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Slide 3 -->
        <div class="carousel-slide absolute inset-0 w-full h-full bg-cover bg-center transform transition-all duration-500 ease-in-out"
             style="background-image: url('${pageContext.request.contextPath}/static/assets/images/caro3.jpg');"
             data-slide="2">
            <div class="absolute inset-0" style="background: linear-gradient(to bottom,
                rgba(0, 0, 0, 0) 0%,
                rgba(0, 0, 0, 0.2) 40%,
                rgba(0, 0, 0, 0.7) 70%,
                rgba(0, 0, 0, 0.9) 85%,
                rgba(0, 0, 0, 1) 100%);">
                <div class="absolute bottom-0 left-0 p-6 md:bottom-20 md:left-20 md:pl-[70px] md:pb-[70px] text-white w-full md:w-auto">
                    <p class="text-base md:text-lg mb-2">Now Showing</p>
                    <h1 class="text-4xl md:text-[67px] font-normal mb-2 md:mb-4 uppercase leading-tight">
                        Interstellar</h1>
                    <div class="flex items-center space-x-3 md:space-x-4 mb-4 text-custom-textgray">
                        <p class="text-sm md:text-base">Sci-Fi, Drama</p>
                        <div class="w-1 h-1 bg-custom-textgray rounded-full"></div>
                        <p class="text-sm md:text-base">2024</p>
                    </div>
                    <div class="flex flex-col space-y-3 sm:flex-row sm:space-y-0 sm:space-x-4 md:mb-4">
                        <a class="px-4 py-2 bg-custom-red text-custom-white font-normal rounded-[8px] transition-colors duration-200 text-center w-full sm:w-auto" href="#">Buy Ticket</a>
                        <a class="px-4 py-2 bg-custom-white text-custom-black border border-custom-black hover:bg-gray-50 font-normal rounded-lg transition-colors duration-200 text-center w-full sm:w-auto" href="#">Watch Trailer</a>
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
            </div>
        </div>
    </div>
</div>

<!-- Carousel JavaScript -->
<script>
    document.addEventListener('DOMContentLoaded', () => {
        let currentSlide = 0;
        const slides = document.querySelectorAll('.carousel-slide');
        const dots = document.querySelectorAll('.bottom-5 button');

        function updateSlides() {
            slides.forEach((slide, index) => {
                if (index === currentSlide) {
                    slide.classList.add('opacity-100');
                    slide.classList.remove('opacity-0');
                } else {
                    slide.classList.add('opacity-0');
                    slide.classList.remove('opacity-100');
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
    });
</script>
