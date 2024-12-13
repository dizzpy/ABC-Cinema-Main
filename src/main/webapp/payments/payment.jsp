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

    <title>Payment | ABC Cinema</title>

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

    <%--    all content--%>
    <div class="container mx-auto max-w-6xl mt-[50px] md:mt-[150px] mb-[150px]">
        <p class="text-2xl text-custom-red">Reservation Summery</p>

        <%-- Movie name --%>
        <p class="text-4xl text-custom-white w-full md:max-w-xl mt-6">Doctor Strange In The Multiverse of Madness</p>

        <%-- location + date --%>
        <div class="flex flex-col md:flex-row mt-6 space-x-10">
            <p class="text-lg text-custom-white">ABC Cinema Wellawatta</p>
            <%--   add date picker--%>
            <p class="text-lg text-custom-white">Date</p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mt-10">
            <!-- Left Column -->
            <div class="space-y-4">
                <!-- Title -->
                <p class="text-2xl text-custom-red text-medium">Personal Information</p>

                <!-- Name Input -->
                <p class="text-custom-textgray">Full Name</p>
                <input
                        type="text"
                        id="name"
                        name="name"
                        placeholder="Enter your name"
                        class="w-full bg-custom-black text-custom-white placeholder:text-custom-textgray border border-custom-gray focus:outline-none focus:ring-1 focus:ring-custom-gray rounded-md px-5 py-3"
                />

                <!-- Mobile Number Input -->
                <p class="text-custom-textgray">Mobile Number</p>
                <input
                        type="text"
                        id="mobile"
                        name="mobile"
                        placeholder="Enter your mobile number"
                        class="w-full bg-custom-black text-custom-white placeholder:text-custom-textgray border border-custom-gray focus:outline-none focus:ring-1 focus:ring-custom-gray rounded-md px-5 py-3"
                />

                <!-- Email Input -->
                <p class="text-custom-textgray">Email Address</p>
                <input
                        type="email"
                        id="email"
                        name="email"
                        placeholder="sampleemail@abc.com"
                        class="w-full bg-custom-black text-custom-white placeholder:text-custom-textgray border border-custom-gray focus:outline-none focus:ring-1 focus:ring-custom-gray rounded-md px-5 py-3"
                />

                <!-- Terms and Conditions Checkbox -->
                <div class="flex items-center">
                    <input
                            type="checkbox"
                            id="terms"
                            name="terms"
                            class="w-5 h-5 text-custom-gray border border-custom-gray focus:ring-custom-gray rounded"
                    />
                    <label for="terms" class="ml-3 text-custom-white">
                        I agree to the terms and conditions
                    </label>
                </div>

                <div class="flex space-x-7">
                    <!-- Back Button -->
                    <button
                            type="button"
                            class="bg-custom-white text-custom-black border border-custom-gray rounded-md px-5 py-2">
                        Back
                    </button>

                    <!-- Continue Button -->
                    <button
                            type="submit"
                            class="bg-custom-red text-custom-white rounded-md px-5 py-2">
                        Continue
                    </button>
                </div>

            </div>

            <!-- Right Column -->
            <div class="justify-end w-full">
                <div class="mx-auto text-custom-white p-6 rounded-md space-y-6">
                    <!-- Title -->
                    <h2 class="text-2xl font-semibold text-custom-red">Payment Summary</h2>

                    <!-- Details -->
                    <div class="space-y-2">
                        <!-- Single Ticket Price -->
                        <div class="flex justify-between items-center">
                            <span class="text-lg">Single ticket price</span>
                            <span class="text-lg">LKR 6,800.00</span>
                        </div>

                        <!-- Ticket Count -->
                        <div class="flex justify-between items-center">
                            <span class="text-lg">Count of tickets</span>
                            <span class="text-lg">x4</span>
                        </div>

                        <!-- Divider -->
                        <div class="border-t border-custom-gray my-2"></div>

                        <!-- Total -->
                        <div class="flex justify-between items-center font-semibold">
                            <span class="text-lg">Total</span>
                            <span class="text-lg">LKR 7,000.00</span>
                        </div>
                    </div>

                    <!-- PayPal Logo -->
                    <div class="flex justify-end mt-6">
                        <img src="https://www.paypalobjects.com/images/shared/paypal-logo-129x32.svg" alt="PayPal"
                             class="h-8">
                    </div>
                </div>

            </div>
        </div>

    </div>


    <!-- Footer -->
    <%@ include file="/views/components/shared/footer.jsp" %>
</div>
</body>
</html>
