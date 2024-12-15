<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Error</title>
</head>
<body>
<h1>Payment Error</h1>
<p>
    <%= request.getParameter("error") != null
            ? request.getParameter("error").replace("%20", " ")
            : "An unknown error occurred." %>
</p>
<a href="/payments/payment.jsp">Go back to Payment Page</a>
</body>
</html>
