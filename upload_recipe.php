<?php
include 'databaseconnection.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $productID = $_POST['productID'];
    $title = htmlspecialchars($_POST['title']);
    $category = htmlspecialchars($_POST['category']); 
    $description = htmlspecialchars($_POST['description']);
    $imagePaths = [];

    // Validate productID is numeric and exists in the database
    if (empty($productID) || !is_numeric($productID)) {
        header("Location: upload_recipe.php?error=InvalidProductID");
        exit;
    }

    // Handle file uploads
    if (!empty($_FILES['images']['name'][0])) {
        foreach ($_FILES['images']['tmp_name'] as $key => $tmp_name) {
            $image_name = basename($_FILES['images']['name'][$key]);
            $image_path = "recipe_image/" . $image_name;
            $file_type = mime_content_type($tmp_name);

            // Allow only image file types
            if (in_array($file_type, ['image/jpeg', 'image/png', 'image/gif'])) {
                if (move_uploaded_file($tmp_name, $image_path)) {
                    $imagePaths[] = $image_path;
                } else {
                    header("Location: upload_recipe.php?error=FileUploadFailed");
                    exit;
                }
            } else {
                header("Location: upload_recipe.php?error=InvalidFileType");
                exit;
            }
        }
    }

    // Convert image paths array to JSON
    $imagesJSON = json_encode($imagePaths);

    // Insert recipe details with category
    $sql = "INSERT INTO recipe (productID, title, category, description, image) VALUES (?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("issss", $productID, $title, $category, $description, $imagesJSON);

    if ($stmt->execute()) {
        header("Location: upload_recipe.php?status=success");
        exit();
    } else {
        header("Location: upload_recipe.php?error=DatabaseError");
        exit();
    }


    $stmt->close();
}
$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Recipe</title>
    <link rel="stylesheet" href="styles/style.css">
    <style>
        .form_h1 {
            text-align: center;
            font-size: 1.5em;
            margin-top: 10px;
        }

        .admin-form {
            background-color: #ffffff;
            border: 1px solid #dddddd;
            border-radius: 8px;
            padding: 20px;
            margin: 20px auto;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            max-width: 500px;
        }

        .admin-form label {
            display: block;
            margin-bottom: 5px;
            font-size: 0.9em;
        }

        .admin-form input[type="text"],
        .admin-form textarea,
        .admin-form input[type="file"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #dddddd;
            border-radius: 4px;
            font-size: 1em;
        }

        .admin-form input[type="submit"] {
            background-color: #35424a;
            color: #ffffff;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1em;
            width: 100%;
        }

        .admin-form input[type="submit"]:hover {
            background-color: #2c3e50;
        }

        .success-message {
            color: green;
            text-align: center;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .error-message {
            color: red;
            text-align: center;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .cancel-button {
            background-color: #d9534f;
            color: #ffffff;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1em;
            width: 100%;
            margin-top: 10px;
        }

        .cancel-button:hover {
            background-color: #c9302c;
        }

        @media (max-width: 768px) {
            .admin-form {
                padding: 15px;
                margin: 10px;
            }

            .form_h1 {
                font-size: 1.4em;
            }

            .admin-form input[type="text"],
            .admin-form textarea,
            .admin-form input[type="file"] {
                font-size: 0.95em;
            }

            .admin-form label {
                font-size: 0.85em;
            }
        }
    </style>
</head>
<body>
    <h1 class="form_h1">Upload Recipe</h1>

    <!-- Display success or error message -->
    <?php if (isset($_GET['status']) && $_GET['status'] == 'success'): ?>
        <p class="success-message">Recipe uploaded successfully!</p>
    <?php elseif (isset($_GET['error'])): ?>
        <p class="error-message"><?php echo htmlspecialchars($_GET['error']); ?></p>
    <?php endif; ?>

    <form action="upload_recipe.php" method="POST" enctype="multipart/form-data" class="admin-form">
        <label for="productID">Product ID:</label>
        <input type="text" name="productID" required><br>

        <label for="title">Title:</label>
        <input type="text" name="title" required><br>
        
        <label for="category">Category:</label>
        <textarea name="category" required></textarea><br>

        <label for="description">Description:</label>
        <textarea name="description" required></textarea><br>

        <label for="images">Upload Images (multiple allowed):</label>
        <input type="file" name="images[]" multiple accept="image/jpeg, image/png, image/gif"><br>

        <input type="submit" value="Upload">
        <input type="button" value="Cancel" onclick="window.location.href='admin_recipe.php';" class="cancel-button">
    </form>
</body>
</html>
