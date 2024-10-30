<?php
// Include the database connection
include 'databaseconnection.php';

// Retrieve the recipeID from the URL parameter
$recipeID = isset($_GET['recipeID']) ? intval($_GET['recipeID']) : 0;

// Fetch the recipe details based on the recipeID
$sql = "SELECT * FROM recipe WHERE recipeID = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $recipeID);
$stmt->execute();
$result = $stmt->get_result();
$recipe = $result->fetch_assoc();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo htmlspecialchars($recipe['title']); ?></title>
    <link rel="stylesheet" href="styles/style.css">
    <style>
        /* Recipe Detail Container */
        .recipe-detail-container {
            max-width: 1000px;
            margin: 40px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .recipe-detail-container h1 {
            font-size: 2em;
            color: #333333;
            margin-bottom: 20px;
        }

        .recipe-detail-container h2 {
            font-size: 1.5em;
            color: #555555;
            margin: 20px 0 10px;
            text-align: left;
        }

        /* Paragraph (description) styling */
        .recipe-detail-container p {
            font-size: 1.1em;
            line-height: 1.6;
            color: #666666;
            text-align: justify;
            margin-bottom: 20px;
        }

        /* Slideshow Container */
        .slideshow-container {
            position: relative;
            max-width: 100%;
            margin-bottom: 20px;
            overflow: hidden;
            border-radius: 8px;
        }

        .slide {
            display: none;
        }

        .slide img {
            width: 600px;
            height: 400px;
            border-radius: 8px;
        }


        /* Next and Previous buttons */
        .prev, .next {
            cursor: pointer;
            position: absolute;
            top: 50%;
            width: auto;
            padding: 16px;
            color: white;
            font-weight: bold;
            font-size: 18px;
            transition: 0.3s;
            user-select: none;
            background-color: rgba(0,0,0,0.5);
            border-radius: 3px;
        }

        .next {
            right: 10px;
        }

        .prev {
            left: 10px;
        }

        .prev:hover, .next:hover {
            background-color: rgba(0,0,0,0.8);
        }

        /* Mobile Styles */
        @media (max-width: 768px) {
            .recipe-detail-container {
                padding: 10px; /* Reduce padding */
                margin: 20px; /* Adjust margin */
            }

            .recipe-detail-container h1 {
                font-size: 1.8em; /* Smaller heading */
                margin-bottom: 15px; /* Adjust margin */
            }

            .recipe-detail-container h2 {
                font-size: 1.2em; /* Smaller subheading */
                margin: 15px 0 5px; /* Adjust margin */
            }

            .recipe-detail-container p {
                font-size: 1em; /* Smaller paragraph text */
                margin-bottom: 15px; /* Adjust margin */
            }

            /* Slideshow image adjustments */
            .slide img {
                width: 300px;
                height: 200px;
            }

            /* Adjust button sizes for mobile */
            .prev, .next {
                padding: 12px; /* Smaller padding for buttons */
                font-size: 16px; /* Smaller font size */
            }
        }

    </style>
</head>
<body>

    <?php include 'header.php'; ?>

    <div class="recipe-detail-container">
        <?php if ($recipe): ?>
            <div class="slideshow-container">
                <?php
                // Decode image JSON to array
                $imageArray = json_decode($recipe['image'], true);
                foreach ($imageArray as $image_path) {
                    echo "<div class='slide'>";
                    echo "<img src='" . htmlspecialchars($image_path) . "' alt='" . htmlspecialchars($recipe['title']) . "'>";
                    echo "</div>";
                }
                ?>
                <!-- Add navigation buttons -->
                <a class="prev" onclick="plusSlides(-1)">&laquo;</a>
                <a class="next" onclick="plusSlides(1)">&raquo;</a>
            </div>
            <h1><?php echo htmlspecialchars($recipe['title']); ?></h1>
            <h2>Description: </h2>
            <p><?php echo nl2br(htmlspecialchars($recipe['description'])); ?></p>
        <?php else: ?>
            <p>Recipe not found.</p>
        <?php endif; ?>
    </div>

    <?php include 'footer.php'; ?>
    
    <script>
        // JavaScript for slide navigation
        let currentSlide = 0;
        
        function showSlide(index) {
            const slides = document.querySelectorAll('.slide');
            if (slides.length === 0) return;

            // Loop back around
            currentSlide = (index + slides.length) % slides.length;

            // Hide all slides
            slides.forEach(slide => slide.style.display = 'none');

            // Show current slide
            slides[currentSlide].style.display = 'block';
        }

        function plusSlides(n) {
            showSlide(currentSlide + n);
        }

        // Initialize slideshow
        document.addEventListener('DOMContentLoaded', () => {
            showSlide(currentSlide);
        });
    </script>

</body>
</html>

<?php
$conn->close();
?>
