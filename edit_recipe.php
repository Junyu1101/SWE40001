<?php
// Include the database connection
include 'databaseconnection.php';

// Check if recipe ID is set in the URL
if (isset($_GET['id'])) {
    $recipe_id = $_GET['id'];

    // Fetch recipe details from the database
    $sql = "SELECT * FROM recipe WHERE recipeID = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $recipe_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $recipe = $result->fetch_assoc();
    $stmt->close();

    // If form is submitted, process the update
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $title = $_POST['title'];
        $description = $_POST['description'];

        // Handle new image uploads if provided
        if (!empty($_FILES['images']['name'][0])) {
            $imageArray = [];
            foreach ($_FILES['images']['tmp_name'] as $key => $tmp_name) {
                $file_name = $_FILES['images']['name'][$key];
                $file_tmp = $_FILES['images']['tmp_name'][$key];
                $upload_path = "recipe_image/" . basename($file_name);

                if (move_uploaded_file($file_tmp, $upload_path)) {
                    $imageArray[] = $upload_path;
                }
            }
            $imageJSON = json_encode($imageArray);
        } else {
            $imageJSON = $recipe['image'];  // Retain existing images if none uploaded
        }

        // Update recipe details in the database
        $sql = "UPDATE recipe SET title = ?, description = ?, image = ? WHERE recipeID = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("sssi", $title, $description, $imageJSON, $recipe_id);
        if ($stmt->execute()) {
            echo "Recipe updated successfully!";
            header("Location: admin_recipe.php"); // Redirect to the admin page
            exit;
        } else {
            echo "Error updating recipe: " . $conn->error;
        }
        $stmt->close();
    }
} else {
    echo "Recipe ID not provided.";
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Recipe</title>
    <link rel="stylesheet" href="styles/style.css">
    <style>
        .edit-container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .edit-container h1 {
            text-align: center;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
        }

        .form-group input[type="text"],
        .form-group textarea {
            width: 100%;
            padding: 8px;
            border-radius: 4px;
            border: 1px solid #ddd;
        }

        .form-group input[type="file"] {
            padding: 5px;
        }

        .existing-images img {
            max-width: 80px;
            margin-right: 5px;
            border-radius: 4px;
        }

        .btn-submit {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        .btn-submit:hover {
            background-color: #2980b9;
        }

    </style>
</head>
<body>
    <?php include 'header.php'; ?>

    <div class="edit-container">
        <h1>Edit Recipe</h1>
        <form action="edit_recipe.php?id=<?php echo $recipe_id; ?>" method="POST" enctype="multipart/form-data">
            <div class="form-group">
                <label for="title">Title:</label>
                <input type="text" id="title" name="title" value="<?php echo htmlspecialchars($recipe['title']); ?>" required>
            </div>

            <div class="form-group">
                <label for="description">Description:</label>
                <textarea id="description" name="description" rows="4" required><?php echo htmlspecialchars($recipe['description']); ?></textarea>
            </div>

            <div class="form-group">
                <label>Existing Images:</label>
                <div class="existing-images">
                    <?php
                    $imageArray = json_decode($recipe['image'], true);
                    if (!empty($imageArray)) {
                        foreach ($imageArray as $image_path) {
                            echo "<img src='" . htmlspecialchars($image_path) . "' alt='Recipe Image'>";
                        }
                    } else {
                        echo "No images available";
                    }
                    ?>
                </div>
            </div>

            <div class="form-group">
                <label for="images">Upload New Images (optional):</label>
                <input type="file" id="images" name="images[]" multiple>
            </div>

            <button type="submit" class="btn-submit">Update Recipe</button>
        </form>
    </div>

    <?php include 'footer.php'; ?>
</body>
</html>

<?php
$conn->close();
?>
