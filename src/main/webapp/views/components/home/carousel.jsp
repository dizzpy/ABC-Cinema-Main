<!-- carousel.jsp -->
<div class="relative w-full overflow-hidden" id="carousel">
    <!-- Carousel container -->
    <div class="relative w-full" id="slider" style="height: calc(100vh - 60px);">
        <!-- Slide 1 -->
        <div class="carousel-slide absolute inset-0 w-full h-full bg-cover bg-center transition-opacity duration-1000 ease-in-out opacity-0"
             style="background-image: url('${pageContext.request.contextPath}/static/assets/images/caro1.jpg');"
             data-slide="0">
            <div class="absolute inset-0 flex justify-center items-center bg-gradient-to-t from-black via-transparent to-black p-6 md:p-20">
                <div class="text-white text-center">
                    <h2 class="text-xl md:text-4xl mb-4">Inception</h2>
                    <p class="text-sm md:text-lg mb-4">In Cinemas 8th November</p>
                    <div class="flex justify-center gap-3">
                        <a href="#" class="custom-primary-button">Buy Ticket</a>
                        <a href="#" class="custom-secondary-button">Watch Trailer</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Slide 2 -->
        <div class="carousel-slide absolute inset-0 w-full h-full bg-cover bg-center transition-opacity duration-1000 ease-in-out opacity-0"
             style="background-image: url('${pageContext.request.contextPath}/static/assets/images/caro2.jpg');"
             data-slide="1">
            <div class="absolute inset-0 flex justify-center items-center bg-gradient-to-t from-black via-transparent to-black p-6 md:p-20">
                <div class="text-white text-center">
                    <h2 class="text-xl md:text-4xl mb-4">The Dark Knight</h2>
                    <p class="text-sm md:text-lg mb-4">Coming Soon</p>
                    <div class="flex justify-center gap-3">
                        <a href="#" class="custom-primary-button">Buy Ticket</a>
                        <a href="#" class="custom-secondary-button">Watch Trailer</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Slide 3 -->
        <div class="carousel-slide absolute inset-0 w-full h-full bg-cover bg-center transition-opacity duration-1000 ease-in-out opacity-0"
             style="background-image: url('${pageContext.request.contextPath}/static/assets/images/caro3.jpg');"
             data-slide="2">
            <div class="absolute inset-0 flex justify-center items-center bg-gradient-to-t from-black via-transparent to-black p-6 md:p-20">
                <div class="text-white text-center">
                    <h2 class="text-xl md:text-4xl mb-4">Interstellar</h2>
                    <p class="text-sm md:text-lg mb-4">Now Showing</p>
                    <div class="flex justify-center gap-3">
                        <a href="#" class="custom-primary-button">Buy Ticket</a>
                        <a href="#" class="custom-secondary-button">Watch Trailer</a>
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
