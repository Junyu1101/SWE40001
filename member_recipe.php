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
        /* Add any member-specific styling here */
    </style>
</head>
<body>

    <?php include 'header.php'; ?>

    <div class="recipe-top">
        <div>
            <h1>Recipe List</h1>
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
            const slides = btn.parentNode.querySelectorAll('.slide');
            let currentSlide = 0;

            // Find the currently visible slide
            slides.forEach((slide, index) => {
                if (slide.style.display !== 'none') {
                    currentSlide = index;
                }
            });

            // Hide the current slide
            slides[currentSlide].style.display = 'none';

            // Calculate the next slide index
            let nextSlide = currentSlide + n;
            if (nextSlide >= slides.length) nextSlide = 0; // Loop back to first slide
            if (nextSlide < 0) nextSlide = slides.length - 1; // Loop to last slide

            // Show the next slide
            slides[nextSlide].style.display = 'block';
        }

        // Initialize slides on page load
        document.addEventListener('DOMContentLoaded', () => {
            const allSlides = document.querySelectorAll('.slideshow-container .slide');
            allSlides[0].style.display = 'block'; // Show the first slide initially
        });
    </script>

</body>
</html>

<?php
$conn->close();
?>
