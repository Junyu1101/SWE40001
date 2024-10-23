<?php
    include 'databaseconnection.php';

    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $title = $_POST['title'];
        $description = $_POST['description'];
        $imagePaths = [];

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

        // Insert recipe details
        $sql = "INSERT INTO recipe (productID, title, description, image) VALUES (1, '$title', '$description', '$imagesJSON')";
        if ($conn->query($sql) === TRUE) {
            echo "Recipe uploaded successfully!";
        } else {
            echo "Error uploading recipe: " . $conn->error;
        }
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Recipe</title>
    <link rel="stylesheet" href="styles/style.css">
    <style>
        
        /* Form styles */
        .form_h1{
            text-align: center;
        }
        .admin-form {
            background-color: #ffffff;
            border: 1px solid #dddddd;
            border-radius: 8px;
            padding: 20px;
            margin: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .admin-form label {
            display: block;
            margin-bottom: 5px;
        }

        .admin-form input[type="text"],
        .admin-form textarea,
        .admin-form input[type="file"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #dddddd;
            border-radius: 4px;
        }

        .admin-form input[type="submit"] {
            background-color: #35424a;
            color: #ffffff;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
        }

        .admin-form input[type="submit"]:hover {
            background-color: #2c3e50;
        }
    </style>
</head>
<body>
    <h1 class="form_h1">Upload Recipe</h1>
        <form action="upload_recipe.php" method="POST" enctype="multipart/form-data" class="admin-form"> <!-- Add class -->
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
