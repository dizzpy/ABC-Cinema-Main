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

    <title>Reviews | ABC Cinema</title>

    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>

    <%-- Tailwind config file --%>
    <script src="${pageContext.request.contextPath}/static/js/tailwind-config.js"></script>
    <link href="${pageContext.request.contextPath}/static/css/style.css">
</head>

<body class="bg-custom-black min-h-screen text-custom-white">
<!-- Navbar -->
<%@ include file="../components/shared/navbar.jsp" %>

<!-- Main content wrapper -->
<div class="container max-w-7xl mx-auto py-12 px-4 md:px-8 flex flex-col md:flex-row space-y-4 md:space-y-0 md:space-x-4 mt-10 md:mt-[120px]">
    <!-- Text content section -->
    <div class="content-center w-full md:w-1/2 p-4">
        <div class="text-lg font-normal ">Add Your Rating</div>
        <div class="text-white text-[40px] font-normal tracking-wide">Let Others Know<br/>Your Opinion</div>
        <p class="text-custom-textgray text-lg max-w-[400px]">Share your honest thoughts about the movie. Highlight what
            you liked or did not to help others decide!</p>
    </div>

    <!-- Review textbox section -->
    <div class="content-center w-full md:w-1/2 p-4">

        <!-- Star Rating -->
        <div class="flex mb-6">
            <span class="text-yellow-500 text-5xl">&#9733;</span>
            <span class="text-yellow-500 text-5xl">&#9733;</span>
            <span class="text-yellow-500 text-5xl">&#9733;</span>
            <span class="text-yellow-500 text-5xl">&#9733;</span>
            <span class="text-yellow-500 text-5xl">&#9733;</span>
        </div>

        <!-- Name Textbox -->
        <input
                type="text"
                id="name"
                name="name"
                placeholder="john doe"
                class="w-full bg-custom-black text-custom-white placeholder:text-custom-textgray border border-custom-gray focus:outline-none focus:ring-1 focus:ring-custom-gray rounded-md px-5 py-3"
        />

        <!-- Description Textbox -->
        <textarea
                class="w-full bg-custom-black text-custom-white placeholder:text-custom-textgray border border-custom-gray focus:outline-none focus:ring-1 focus:ring-custom-gray rounded-md px-5 py-3 mt-5"
                placeholder="Write your review here..."
                rows="4"
        ></textarea>

        <!-- Rate Button -->
        <button type="submit" class="w-full bg-custom-red text-custom-white rounded-md px-5 py-3 mt-5">
            Rate
        </button>
    </div>
</div>

<!-- Footer -->
<%--<%@ include file="../components/shared/footer.jsp" %>--%>


</body>
</html>
