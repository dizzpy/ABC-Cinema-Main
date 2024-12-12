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

    <title>Login | ABC Cinema</title>

    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>

    <%-- Tailwind config file --%>
    <script src="${pageContext.request.contextPath}/static/js/tailwind-config.js"></script>
    <link href="${pageContext.request.contextPath}/static/css/style.css">
</head>

<body class="bg-custom-black min-h-screen flex flex-col items-center justify-center">
<div class="w-[350px] text-center">


        <%-- Display message if available --%>
        <%
            String message = (String) session.getAttribute("message");
            String messageType = (String) session.getAttribute("messageType");
            if (message != null) {
        %>
        <div class="<%= messageType %>">
            <%= message %>
        </div>
        <%
                session.removeAttribute("message");
                session.removeAttribute("messageType");
            }
        %>

    <p class="text-[20px] text-custom-white mb-6">Log in to your Account</p>

    <form action="LoginServlet" method="post">
    <%--  Email Inputbox  --%>
    <input
            type="email"
            id="email"
            name="email"
            placeholder="sampleemail@abc.com"
            class="w-full bg-custom-black text-custom-white placeholder:text-custom-textgray border border-custom-gray focus:outline-none focus:ring-1 focus:ring-custom-gray rounded-md px-5 py-3"
    />

    <%--  Password Inputbox  --%>
    <input
            type="password"
            id="password"
            name="password"
            placeholder="***********"
            class="mt-5 w-full bg-custom-black text-custom-white placeholder:text-custom-textgray border border-custom-gray focus:outline-none focus:ring-1 focus:ring-custom-gray rounded-md px-5 py-3"
    />

    <%--  Navigate to Reset Password page  --%>
    <div class="w-full">
        <a href="/forgot-password"
           class="text-custom-red text-[14px] my-3 block text-right">Forgot Password?</a>
    </div>

    <%--  Create Account Button  --%>
    <button type="submit" class="w-full bg-custom-red text-custom-white rounded-md px-5 py-3">
        Login to Account
    </button>

    </form>

    <%--  Naviagte to Register page  --%>
    <div class="w-full mt-5">
        <p class="text-custom-white text-[14px]">Don't have an account? <a
                href="/register"
                class="text-custom-red">Sign Up</a>
        </p>
    </div>
</div>

<!-- Use JSTL to pass the message and type to JavaScript -->
<c:if test="${not empty message}">
    <script type="text/javascript">
        var message = "${message}";
        var messageType = "${messageType}";
    </script>
</c:if>

</body>
</html>
