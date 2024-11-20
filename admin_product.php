<?php
session_start(); // Start session for flash messages
include 'databaseconnection.php';

// Handle delete request
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['action'])) {
    if ($_POST['action'] == 'delete' && isset($_POST['product_id'])) {
        $product_id = $_POST['product_id'];

        // Validate the product ID before deletion
        if (!empty($product_id)) {
            $sql = "DELETE FROM product WHERE productID = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("i", $product_id);
            if ($stmt->execute()) {
                // Flash success message
                $_SESSION['message'] = "Product deleted successfully!";
                $_SESSION['message_type'] = "success";
            } else {
                // Flash error message
                $_SESSION['message'] = "Error deleting product: " . $conn->error;
                $_SESSION['message_type'] = "error";
            }
            $stmt->close();
        }

        // Redirect to avoid form resubmission
        header("Location: admin_product.php");
        exit();
    }
}

// Fetch all products from the database
$sql = "SELECT * FROM product";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <title>Admin Product Management</title>
</head>
<body>
<header>
        <div class="header-container">
            <div class="logo">
                <img src="images/ccklogo.png" alt="CCK Logo">
            </div>
            <div class="login">
                <a href="index.php">Logout</a>
            </div>
        </div>
        <div class="navbar-wrapper">
            <?php include 'admin_navbar.php'; ?>
        </div>
    </header>

    <div class="admin-product-container">
        <h1>Product Management</h1>
        <a href="upload_product.php" class="btn btn-edit">Upload New Product</a>

        <!-- Flash Message Section -->
        <?php if (isset($_SESSION['message'])): ?>
            <div class="flash-message <?php echo htmlspecialchars($_SESSION['message_type']); ?>">
                <?php
                echo htmlspecialchars($_SESSION['message']);
                unset($_SESSION['message'], $_SESSION['message_type']); // Clear the message after displaying
                ?>
            </div>
        <?php endif; ?>

        <?php if ($result->num_rows > 0): ?>
            <table class="product-table" border="1">
                <thead>
                    <tr>
                        <th>Product ID</th>
                        <th>Category</th>
                        <th>Price (RM)</th>
                        <th>Description</th>
                        <th>Images</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($row = $result->fetch_assoc()): 
                        // Decode JSON image data
                        $images = json_decode($row['image'], true); ?>
                        <tr>
                            <td><?php echo htmlspecialchars($row['productID']); ?></td>
                            <td><?php echo htmlspecialchars($row['category']); ?></td>
                            <td><?php echo htmlspecialchars($row['price']); ?></td>
                            <td><?php echo htmlspecialchars($row['description']); ?></td>
                            <td>
                                <?php if (!empty($images)): ?>
                                    <div>
                                        <?php foreach ($images as $image): ?>
                                            <img src="<?php echo htmlspecialchars($image); ?>" alt="Product Image" style="max-width: 100px;">
                                        <?php endforeach; ?>
                                    </div>
                                <?php else: ?>
                                    <p>No images available.</p>
                                <?php endif; ?>
                            </td>
                            <td>
                                <div class="action-buttons">
                                    <!-- Delete form -->
                                    <form action="admin_product.php" method="POST" onsubmit="return confirm('Are you sure you want to delete this product?');" style="display:inline;">
                                        <input type="hidden" name="product_id" value="<?php echo htmlspecialchars($row['productID']); ?>">
                                        <input type="hidden" name="action" value="delete">
                                        <button type="submit" class="btn btn-delete">Delete</button>
                                    </form>
                                    <!-- Edit button -->
                                    <a href="edit_product.php?id=<?php echo htmlspecialchars($row['productID']); ?>" class="btn btn-edit">Edit</a>
                                </div>
                            </td>
                        </tr>
                    <?php endwhile; ?>
                </tbody>
            </table>
        <?php else: ?>
            <p>No products found.</p>
        <?php endif; ?>
    </div>

    <?php include 'footer.php'; ?>
</body>
</html>

<?php
$conn->close();
?>
