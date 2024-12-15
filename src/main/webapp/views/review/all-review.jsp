<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en" class="h-full">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap"
          rel="stylesheet">
    <title>Reviews | ABC Cinema</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="${pageContext.request.contextPath}/static/js/tailwind-config.js"></script>
    <link href="${pageContext.request.contextPath}/static/css/style.css">
    <!-- Add this for star rating functionality -->
    <script>
        function setRating(rating) {
            document.getElementById('rating').value = rating;
            // Update stars visual
            const stars = document.querySelectorAll('.star');
            stars.forEach((star, index) => {
                star.innerHTML = index < rating ? '★' : '☆';
            });
        }
    </script>
</head>

<body class="bg-custom-black min-h-screen text-custom-white">
<%@ include file="../components/shared/navbar.jsp" %>

<!-- Add Review Section -->
<div class="mx-auto py-12 px-4 md:px-8 flex flex-col md:flex-row space-y-4 md:space-y-0 md:space-x-4 mt-10 md:mt-[120px] container max-w-7xl mx-auto">
    <!-- Text content section -->
    <div class="content-center w-full md:w-1/2 p-4">
        <div class="text-lg font-normal">Add Your Rating</div>
        <div class="text-white text-[40px] font-normal tracking-wide">Let Others Know<br/>Your Opinion</div>
        <p class="text-custom-textgray text-lg max-w-[400px]">Share your honest thoughts about the movie. Highlight what
            you liked or did not to help others decide!</p>
    </div>

    <!-- Review form section -->
    <div class="content-center w-full md:w-1/2 p-4">
        <form action="${pageContext.request.contextPath}/reviews" method="POST">
            <!-- Star Rating -->
            <div class="flex mb-6">
                <input type="hidden" id="rating" name="rating" value="0">
                <% for (int i = 1; i <= 5; i++) { %>
                <span class="star text-yellow-500 text-5xl cursor-pointer"
                      onclick="setRating(<%=i%>)">☆</span>
                <% } %>
            </div>

            <!-- Name Textbox -->
            <input
                    type="text"
                    id="name"
                    name="name"
                    disabled
                    placeholder="Login Before Reviewing"
                    value="<%= session.getAttribute("full_name") != null ? session.getAttribute("full_name") : "" %>"
                    class="w-full bg-custom-black text-custom-white placeholder:text-custom-textgray border border-custom-gray focus:outline-none focus:ring-1 focus:ring-custom-gray rounded-md px-5 py-3"
                    <%= session.getAttribute("full_name") != null ? "readonly" : "" %>
            />

            <!-- Description Textbox -->
            <textarea
                    name="description"
                    required
                    class="w-full bg-custom-black text-custom-white placeholder:text-custom-textgray border border-custom-gray focus:outline-none focus:ring-1 focus:ring-custom-gray rounded-md px-5 py-3 mt-5"
                    placeholder="Write your review here..."
                    rows="4"
            ></textarea>

            <!-- Rate Button -->
            <button type="submit" class="w-full bg-custom-red text-custom-white rounded-md px-5 py-3 mt-5">
                Submit Review
            </button>
        </form>
    </div>
</div>

    <!-- All Reviews Section -->
    <div class="mx-auto py-5 px-4 md:px-8 mt-10 md:mt-20 container max-w-7xl mx-auto mb-20">
        <!-- All Reviews Title -->
        <p class="text-lg">What Others Are Saying</p>

        <!-- Review Card Section -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mt-8">
            <c:forEach items="${reviews}" var="review">
                <div class="bg-custom-gray p-4 rounded-md">
                    <!-- Top Section -->
                    <div class="flex items-center space-x-4">
                        <!-- Reviewer display img -->
                        <div class="rounded-full bg-custom-red w-10 h-10 flex items-center justify-center">
                                ${fn:substring(review.reviewerName, 0, 1).toUpperCase()}
                        </div>

                        <!-- Reviewer details, name + rating -->
                        <div class="flex flex-col justify-center">
                            <p class="text-custom-white">${review.reviewerName}</p>
                            <div class="flex items-center">
                                <span class="text-yellow-500 text-[16px]">★</span>
                                <p class="text-custom-textgray ml-2 text-[16px]">${review.rating}/5</p>
                            </div>
                        </div>
                    </div>

                    <!-- Review Description -->
                    <p class="text-custom-textgray mb-4 mt-5">
                            ${review.reviewDescription}
                    </p>
                </div>
            </c:forEach>

            <c:if test="${empty reviews}">
                <div class="col-span-3 text-center text-custom-textgray py-8">
                    No reviews yet. Be the first to share your thoughts!
                </div>
            </c:if>
        </div>
    </div>

    <%@ include file="../components/shared/footer.jsp" %>

</body>
</html>