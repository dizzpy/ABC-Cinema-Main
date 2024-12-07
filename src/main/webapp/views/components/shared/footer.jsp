<nav class="bg-custom-gray text-white mt-3 sticky top-0 z-50 space-y-6 py-6">

    <!-- Logo + Links -->
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 flex items-center justify-between">
        <!-- Logo -->
        <a href="/" class="text-white text-xl font-bold md:block hidden">
            <img src="<%= request.getContextPath() %>/static/assets/images/logo.svg" alt="Logo">
        </a>

        <!-- Center Links -->
        <div class="hidden md:flex space-x-8">
            <a href="${pageContext.request.contextPath}/"
               class="text-custom-white hover:text-white text-sm font-normal">
                Home
            </a>
            <a href="${pageContext.request.contextPath}/movies"
               class="text-custom-white hover:text-white text-sm font-normal">
                Movies
            </a>
            <a href="${pageContext.request.contextPath}/location"
               class="text-custom-white hover:text-white text-sm font-normal">
                Locations
            </a>
            <a href="${pageContext.request.contextPath}/about"
               class="text-custom-white hover:text-white text-sm font-normal">
                About Us
            </a>
        </div>
    </div>

    <!-- Devider -->
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8  md:block hidden">
        <hr class="border-[#6C6C6C]">
    </div>

    <!-- Copyright Text -->
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-2 text-center text-sm">
        <p>&copy; 2021 ABC Cinema. All rights reserved.</p>
    </div>
</nav>
