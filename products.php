<?php include 'header.php'; ?>

    <!-- Sidebar -->
    <div class="product-sidebar">
        <h2>Categories</h2>
        <ul>
            <li><a href="#">All Products</a></li>
            <li><a href="#">Electronics</a></li>
            <li><a href="#">Fashion</a></li>
            <li><a href="#">Home & Kitchen</a></li>
            <li><a href="#">Sports</a></li>
            <li><a href="#">Toys</a></li>
        </ul>
    </div>

    <!-- Product Listing Section -->
    <div class="product-container">
        <div class="product-grid">
        <?php
                include 'databaseconnection.php'; // Include database connection

                $sql = "SELECT * FROM product";
                $result = $conn->query($sql);

                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        echo '
                        <div class="product-item">
                            <a href="product-details.php?productID=' . $row['productID'] . '">
                                <img src="' . $row['image'] . '" alt="' . $row['name'] . '">
                                <p>' . $row['name'] . '</p>
                                <p>$' . $row['price'] . '</p>
                            </a>
                        </div>';
                    }
                } else {
                    echo "<p>No products found.</p>";
                }

                $conn->close();
            ?>

        </div>
    </div>

<?php include 'footer.php'; ?>



