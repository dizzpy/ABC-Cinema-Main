<%
    String errorMessage = request.getParameter("error");
    if (errorMessage == null) {
        errorMessage = "An unknown error occurred.";
    }
%>
<h1>Payment Error</h1>
<p><%= errorMessage %></p>
