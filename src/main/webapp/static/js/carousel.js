// static/js/carousel.js
document.addEventListener('DOMContentLoaded', function() {
    const carousel = {
        currentSlide: 0,
        slides: document.querySelectorAll('[data-slide]'),
        prevButton: document.getElementById('prevSlide'),
        nextButton: document.getElementById('nextSlide'),
        autoPlayInterval: null,
        autoPlayDelay: 5000, // 5 seconds

        init() {
            if (this.slides.length <= 1) return;
            this.updateSlide(0);
            this.setupEventListeners();
            this.startAutoPlay();
        },

        updateSlide(newIndex) {
            this.slides.forEach((slide, index) => {
                if (index === newIndex) {
                    slide.style.opacity = '1';
                    slide.style.zIndex = '1';
                } else {
                    slide.style.opacity = '0';
                    slide.style.zIndex = '0';
                }
            });
            this.currentSlide = newIndex;
        },

        nextSlide() {
            const next = (this.currentSlide + 1) % this.slides.length;
            this.updateSlide(next);
        },

        prevSlide() {
            const prev = (this.currentSlide - 1 + this.slides.length) % this.slides.length;
            this.updateSlide(prev);
        },

        startAutoPlay() {
            if (this.autoPlayInterval) {
                clearInterval(this.autoPlayInterval);
            }
            this.autoPlayInterval = setInterval(() => {
                this.nextSlide();
            }, this.autoPlayDelay);
        },

        stopAutoPlay() {
            if (this.autoPlayInterval) {
                clearInterval(this.autoPlayInterval);
                this.autoPlayInterval = null;
            }
        },

        resetAutoPlay() {
            this.stopAutoPlay();
            this.startAutoPlay();
        },

        setupEventListeners() {
            // Arrow button navigation
            this.prevButton.addEventListener('click', () => {
                this.prevSlide();
                this.resetAutoPlay();
            });

            this.nextButton.addEventListener('click', () => {
                this.nextSlide();
                this.resetAutoPlay();
            });

            // Keyboard navigation
            document.addEventListener('keydown', (e) => {
                if (e.key === 'ArrowLeft') {
                    this.prevSlide();
                    this.resetAutoPlay();
                }
                if (e.key === 'ArrowRight') {
                    this.nextSlide();
                    this.resetAutoPlay();
                }
            });

            // Pause on hover
            const carouselSection = document.querySelector('section');
            carouselSection.addEventListener('mouseenter', () => this.stopAutoPlay());
            carouselSection.addEventListener('mouseleave', () => this.startAutoPlay());
        }
    };

    carousel.init();
});