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
</head>
<body>
    <h1>Upload Recipe</h1>
    <form action="upload_recipe.php" method="POST" enctype="multipart/form-data">
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
