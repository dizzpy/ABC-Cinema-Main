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

    <title>Location | ABC Cinema</title>

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
    <%@ include file="/views/components/shared/navbar.jsp" %>


    <div class="container mx-auto px-[240px] py-[100px]">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-y-[59px] gap-x-[50px]">

            <div class="flex flex-col items-start">
                <div class=" w-[495px] h-[256px] rounded-lg bg-cover bg-center bg-[url('/static/assets/images/caro1.png')]"></div>
                <div class=" text-custom-white font-inter text-[24px] mt-[17px]">ABC Cinema Australia</div>
            </div>

            <div class="flex flex-col items-start">
                <div class=" w-[495px] h-[256px] rounded-lg bg-cover bg-center bg-[url('/static/assets/images/caro1.png')]"></div>
                <div class=" text-custom-white font-inter text-[24px] mt-[17px]">ABC Cinema Australia</div>
            </div>

            <div class="flex flex-col items-start">
                <div class=" w-[495px] h-[256px] rounded-lg bg-cover bg-center bg-[url('/static/assets/images/caro1.png')]"></div>
                <div class=" text-custom-white font-inter text-[24px] mt-[17px]">ABC Cinema Australia</div>
            </div>

            <div class="flex flex-col items-start">
                <div class=" w-[495px] h-[256px] rounded-lg bg-cover bg-center bg-[url('/static/assets/images/caro1.png')]"></div>
                <div class=" text-custom-white font-inter text-[24px] mt-[17px]">ABC Cinema Australia</div>
            </div>

            <div class="flex flex-col items-start">
                <div class=" w-[495px] h-[256px] rounded-lg bg-cover bg-center bg-[url('/static/assets/images/caro1.png')]"></div>
                <div class=" text-custom-white font-inter text-[24px] mt-[17px]">ABC Cinema Australia</div>
            </div>
        </div>
    </div>


    <!-- Footer -->
    <%@ include file="/views/components/shared/footer.jsp" %>
</div>
</body>
</html>
