<nav class="bg-custom-black text-white mt-3">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 flex items-center justify-between h-16">
        <!-- Logo -->
        <a href="index.jsp" class="text-white text-xl font-bold">
            <img src="<%= request.getContextPath() %>static/images/home/logo.svg" alt="Logo">
        </a>

        <!-- Center Links -->
        <div class="hidden md:flex space-x-8">
            <a href="" class="text-custom-white hover:text-white text-sm font-normal">
                Home
            </a>
            <a href="" class="text-custom-white hover:text-white text-sm font-normal">
                Moview
            </a>
            <a href="" class="text-custom-white hover:text-white text-sm font-normal">
                Locations
            </a>
            <a href="" class="text-custom-white hover:text-white text-sm font-normal">
                About Us
            </a>
        </div>

        <!-- Button -->
        <a href="#" class="custom-primary-button">
            Login
        </a>
    </div>
</nav>
