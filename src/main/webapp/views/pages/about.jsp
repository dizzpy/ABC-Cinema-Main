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

    <title>About Us | ABC Cinema</title>

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


    <div class="container mx-auto px-[16px] sm:px-[24px] md:px-[120px] py-[24px] sm:py-[32] md:py-[73px]">
        <%--about us image--%>
        <div class="flex flex-col items-center">
            <div class="w-full md:w-[1040px] h-auto rounded-lg-[12px] bg-cover bg-center">
                <img src="${pageContext.request.contextPath}/static/assets/images/aboutus.png" alt="aboutus">
            </div>
        </div>

        <%--about us info--%>
        <div class="mt-[24px] sm:mt-[32px] md:mt-[73px] px-[16px] sm:px-[24px] md:px-[30px]">
            <h2 class="text-custom-white text-[20px] md:text-[24px] font-medium mb-[16px] sm:mb-[24px]">
                About ABC</h2>
            <p class="text-custom-white text-[16px] md:text-[20px] font-normal md:font-medium leading-relaxed">
                Welcome to ABC Cinema, where the magic of movies comes to life! Located in the heart of Wellawatta,
                Colombo, we offer a premium cinematic experience designed to create lasting memories for our patrons. We
                take pride in being a favorite destination for families, friends, and movie enthusiasts.Our
                state-of-the-art facilities include cutting-edge digital projection and immersive sound systems,
                ensuring every movie is a visual and auditory masterpiece. Whether you love blockbusters, heartwarming
                dramas, or thrilling adventures, ABC Cinema guarantees an unforgettable experience.Thank you for
                choosing ABC Cinema. Let's make unforgettable movie memories together.</p>
        </div>
        <%--contact info--%>
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-[16px] sm:gap-[37px] mt-[24px] sm:mt-[32px] md:mt-[73px] px-[16px] sm:px-[30px] justify-items-center mb-[24px] sm:mb-[73px]">
            <div class="bg-custom-gray rounded-lg w-full h-auto md:h-[161px] text-custom-white flex flex-col justify-center  px-[61px] py-[20px] ">
                <h3 class=" text-[16px] md:text-[20px] font-medium mb-[3px]">Email</h3>
                <p class=" text-[14px] md:text-[18px] font-normal ">
                    <a href="mailto:support@abc.com" class="text-custom-white hover:underline">support@abc.com</a>
                </p>
            </div>
            <div class="bg-custom-gray rounded-lg w-full h-auto md:h-[161px] text-custom-white flex flex-col justify-center px-[61px] py-[20px]">
                <h3 class="text-[16px] md:text-[20px] font-medium mb-[3px]">Mobile</h3>
                <p class="text-[14px] md:text-[18px] font-normal">+94701820302</p>
            </div>
            <div class="bg-custom-gray rounded-lg w-full h-auto md:h-[161px] text-custom-white flex flex-col justify-center px-[61px] py-[20px]">
                <h3 class="text-[16px] md:text-[20px] font-medium mb-[3px]">Address</h3>
                <p class="text-[14px] md:text-[18px] font-normal">ABC,Wellawatta,Colombo</p>
            </div>
        </div>

        <div class="flex flex-col items-center">
            <div class=" w-full md:w-[1040px]  h-[300px] sm:h-[400px] md:h-[464px] rounded-lg overflow-hidden ">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d949.9097292174!2d79.86047866667545!3d6.875126072809761!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae25bb8fe87e15b%3A0x2dcfca67be8b757d!2s12%20Lily%20Ave%2C%20Colombo%2010350!5e0!3m2!1sen!2slk!4v1733990343961!5m2!1sen!2slk"
                        width="1040" height="464" style="border:0;" allowfullscreen="" loading="lazy"
                        referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
        </div>


    </div>


    <!-- Footer -->
    <%@ include file="/views/components/shared/footer.jsp" %>
</div>
</body>
</html>
