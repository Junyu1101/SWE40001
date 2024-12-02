<?php
// Include the database connection
include 'databaseconnection.php';

// Retrieve the recipeID from the URL parameter
$recipeID = isset($_GET['recipeID']) ? intval($_GET['recipeID']) : 0;

// Fetch the recipe and associated product details
$sql = "
    SELECT recipe.*, product.name AS product_name, product.price AS product_price, 
           product.image AS product_image, product.productID AS product_id
    FROM recipe
    LEFT JOIN product ON recipe.productID = product.productID
    WHERE recipe.recipeID = ?";

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
        /* Recipe and Product Detail Container */
        .recipe-detail-container {
            max-width: 1000px;
            margin: 40px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            margin-bottom: 100px;
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

        /* Product Info Container */
        .product-info {
            margin-top: 30px;
            padding: 20px;
            background-color: #f7f7f7;
            border-radius: 8px;
            text-align: left;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
        }

        .product-info img {
            max-width: 100px;
            border-radius: 8px;
            margin-right: 20px;
            vertical-align: middle;
        }

        .product-info h3 a {
            font-size: 1.4em;
            color: #3498db;
            text-decoration: none;
        }

        .product-info h3 a:hover {
            text-decoration: underline;
        }

        .product-info p {
            color: #666666;
            margin: 5px 0;
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

        /* Navigation buttons */
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
            background-color: rgba(0, 0, 0, 0.5);
            border-radius: 3px;
        }

        .next {
            right: 10px;
        }

        .prev {
            left: 10px;
        }

        .prev:hover, .next:hover {
            background-color: rgba(0, 0, 0, 0.8);
        }

        /* Ensure the page scales well on mobile devices */
        meta[name="viewport"] {
            content: "width=device-width, initial-scale=1.0";
        }

        /* Responsive adjustments for smaller screens */
        @media (max-width: 768px) {
            .recipe-detail-container {
                padding: 15px;
            }

            .recipe-detail-container h1 {
                font-size: 1.5em;
            }

            .recipe-detail-container h2 {
                font-size: 1.2em;
            }

            .recipe-detail-container p {
                font-size: 1em;
            }

            /* Slideshow images */
            .slide img {
                width: 100%;
                height: auto;
            }

            /* Adjust product info layout */
            .product-info {
                flex-direction: column;
                text-align: center;
            }

            .product-info img {
                max-width: 80px;
                margin-bottom: 10px;
            }

            .product-info h3 {
                font-size: 1.2em;
            }
        }

        /* Further improvements for very small screens */
        @media (max-width: 480px) {
            .recipe-detail-container h1 {
                font-size: 1.3em;
            }

            .recipe-detail-container h2 {
                font-size: 1.1em;
            }

            .product-info h3 {
                font-size: 1em;
            }

            .product-info p {
                font-size: 0.9em;
            }
        }


    </style>
</head>
<body>

    <?php include 'header.php'; ?>

    <div class="recipe-detail-container">
        <?php if ($recipe): ?>
            <!-- Slideshow Container -->
            <div class="slideshow-container">
                <?php
                // Decode image JSON to array
                $imageArray = json_decode($recipe['image'], true);

                // Check if $imageArray is valid and contains images
                if (!is_array($imageArray) || empty($imageArray)) {
                // If no images, use a placeholder
                $imageArray = ["recipe_image/empty.jpg"]; // Replace "placeholder.jpg" with the path to your placeholder image
                }
                
                foreach ($imageArray as $image_path) {
                    echo "<div class='slide'>";
                    echo "<img src='" . htmlspecialchars($image_path) . "' alt='" . htmlspecialchars($recipe['title']) . "'>";
                    echo "</div>";
                }
                ?>
                <!-- Navigation buttons -->
                <a class="prev" onclick="plusSlides(-1)">&laquo;</a>
                <a class="next" onclick="plusSlides(1)">&raquo;</a>
            </div>

            <h1><?php echo htmlspecialchars($recipe['title']); ?></h1>
            <h2>Description: </h2>
            <p><?php echo nl2br(htmlspecialchars($recipe['description'])); ?></p>

            <!-- Display product details if available -->
            <?php if (!empty($recipe['product_name'])): ?>
                <div class="product-info">
                    <?php if (!empty($recipe['product_image'])): ?>
                        <?php foreach (json_decode($recipe['product_image']) as $image_path) {
                        
                            echo "<img src='" . htmlspecialchars($image_path) . "' alt='" . htmlspecialchars($recipe['product_name']) . "'>";
                    
                        } ?>

                        
                    <?php endif; ?>
                    <div>
                        <h3>
                            <a href="product-details.php?productID=<?php echo $recipe['product_id']; ?>">
                                <?php echo htmlspecialchars($recipe['product_name']); ?>
                            </a>
                        </h3>
                        <p>Price: <?php echo htmlspecialchars($recipe['product_price']); ?></p>
                    </div>
                </div>
            <?php endif; ?>

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
