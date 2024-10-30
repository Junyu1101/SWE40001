<?php
// Include the database connection
include 'databaseconnection.php';

// Handle delete request
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['action'])) {
    if ($_POST['action'] == 'delete' && isset($_POST['recipe_id'])) {
        $recipe_id = $_POST['recipe_id'];

        // Validate the recipe ID before deletion
        if (!empty($recipe_id)) {
            $sql = "DELETE FROM recipe WHERE recipeID = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("i", $recipe_id);
            if ($stmt->execute()) {
                echo "Recipe deleted successfully!";
            } else {
                echo "Error deleting recipe: " . $conn->error;
            }
            $stmt->close();
        }
    }
}

// Fetch all recipes from the database
$sql = "SELECT * FROM recipe";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Recipe Management</title>
    <link rel="stylesheet" href="styles/style.css">
    <style>
        .recipe-container {
            max-width: 1000px;
            margin: 20px auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .recipe-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .recipe-table th, .recipe-table td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .recipe-table th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        .recipe-table img {
            max-width: 80px;
            border-radius: 4px;
        }

        .action-buttons {
            display: flex;
            gap: 8px;
        }

        .btn {
            padding: 8px 12px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            text-decoration: none;
            color: white;
        }

        .btn-delete {
            background-color: #e74c3c;
        }

        .btn-edit {
            background-color: #3498db;
        }

        .btn:hover {
            opacity: 0.8;
        }

        .image-container img {
            max-width: 80px;
            margin-right: 5px;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <?php include 'header.php'; ?>

    <div class="recipe-container">
        <h1>Recipe Management</h1>
        <a href="upload_recipe.php" class="btn btn-edit">Upload New Recipe</a>

        <?php if ($result->num_rows > 0): ?>
            <table class="recipe-table">
                <thead>
                    <tr>
                        <th>Recipe ID</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Images</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($row = $result->fetch_assoc()): ?>
                        <tr>
                            <td><?php echo htmlspecialchars($row['recipeID']); ?></td>
                            <td><?php echo htmlspecialchars($row['title']); ?></td>
                            <td><?php echo htmlspecialchars($row['description']); ?></td>
                            <td class='image-container'>
                                <?php
                                    $imageArray = json_decode($row['image'], true);
                                    if (!empty($imageArray)) {
                                        foreach ($imageArray as $image_path) {
                                            echo "<img src='" . htmlspecialchars($image_path) . "' alt='Recipe Image'>";
                                        }
                                    } else {
                                        echo "No images available";
                                    }
                                ?>
                            </td>
                            <td>
                                <div class="action-buttons">
                                    <form action="admin_recipe.php" method="POST" onsubmit="return confirm('Are you sure you want to delete this recipe?');" style="display:inline;">
                                        <input type="hidden" name="recipe_id" value="<?php echo $row['recipeID']; ?>">
                                        <input type="hidden" name="action" value="delete">
                                        <button type="submit" class="btn btn-delete">Delete</button>
                                    </form>
                                    <a href="edit_recipe.php?id=<?php echo $row['recipeID']; ?>" class="btn btn-edit">Edit</a>
                                </div>
                            </td>
                        </tr>
                    <?php endwhile; ?>
                </tbody>
            </table>
        <?php else: ?>
            <p>No recipes found.</p>
        <?php endif; ?>
    </div>

    <?php include 'footer.php'; ?>
</body>
</html>

<?php
$conn->close();
?>
