<?php include 'header.php'; ?>
   

 <!-- Product Information -->
    <div class="product-details-container">
        <?php
            include 'databaseconnection.php'; // Include database connection

            // Check if the productID is set and is numeric to prevent SQL injection
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

            // Check if a product is found with the given productID
            if ($result->num_rows == 1) {
                $product = $result->fetch_assoc();
        
                // Display the product details
                echo '
                <div class="product-image">
                    <img src="' . $product['image'] . '" alt="' . $product['name'] . '">
                </div>
                <div class="product-info">
                    <h1>' . $product['name'] . '</h1>
                    <p>' . $product['description'] . '</p>
                    <p class="product-price">$' . $product['price'] . '</p>
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

