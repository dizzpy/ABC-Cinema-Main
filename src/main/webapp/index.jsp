<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Add Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>MyWebApp</title>

    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Configure Tailwind -->
    <script>
        tailwind.config = {
            theme: {
                fontFamily: {
                    // Make Inter the default font for the entire site
                    sans: ['Inter', 'system-ui', 'sans-serif'],
                },
                extend: {
                    colors: {
                        custom: {
                            black: '#171717',
                            red: '#E64C45',
                            white: '#FFFFFF',
                            gray: '#282727',
                            textgray: '#B1B1B1'
                        }
                    },
                },
            }
        }
    </script>

    <!-- Add default font styling -->
    <style type="text/tailwindcss">
        @layer base {
            html {
                font-family: Inter, system-ui, sans-serif;
            }
        }
    </style>

    <!-- Configure Tailwind -->
    <script>
        tailwind.config = {
            theme: {
                fontFamily: {
                    sans: ['Inter', 'system-ui', 'sans-serif'],
                },
                extend: {
                    colors: {
                        custom: {
                            black: '#171717',
                            red: '#E64C45',
                            white: '#FFFFFF',
                            gray: '#282727',
                            textgray: '#B1B1B1'
                        }
                    },
                },
            }
        }
    </script>

    <!-- Add component classes -->
    <style type="text/tailwindcss">
        @layer components {
            .custom-primary-button {
                @apply px-4 py-2 bg-custom-red text-custom-white font-normal rounded-[8px] transition-colors duration-200;
            }
            .custom-secondary-button {
                @apply px-4 py-2 bg-custom-white text-custom-black border border-custom-black hover:bg-gray-50 font-normal rounded-lg transition-colors duration-200;
            }
        }
    </style>

</head>
<body class="bg-custom-black">
<%@ include file="views/components/shared/navbar.jsp" %>
<h1 class="text-center text-3xl font-bold text-white mt-10">

</h1>
<%@ include file="views/components/shared/footer.jsp" %>
</body>
</html>