<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 12/14/2024
  Time: 8:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Payment Error</h1>

<%
    String errorMessage = request.getParameter("error");
    if (errorMessage == null || errorMessage.isEmpty()) {
        errorMessage = "An unknown error occurred.";
    }
%>
<p><%= errorMessage %>
</p>
</body>
</html>
