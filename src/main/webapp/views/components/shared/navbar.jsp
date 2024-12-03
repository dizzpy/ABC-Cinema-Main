<nav class="bg-custom-black text-white mt-3 sticky top-0 z-50">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 flex items-center justify-between h-16">
        <!-- Logo -->
        <a href="index.jsp" class="text-white text-xl font-bold">
            <img src="<%= request.getContextPath() %>static/assets/images/logo.svg" alt="Logo">
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

        <!-- Button -->
        <div class="flex space-x-4">
            <!-- Search Button -->
            <button class="px-4 py-2 bg-custom-white text-custom-black border border-custom-black hover:bg-gray-50 font-normal rounded-lg transition-colors duration-200 !py-2 !px-2">
                <img src="<%= request.getContextPath() %>static/assets/icons/search-icon.svg" alt="search"
                     class="text-custom-black">
            </button>

            <!-- Login Button -->
            <a href="#"
               class="px-4 py-2 bg-custom-red text-custom-white font-normal rounded-[8px] transition-colors duration-200">
                Login
            </a>
        </div>
    </div>
</nav>
