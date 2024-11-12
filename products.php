<?php include 'header.php'; ?>

<!-- Main Container (Sidebar + Product Section) -->
<div class="main-container">

    <!-- Sidebar -->
    <div class="sidebar">
    <h2>Categories</h2>
    <ul>
        <li><a href="products.php">All Products</a></li> <!-- Link to show all products -->
        <?php
        include 'databaseconnection.php'; // Include database connection

        // Fetch categories from the categories table
        $category_sql = "SELECT * FROM categories";
        $category_result = $conn->query($category_sql);

        // Loop through each category and display it in the sidebar
        if ($category_result->num_rows > 0) {
            while ($category = $category_result->fetch_assoc()) {
                echo '<li><a href="products.php?categoryID=' . $category['categoryID'] . '">' . $category['categoryName'] . '</a></li>';
            }
        }
        ?>
    </ul>
</div>

    <!-- Product Listing Section -->
    <div class="product-container">
        <div class="product-grid">
        <?php
        // Check if categoryID is set in the URL
        $categoryFilter = isset($_GET['categoryID']) ? $_GET['categoryID'] : null;

        // SQL query: filter products by category if categoryID is set
        if ($categoryFilter) {
            $product_sql = "SELECT * FROM product WHERE category = ?";
            $stmt = $conn->prepare($product_sql);
            $stmt->bind_param("i", $categoryFilter); // Bind as integer
        } else {
            $product_sql = "SELECT * FROM product";
            $stmt = $conn->prepare($product_sql);
        }

        $stmt->execute();
        $result = $stmt->get_result();

        // Display the filtered products
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo '
                <div class="product-item">
                    <a href="product-details.php?productID=' . $row['productID'] . '">
                        <img src="' . $row['image'] . '" alt="' . $row['name'] . '">
                        <p>' . $row['name'] . '</p>
                        <p>' . $row['price'] . '</p>
                    </a>
                </div>';
            }
        } else {
            echo "<p>No products found in this category.</p>";
        }

        $stmt->close();
        ?>

        </div>
    </div>

</div>

<?php include 'footer.php'; ?>




