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

<body class="bg-custom-black min-h-screen text-custom-white container max-w-7xl mx-auto">
<!-- Navbar -->
<%@ include file="../components/shared/navbar.jsp" %>

<!-- Add Review Section -->
<div class="mx-auto py-12 px-4 md:px-8 flex flex-col md:flex-row space-y-4 md:space-y-0 md:space-x-4 mt-10 md:mt-[120px]">
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

<!-- All Reviews Section -->
<div class="mx-auto py-5 px-4 md:px-8 mt-10 md:mt-20">

    <!-- All Reviews Title -->
    <p class="text-lg">What Others Are Saying</p>

    <!-- Review Card Section -->
    <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mt-8">
        <!-- Review Card 1 -->
        <div class="bg-custom-gray p-4 rounded-md">
            <!-- Top Section -->
            <div class="flex items-center space-x-4">
                <!-- Reviewer display img -->
                <div class="rounded-full bg-custom-red w-10 h-10">
                </div>

                <!-- Reviewer details, name + rating -->
                <div class="flex flex-col justify-center">
                    <p class="text-custom-white">Reviewer Name</p>
                    <div class="flex items-center">
                        <span class="text-yellow-500 text-[16px]">&#9733;</span>
                        <p class="text-custom-textgray ml-2 text-[16px]">4.5</p>
                    </div>
                </div>
            </div>

            <!-- Review Description -->
            <p class="text-custom-textgray mb-4 mt-5">
                This is a brief review description. It highlights the main points of the review.This is a brief review
                description. It highlights the main points of the review.
            </p>
        </div>

        <!-- Review Card 2 -->
        <div class="bg-custom-gray p-4 rounded-md">
            <!-- Top Section -->
            <div class="flex items-center space-x-4">
                <!-- Reviewer display img -->
                <div class="rounded-full bg-custom-red w-10 h-10">
                </div>

                <!-- Reviewer details, name + rating -->
                <div class="flex flex-col justify-center">
                    <p class="text-custom-white">Reviewer Name</p>
                    <div class="flex items-center">
                        <span class="text-yellow-500 text-[16px]">&#9733;</span>
                        <p class="text-custom-textgray ml-2 text-[16px]">4.5</p>
                    </div>
                </div>
            </div>

            <!-- Review Description -->
            <p class="text-custom-textgray mb-4 mt-5">
                This is a brief review description. It highlights the main points of the review.This is a brief review
                description. It highlights the main points of the review.
            </p>
        </div>

        <!-- Review Card 3 -->
        <div class="bg-custom-gray p-4 rounded-md">
            <!-- Top Section -->
            <div class="flex items-center space-x-4">
                <!-- Reviewer display img -->
                <div class="rounded-full bg-custom-red w-10 h-10">
                </div>

                <!-- Reviewer details, name + rating -->
                <div class="flex flex-col justify-center">
                    <p class="text-custom-white">Reviewer Name</p>
                    <div class="flex items-center">
                        <span class="text-yellow-500 text-[16px]">&#9733;</span>
                        <p class="text-custom-textgray ml-2 text-[16px]">4.5</p>
                    </div>
                </div>
            </div>

            <!-- Review Description -->
            <p class="text-custom-textgray mb-4 mt-5">
                This is a brief review description. It highlights the main points of the review.This is a brief review
                description. It highlights the main points of the review.
            </p>
        </div>

        <!-- Review Card 4 -->
        <div class="bg-custom-gray p-4 rounded-md">
            <!-- Top Section -->
            <div class="flex items-center space-x-4">
                <!-- Reviewer display img -->
                <div class="rounded-full bg-custom-red w-10 h-10">
                </div>

                <!-- Reviewer details, name + rating -->
                <div class="flex flex-col justify-center">
                    <p class="text-custom-white">Reviewer Name</p>
                    <div class="flex items-center">
                        <span class="text-yellow-500 text-[16px]">&#9733;</span>
                        <p class="text-custom-textgray ml-2 text-[16px]">4.5</p>
                    </div>
                </div>
            </div>

            <!-- Review Description -->
            <p class="text-custom-textgray mb-4 mt-5">
                This is a brief review description. It highlights the main points of the review.This is a brief review
                description. It highlights the main points of the review.
            </p>
        </div>

        <!-- Review Card 5 -->
        <div class="bg-custom-gray p-4 rounded-md">
            <!-- Top Section -->
            <div class="flex items-center space-x-4">
                <!-- Reviewer display img -->
                <div class="rounded-full bg-custom-red w-10 h-10">
                </div>

                <!-- Reviewer details, name + rating -->
                <div class="flex flex-col justify-center">
                    <p class="text-custom-white">Reviewer Name</p>
                    <div class="flex items-center">
                        <span class="text-yellow-500 text-[16px]">&#9733;</span>
                        <p class="text-custom-textgray ml-2 text-[16px]">4.5</p>
                    </div>
                </div>
            </div>

            <!-- Review Description -->
            <p class="text-custom-textgray mb-4 mt-5">
                This is a brief review description. It highlights the main points of the review.This is a brief review
                description. It highlights the main points of the review.
            </p>
        </div>

    </div>

</div>
<!-- Footer -->
<%--<%@ include file="../components/shared/footer.jsp" %>--%>


</body>
</html>
