<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* Neon Curve Style */
        .curve-container {
            position: relative;
            width: 100%;
            height: 150px; /* Adjust height for the curve */
            background: transparent; /* Ensure transparency */
        }

        .neon-curve {
            position: absolute;
            width: 100%;
            height: 150px;
            border-top: 3px solid white; /* White curved line */
            border-radius: 50% / 100%; /* Creates a perfect curve */
            background: transparent; /* Transparent background */
            -webkit-box-shadow: 0px 0px 87px 0px rgba(230, 77, 69, 1); /* Red glow effect */
            -moz-box-shadow: 0px 0px 87px 0px rgba(230, 77, 69, 1);
            box-shadow: 0px 0px 87px 0px rgba(230, 77, 69, 1);
        }
    </style>
</head>
<body class="flex items-center justify-center min-h-screen bg-transparent">
<!-- Neon Curve Section -->
<div class="curve-container">
    <div class="neon-curve"></div>
</div>
</body>
</html>
