<?php 
include 'header.php'; 
include 'databaseconnection.php'; // Include the database connection

// Function to fetch data from the database with a limit
function fetchData($conn, $table, $limit = 6) {
    $sql = "SELECT * FROM $table LIMIT $limit";
    $result = $conn->query($sql);
    return $result;
}
?>
<div class="image-banner">
    <img src="">
    <h2></h2>
</div>

<div class="showcase-container">
    <!-- Promotion Row -->
    <div class="showcase-row">
        <h2>Promotions <a href="promotions.php">view all</a></h2>
        <div class="showcase-slider" id="promotion-slider">
            <?php
            $promotions = fetchData($conn, 'promotion');
            if ($promotions->num_rows > 0) {
                while ($promotion = $promotions->fetch_assoc()) {
                    echo '<div class="showcase-promotion">';
                    echo '<a href=promotion_detail.php?id=' . htmlspecialchars($promotion['promotionID']) . '>';
                    echo '<h1>' . htmlspecialchars($promotion['title']) . '</h1>';
                    echo '</a>';
                    echo '</div>';
                }
            } else {
                echo '<p>No promotions available.</p>';
            }
            ?>
        </div>
    </div>

    <br>

    <!-- Recipe Row -->
    <div class="showcase-row">
        <h2>Recipes <a href="recipes.php">view all</a></h2>
        <div class="showcase-slider" id="recipe-slider">
            <?php
            $recipes = fetchData($conn, 'recipe');
            if ($recipes->num_rows > 0) {
                while ($recipe = $recipes->fetch_assoc()) {
                    // Decode the JSON-like array to get the list of images
                    $images = json_decode($recipe['image'], true);
                    // Check if the decoding was successful and the array is not empty
                    $firstImage = is_array($images) && !empty($images) ? $images[0] : 'default.jpg'; // Use a default image if needed
    
                    echo '<div class="showcase-recipe">';
                    echo '<img src="' . htmlspecialchars($firstImage) . '" alt="' . htmlspecialchars($recipe['title']) . '">';
                    echo '<h1>' . htmlspecialchars($recipe['title']) . '</h1>';
                    echo '</div>';
                }
            } else {
                echo '<p>No recipes available.</p>';
            }
            ?>
        </div>
    </div>

    <br>

    <!-- Product Row -->
    <div class="showcase-row">
        <h2>Products <a href="products.php">view all</a></h2>
        <div class="showcase-slider" id="product-slider">
            <?php
            $products = fetchData($conn, 'product');
            if ($products->num_rows > 0) {
                while ($product = $products->fetch_assoc()) {

                    $images = json_decode($product['image'], true);
                    $firstImage = !empty($images) ? $images[0] : 'images/placeholder.jpg'; // Use a placeholder image if no images available

                    echo '<div class="showcase-item">';
                    echo '<img src="' . htmlspecialchars($firstImage) . '" alt="' . htmlspecialchars($product['name']) . '">';
                    echo '<h1>' . htmlspecialchars($product['name']) . '</h1>';
                    echo '<p>RM ' . number_format($product['price'], 2) . '</p>';
                    echo '</div>';
                }
            } else {
                echo '<p>No products available.</p>';
            }
            ?>
        </div>
    </div>
</div>

<br><br><br>

<?php 
include 'footer.php'; 
?>

