<?php
// Include the database connection
include 'databaseconnection.php';

// Fetch categories from the `categories` table
$categoryQuery = "SELECT categoryID, categoryName FROM categories";
$categoryResult = $conn->query($categoryQuery);

// Fetch distinct categories from the `recipe` table
$categoryQuery = "SELECT DISTINCT category FROM recipe";
$categoryResult = $conn->query($categoryQuery);

// Get selected category from URL, if set
$selectedCategory = isset($_GET['category']) ? $_GET['category'] : '';

// Fetch all recipes, filtered by the selected category if applicable
$sql = "SELECT * FROM recipe";
if (!empty($selectedCategory)) {
    $sql .= " WHERE category = ?";
}

$stmt = $conn->prepare($sql);
if (!empty($selectedCategory)) {
    $stmt->bind_param("s", $selectedCategory);
}
$stmt->execute();
$result = $stmt->get_result();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Member Recipe Page</title>
    <link rel="stylesheet" href="styles/style.css">
    <style>
        /* Recipe top */
        .recipe-top {
            padding: 20px;
            margin: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            flex-direction: column; /* Stack vertically */
            margin-bottom:0px;
        }

        .recipe-top h1 {
            margin: 0;
            background-color: #ffffff;
            border: 1px solid #dddddd;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        /* Category dropdown */
        .category-filter {
            margin-top: 20px;
        }

        .recipe-full-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center; /* Ensure that items are always centered */
            align-items: flex-start; /* Ensure the items align to the top */
            padding: 20px;
            margin-bottom: 100px;
            
        }

        .recipe {
            background-color: #ffffff;
            border: 1px solid #dddddd;
            border-radius: 8px;
            padding: 20px;
            margin: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            width: 30%;
            box-sizing: border-box;
            margin-bottom: 20px;
            text-align: center;
        }

        /* Slideshow styles */
        .slideshow-container {
            position: relative;
            max-width: 100%;
            margin: auto;
            overflow: hidden;
        }

        .slides {
            display: flex;
        }

        .slide {
            display: none;
            justify-content: center;
            align-items: center;
            width: 100%;
        }

        .slide img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 8px;
        }

        /* Navigation buttons */
        .prev, .next {
            cursor: pointer;
            position: absolute;
            top: 50%;
            width: auto;
            padding: 16px;
            margin-top: -22px;
            color: white;
            font-weight: bold;
            font-size: 18px;
            user-select: none;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .prev { left: 0; }
        .next { right: 0; }

        /* Category filter styling */
        .category-filter {
            margin-top: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .category-filter label {
            font-weight: bold;
            font-size: 16px;
            color: #333;
        }

        .category-filter select {
            padding: 8px 12px;
            font-size: 14px;
            border-radius: 4px;
            border: 1px solid #ddd;
            background-color: #f9f9f9;
            cursor: pointer;
        }

        .category-filter select:focus {
            outline: none;
            border-color: #3498db;
            background-color: #ffffff;
        }


        @media (max-width: 900px) {
            .recipe { width: 45%; }
        }

        @media (max-width: 600px) {
            .recipe { width: 100%; }
        }

        
    </style>
</head>
<body>

    <?php include 'header.php'; ?>

    <div class="recipe-top">
        <h1>Recipe List:</h1>
        
        <!-- Category Filter Dropdown -->
        <form method="GET" class="category-filter">
                    <label for="category">Filter by Category:</label>
            <select name="category" id="category" onchange="this.form.submit()">
                <option value="">All Categories</option>
                <?php
                // Populate dropdown with distinct categories from the `recipe` table
                if ($categoryResult->num_rows > 0) {
                    while ($catRow = $categoryResult->fetch_assoc()) {
                        $category = $catRow['category'];
                        $selected = ($category == $selectedCategory) ? 'selected' : '';
                        echo "<option value='" . htmlspecialchars($category) . "' $selected>" . htmlspecialchars($category) . "</option>";
                    }
                }
                ?>
            </select>
        </form>
    </div>

    <div class="recipe-full-container">
    <?php
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo "<a href='recipe_detail.php?recipeID=" . $row['recipeID'] . "' class='recipe-link'>";
                echo "<div class='recipe'>";

                // Decode image JSON to array
                $imageArray = json_decode($row['image'], true);

                // Check if $imageArray is valid and contains images
                if (!is_array($imageArray) || empty($imageArray)) {
                    // If no images, use a placeholder
                    $imageArray = ["recipe_image/empty.jpg"]; // Replace "placeholder.jpg" with the path to your placeholder image
                }

                echo "<div class='slideshow-container'>";
                echo "<div class='slides'>";

                foreach ($imageArray as $image_path) {
                    echo "<div class='slide'>";
                    echo "<img src='" . htmlspecialchars($image_path) . "' alt='" . htmlspecialchars($row['title']) . "'>";
                    echo "</div>";
                }
                echo "</div>"; // End of slides

                // Add navigation buttons
                echo "<a class='prev' onclick='plusSlides(event, -1, this)'>&#10094;</a>";
                echo "<a class='next' onclick='plusSlides(event, 1, this)'>&#10095;</a>";
                echo "</div>"; // End slideshow

                echo "<h2>" . htmlspecialchars($row['title']) . "</h2>";
                echo "</div>"; // End recipe
                echo "</a>"; // end link to recipe details page
            }
        } else {
            echo "<p>No recipes found.</p>";
        }
    ?>
    </div>

    <?php include 'footer.php'; ?>
    
    <script>
        function plusSlides(event, n, btn) {
            const slideshowContainer = btn.parentNode;
            const slides = slideshowContainer.querySelectorAll('.slide');
            let currentSlide = 0;

            slides.forEach((slide, index) => {
                if (slide.style.display !== 'none') {
                    currentSlide = index;
                }
            });

            slides.forEach((slide) => {
                slide.style.display = 'none';
            });

            let nextSlide = currentSlide + n;
            if (nextSlide >= slides.length) nextSlide = 0;
            if (nextSlide < 0) nextSlide = slides.length - 1;

            slides[nextSlide].style.display = 'block';
        }

        document.addEventListener('DOMContentLoaded', () => {
            const allSlideshows = document.querySelectorAll('.slideshow-container');
            allSlideshows.forEach((slideshow) => {
                const slides = slideshow.querySelectorAll('.slide');
                if (slides.length > 0) {
                    slides[0].style.display = 'block';
                }
            });
        });
    </script>

</body>
</html>

<?php
$conn->close();
?>
