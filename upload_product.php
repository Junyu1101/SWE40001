<?php
session_start(); // Start session for flash messages
include 'databaseconnection.php';

// Fetch categories for the dropdown
$categoryQuery = "SELECT categoryID, categoryName FROM categories";
$categoryResult = $conn->query($categoryQuery);

// Handle product upload
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $name = $_POST['name'];
    $categoryID = $_POST['category']; // Use the selected category ID
    $description = $_POST['description'];
    $price = $_POST['price'];
    $imagePaths = [];

    // Handle file upload
    if (!empty($_FILES['images']['name'][0])) {
        foreach ($_FILES['images']['tmp_name'] as $key => $tmp_name) {
            $image_name = basename($_FILES['images']['name'][$key]);
            $image_path = "images/" . $image_name;

            if (move_uploaded_file($tmp_name, $image_path)) {
                // Store image paths in an array
                $imagePaths[] = $image_path;
            }
        }
    }

    // Convert image paths array to JSON
    $imagesJSON = json_encode($imagePaths);

    // Insert product details into the database
    $sql = "INSERT INTO product (name, category, description, price, image) 
            VALUES (?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sisds", $name, $categoryID, $description, $price, $imagesJSON);

    if ($stmt->execute()) {
        // Flash success message
        $_SESSION['message'] = "Product uploaded successfully!";
        $_SESSION['message_type'] = "success";
    } else {
        // Flash error message
        $_SESSION['message'] = "Error uploading product: " . $conn->error;
        $_SESSION['message_type'] = "error";
    }

    $stmt->close();
    $conn->close();

    // Redirect to the admin product page
    header("Location: admin_product.php");
    exit();
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Product</title>
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
    <h1 class="form_h1">Upload Product</h1>
    <form action="upload_product.php" method="POST" enctype="multipart/form-data" class="admin-form">
        <label for="name">Product Name:</label>
        <input type="text" name="name" required>

        <label for="category">Category:</label>
        <select name="category" required>
            <option value="">Select a category</option>
            <?php
            if ($categoryResult->num_rows > 0) {
                while ($row = $categoryResult->fetch_assoc()) {
                    echo "<option value='" . $row['categoryID'] . "'>" . $row['categoryName'] . "</option>";
                }
            } else {
                echo "<option value=''>No categories available</option>";
            }
            ?>
        </select>

        <label for="description">Description:</label>
        <textarea name="description"></textarea>

        <label for="price">Price:</label>
        <input type="number" name="price" step="0.01" required>

        <label for="images">Upload Image:</label>
        <input type="file" name="images[]"  required>

        <input type="submit" value="Upload">
    </form>
    
</body>
<?php include 'footer.php'; ?>
</html>
