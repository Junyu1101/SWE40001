<?php include 'header.php'; ?>

<!-- Product Information -->
<div class="product-details-container">
    <?php
    include 'databaseconnection.php'; // Include database connection

    if (isset($_GET['productID']) && is_numeric($_GET['productID'])) {
        $product_id = $_GET['productID'];

        // Prepare and execute the SQL query to fetch the product details based on productID
        $sql = "SELECT * FROM product WHERE productID = ?";
        $stmt = $conn->prepare($sql);

        if (!$stmt) {
            die("Error preparing statement: " . $conn->error);
        }

        $stmt->bind_param("i", $product_id); // Bind the productID as an integer
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result === false) {
            die("Error executing query: " . $stmt->error);
        }

        if ($result->num_rows == 1) {
            $product = $result->fetch_assoc();
            $images = json_decode($product['image'], true);

            echo '<div class="product-image">';
            if (!empty($images)) {
                foreach ($images as $image) {
                    echo '<img src="' . htmlspecialchars($image) . '" alt="' . htmlspecialchars($product['name']) . '">';
                }
            } else {
                echo '<img src="images/placeholder.jpg" alt="No Image Available">';
            }
            echo '</div>';

            echo '
            <div class="product-info">
                <h1>' . htmlspecialchars($product['name']) . '</h1>
                <p>' . htmlspecialchars($product['description']) . '</p>
                <p class="product-price">RM' . htmlspecialchars($product['price']) . '</p>
            </div>';

            // QR code for this product
            echo '
            <div class="product-qr">
                <h3>Scan to view this product</h3>
                <img src="generate_qr_code.php?productID=' . htmlspecialchars($product_id) . '" alt="QR Code">
            </div>';
        } else {
            echo "<p>Product not found.</p>";
        }

        $stmt->close();
    } else {
        echo "<p>No product selected or invalid product ID.</p>";
    }

    $conn->close();
    ?>
</div>

<?php include 'footer.php'; ?>


