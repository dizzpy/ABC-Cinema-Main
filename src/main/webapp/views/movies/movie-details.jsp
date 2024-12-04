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
        <!-- Title Section -->
        <p class="text-xl text-custom-red w-auto">
            Select Your Seats Here
        </p>

        <%--  select bar  --%>
        <div class="bg-custom-gray text-white p-6 rounded-lg flex flex-col md:flex-row justify-around items-center md:space-x-4 space-y-6 md:space-y-0 max-w-7xl mx-auto mt-10">
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


    </section>

    <!-- Footer -->
    <%--    <%@ include file="views/components/shared/footer.jsp" %>--%>
</div>
</body>
</html>
