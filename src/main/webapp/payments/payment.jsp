<%
    String totalPrice = request.getParameter("totalPrice");
    if (totalPrice == null || totalPrice.isEmpty()) {
        response.sendRedirect("error/paymentError.jsp?error=Missing%20total%20price");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en" class="h-full">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap"
          rel="stylesheet">

    <title>Payment | ABC Cinema</title>

    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Tailwind Configuration -->
    <script src="${pageContext.request.contextPath}/static/js/tailwind-config.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
</head>

<body class="bg-custom-black min-h-screen flex flex-col">

<!-- Main content wrapper -->
<div class="flex flex-col flex-grow">
    <!-- Navbar -->
    <%@ include file="/views/components/shared/navbar.jsp" %>

    <!-- Content -->
    <div class="container mx-auto max-w-6xl mt-[50px] md:mt-[150px] mb-[150px]">
        <p class="text-2xl text-custom-red">Reservation Summary</p>

        <!-- Movie name -->
        <p class="text-4xl text-custom-white w-full md:max-w-xl mt-6">Doctor Strange In The Multiverse of Madness</p>

        <!-- Location and Date -->
        <div class="flex flex-col md:flex-row mt-6 space-x-10">
            <p class="text-lg text-custom-white">ABC Cinema Wellawatta</p>
            <p class="text-lg text-custom-white">Date</p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mt-10">
            <!-- Left Column -->
            <div class="space-y-4">
                <p class="text-2xl text-custom-red text-medium">Personal Information</p>

                <form method="post" action="${pageContext.request.contextPath}/PayPalPaymentServlet">
                    <!-- Name Input -->
                    <p class="text-custom-textgray">Full Name</p>
                    <input
                            type="text"
                            id="name"
                            name="name"
                            placeholder="Enter your name"
                            class="w-full bg-custom-black text-custom-white placeholder:text-custom-textgray border border-custom-gray focus:outline-none focus:ring-1 focus:ring-custom-gray rounded-md px-5 py-3"
                            required
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
                                id="continue-button"
                                type="submit"
                                class="bg-custom-red text-custom-white rounded-md px-5 py-2">
                            Continue
                        </button>

                    </div>
                </form>
            </div>
        </div>


        <!-- Right Column -->
        <div class="justify-end w-full">
            <div class="mx-auto text-custom-white p-6 rounded-md space-y-6">
                <h2 class="text-2xl font-semibold text-custom-red">Payment Summary</h2>

                <!-- Details -->

                <div class="space-y-2">
                    <div class="flex justify-between items-center font-semibold">
                        <span class="text-lg">Total</span>
                        <span class="text-lg">LKR <%= totalPrice %></span>
                    </div>
                </div>

                <!-- PayPal Button Container -->
                <div id="paypal-button-container" style="display: none;"></div>


                <!-- PayPal Logo -->
                <div class="flex justify-end mt-6">
                    <img src="https://www.paypalobjects.com/images/shared/paypal-logo-129x32.svg" alt="PayPal"
                         class="h-8">
                </div>
            </div>
        </div>
    </div>
</div>

<!-- PayPal SDK Script -->
<script src="https://www.paypal.com/sdk/js?client-id=YOUR_CLIENT_ID&currency=LKR"></script>

<script>
    document.getElementById('continue-button').addEventListener('click', function () {
        // Check if terms are accepted
        if (document.getElementById('terms').checked) {
            // Ensure PayPal container is hidden initially
            const paypalContainer = document.getElementById('paypal-button-container');

            // Display PayPal buttons and hide 'Continue' ONLY after rendering is successful
            paypal.Buttons({
                createOrder: function (data, actions) {
                    return actions.order.create({
                        purchase_units: [{
                            amount: {
                                value: '<%= totalPrice != null ? totalPrice : "0.00" %>'
                            }
                        }]
                    });
                },
                onApprove: function (data, actions) {
                    return actions.order.capture().then(function (details) {
                        alert('Transaction completed by ' + details.payer.name.given_name);
                        window.location.href = '<%= request.getContextPath() %>/success/success.jsp';
                    });
                },
                onError: function (err) {
                    console.error('Error in PayPal processing: ', err);
                    alert('An error occurred. Please try again.');
                }
            }).render('#paypal-button-container').then(function () {
                // Success: hide the Continue button
                document.getElementById('continue-button').style.display = 'none';
                paypalContainer.style.display = 'block';
            }).catch(function (err) {
                // Handle rendering errors
                console.error('Error rendering PayPal buttons: ', err);
                alert('Failed to load PayPal buttons. Please try again.');
            });
        } else {
            alert('Please agree to the terms and conditions before proceeding.');
        }
    });
</script>


</body>
</html>
