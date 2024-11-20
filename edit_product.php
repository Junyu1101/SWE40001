<?php
include 'databaseconnection.php';

// Fetch product data for editing
if (isset($_GET['id'])) {
    $productID = $_GET['id'];

    // Fetch product details
    $productQuery = "SELECT * FROM product WHERE productID = ?";
    $productStmt = $conn->prepare($productQuery);
    $productStmt->bind_param("i", $productID);
    $productStmt->execute();
    $productResult = $productStmt->get_result();
    $product = $productResult->fetch_assoc();

    // Fetch categories for the dropdown
    $categoryQuery = "SELECT categoryID, categoryName FROM categories";
    $categoryResult = $conn->query($categoryQuery);

    if (!$product) {
        die("Product not found.");
    }
} else {
    die("Invalid product ID.");
}

// Handle product update
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $name = $_POST['name'];
    $categoryID = $_POST['category'];
    $description = $_POST['description'];
    $price = $_POST['price'];
    $imagePaths = json_decode($product['image'], true);

    // Handle file upload
    if (!empty($_FILES['images']['name'][0])) {
        foreach ($_FILES['images']['tmp_name'] as $key => $tmp_name) {
            $image_name = basename($_FILES['images']['name'][$key]);
            $image_path = "images/" . $image_name;

            if (move_uploaded_file($tmp_name, $image_path)) {
                $imagePaths[] = $image_path;
            }
        }
    }

    // Convert image paths array to JSON
    $imagesJSON = json_encode($imagePaths);

    // Update product details
    $updateQuery = "UPDATE product SET name = ?, category = ?, description = ?, price = ?, image = ? WHERE productID = ?";
    $updateStmt = $conn->prepare($updateQuery);
    $updateStmt->bind_param("sisdsi", $name, $categoryID, $description, $price, $imagesJSON, $productID);

    if ($updateStmt->execute()) {
        echo "Product updated successfully!";
    } else {
        echo "Error updating product: " . $conn->error;
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product</title>
    <link rel="stylesheet" href="styles/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
</head>
<body>
<header>
        <div class="header-container">
            <div class="logo">
                <img src="images/ccklogo.png" alt="CCK Logo">
            </div>
            <div class="login">
                <a href="logout.php">Logout</a>
            </div>
        </div>
        <div class="navbar-wrapper">
            <?php include 'admin_navbar.php'; ?>
        </div>
    </header>
    <h1 class="form_h1">Edit Product</h1>
    <form action="edit_product.php?id=<?php echo $productID; ?>" method="POST" enctype="multipart/form-data" class="admin-form">
        <label for="name">Product Name:</label>
        <input type="text" name="name" value="<?php echo htmlspecialchars($product['name']); ?>" required>

        <label for="category">Category:</label>
        <select name="category" required>
            <option value="">Select a category</option>
            <?php
            if ($categoryResult->num_rows > 0) {
                while ($row = $categoryResult->fetch_assoc()) {
                    $selected = $row['categoryID'] == $product['category'] ? "selected" : "";
                    echo "<option value='" . $row['categoryID'] . "' $selected>" . $row['categoryName'] . "</option>";
                }
            } else {
                echo "<option value=''>No categories available</option>";
            }
            ?>
        </select>

        <label for="description">Descriptionss:</label>
        <textarea name="description" ><?php echo htmlspecialchars($product['description']); ?></textarea>

        <label for="price">Price:</label>
        <input type="number" name="price" step="0.01" value="<?php echo htmlspecialchars($product['price']); ?>" required>

        <label>Current Images:</label>
        <div class="current-images">
            <?php
            $currentImages = json_decode($product['image'], true);
            if (!empty($currentImages)) {
                foreach ($currentImages as $image) {
                    echo "<img src='" . htmlspecialchars($image) . "' alt='Product Image'>";
                }
            } else {
                echo "No images available.";
            }
            ?>
        </div>

        <label for="images">Upload New Image:</label>
        <input type="file" name="images[]">

        <input type="submit" value="Update Product">
    </form>
</body>
</html>
