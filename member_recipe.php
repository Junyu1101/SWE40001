<?php
// Include the database connection
include 'databaseconnection.php';

// Fetch all images and captions to display them
$sql = "SELECT * FROM recipe";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Member Recipe Page</title>
    <link rel="stylesheet" href="styles/style.css">
    <style>
        /* smae as admin_recipe.php */

        /* Recipe top */
        .recipe-top {
            background-color: #ffffff;
            border: 1px solid #dddddd;
            border-radius: 8px;
            padding: 20px;
            margin: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .recipe-top h1 {
            margin: 0;
        }

        .recipe {
            background-color: #ffffff;
            border: 1px solid #dddddd;
            border-radius: 8px;
            padding: 20px;
            margin: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .recipe h2 {
            margin-top: 0;
        }

        .recipe p {
            color: #555;
        }

        /* Slideshow styles */
        .slideshow-container {
            position: relative;
            max-width: 600px;
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
            max-width: 100%;
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
            border-radius: 0 3px 3px 0;
            user-select: none;
        }

        .prev {
            left: 0;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .next {
            right: 0;
            background-color: rgba(0, 0, 0, 0.5);
        }

        /* Delete button */
        .admin-delete-btn {
            background-color: #e74c3c;
            color: #ffffff;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
        }

        .admin-delete-btn:hover {
            background-color: #c0392b;
        }

        /* Responsive design */
        @media (max-width: 600px) {
            .admin-form, .recipe {
                margin: 10px;
                padding: 15px;
            }

            .prev, .next {
                padding: 10px;
            }
        }

    </style>
</head>
<body>

    <?php include 'header.php'; ?>

    <div class="recipe-top">
        <div>
            <h1>Recipe List: </h1>
        </div>
    </div>

    <div class="recipe-full-container">
    <?php
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo "<div class='recipe'>";
                echo "<h2>" . htmlspecialchars($row['title']) . "</h2>";
                echo "<p>" . htmlspecialchars($row['description']) . "</p>";

                // Decode image JSON to array
                $imageArray = json_decode($row['image'], true);

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

                echo "</div>"; // End recipe
            }
        } else {
            echo "<p>No recipes found.</p>";
        }
    ?>
    </div>

    <?php include 'footer.php'; ?>
    
    <script>
        function plusSlides(event, n, btn) {
            const slideshowContainer = btn.parentNode; // Get the specific slideshow container
            const slides = slideshowContainer.querySelectorAll('.slide'); // Only get the slides within this container
            let currentSlide = 0;

            // Find the currently visible slide
            slides.forEach((slide, index) => {
                if (slide.style.display !== 'none') {
                    currentSlide = index;
                }
            });

            // Hide all slides in the current container
            slides.forEach((slide) => {
                slide.style.display = 'none';
            });

            // Calculate the next slide index
            let nextSlide = currentSlide + n;
            if (nextSlide >= slides.length) nextSlide = 0; // Loop back to first slide
            if (nextSlide < 0) nextSlide = slides.length - 1; // Loop to last slide

            // Show the next slide
            slides[nextSlide].style.display = 'block';
        }

        // Initialize slides on page load for each slideshow
        document.addEventListener('DOMContentLoaded', () => {
            const allSlideshows = document.querySelectorAll('.slideshow-container');
            allSlideshows.forEach((slideshow) => {
                const slides = slideshow.querySelectorAll('.slide');
                if (slides.length > 0) {
                    slides[0].style.display = 'block'; // Show the first slide in each slideshow
                }
            });
        });

    </script>

</body>
</html>

<?php
$conn->close();
?>
