<?php
include 'databaseconnection.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $productID = $_POST['productID'];
    $title = $_POST['title'];
    $description = $_POST['description'];
    $imagePaths = [];

    // Validate that productID is not empty and is numeric
    if (empty($productID) || !is_numeric($productID)) {
        echo "Invalid Product ID.";
        exit;
    }

    // Handle file upload
    if (!empty($_FILES['images']['name'][0])) {
        foreach ($_FILES['images']['tmp_name'] as $key => $tmp_name) {
            $image_name = basename($_FILES['images']['name'][$key]);
            $image_path = "recipe_image/" . $image_name;

            if (move_uploaded_file($tmp_name, $image_path)) {
                // Store image paths in an array
                $imagePaths[] = $image_path;
            }
        }
    }

    // Convert image paths array to JSON
    $imagesJSON = json_encode($imagePaths);

    // Insert recipe details including productID
    $sql = "INSERT INTO recipe (productID, title, description, image) VALUES (?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("isss", $productID, $title, $description, $imagesJSON);

    if ($stmt->execute()) {
        echo "Recipe uploaded successfully!";
    } else {
        echo "Error uploading recipe: " . $conn->error;
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
            font-size: 1.5em; /* Adjust font size for mobile */
            margin-top: 10px;
        }

        .admin-form {
            background-color: #ffffff;
            border: 1px solid #dddddd;
            border-radius: 8px;
            padding: 20px;
            margin: 20px auto;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            max-width: 500px; /* Center and limit width */
        }

        .admin-form label {
            display: block;
            margin-bottom: 5px;
            font-size: 0.9em; /* Adjust font size for labels */
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
            width: 100%; /* Full width for mobile */
        }

        .admin-form input[type="submit"]:hover {
            background-color: #2c3e50;
        }

        /* Responsive styling for mobile view */
        @media (max-width: 768px) {
            .admin-form {
                padding: 15px; /* Reduce padding on smaller screens */
                margin: 10px;
            }

            .form_h1 {
                font-size: 1.4em; /* Adjust heading size for mobile */
            }

            .admin-form input[type="text"],
            .admin-form textarea,
            .admin-form input[type="file"] {
                font-size: 0.95em; /* Slightly smaller text size for inputs */
            }

            .admin-form label {
                font-size: 0.85em; /* Smaller font size for labels */
            }
        }
    </style>
</head>
<body>
    <h1 class="form_h1">Upload Recipe</h1>
    <form action="upload_recipe.php" method="POST" enctype="multipart/form-data" class="admin-form">
        <label for="productID">Product ID:</label>
        <input type="text" name="productID" required><br>

        <label for="title">Title:</label>
        <input type="text" name="title" required><br>

        <label for="description">Description:</label>
        <textarea name="description" required></textarea><br>

        <label for="images">Upload Images (multiple allowed):</label>
        <input type="file" name="images[]" multiple><br>

        <input type="submit" value="Upload">
    </form>
</body>
</html>
