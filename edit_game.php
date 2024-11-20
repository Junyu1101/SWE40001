<?php
session_start(); // Start session at the top of the page
// Include the database connection
include 'databaseconnection.php';

// Check if game ID is set in the URL
if (isset($_GET['id'])) {
    $game_id = $_GET['id'];
    
    // Fetch game details from the database
    $sql = "SELECT * FROM game WHERE gameID = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $game_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $game = $result->fetch_assoc();
    $stmt->close();

    // If form is submitted, process the update
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $title = $_POST['title'];
        $description = $_POST['description'];
        $gameLink = $_POST['gameLink'];


        // Handle new image uploads if provided
        if (!empty($_FILES['images']['name'][0])) {
            $imageArray = [];
            foreach ($_FILES['images']['tmp_name'] as $key => $tmp_name) {
                $file_name = $_FILES['images']['name'][$key];
                $file_tmp = $_FILES['images']['tmp_name'][$key];
                $upload_path = "images/" . basename($file_name);

                if (move_uploaded_file($file_tmp, $upload_path)) {
                    $imageArray[] = $upload_path;
                }
            }
            $imageJSON = json_encode($imageArray);
        } else {
            $imageJSON = $game['image']; // Retain existing images if none uploaded
        }

        // Update game details in the database, including productID
        $sql = "UPDATE game SET title = ?, description = ?, image = ?, gameLink = ? WHERE gameID = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ssssi", $title, $description, $imageJSON, $gameLink, $game_id);
        if ($stmt->execute()) {
            $_SESSION['success_message'] = "Game updated successfully!"; // Set success message
            header("Location: edit_game.php?id=" . $game_id); // Redirect to refresh the page
            exit;
        } else {
            echo "Error updating game: " . $conn->error;
        }
        $stmt->close();
    }
} else {
    echo "Game ID not provided.";
    exit;
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Game</title>
    <link rel="stylesheet" href="styles/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .edit-container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 100px;
        }

        .edit-container h1 {
            text-align: center;
            font-size: 1.8em; /* Adjust font size for mobile */
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            font-size: 1em; /* Adjust label font size for mobile */
        }

        .form-group input[type="text"],
        .form-group textarea {
            width: 100%;
            padding: 8px;
            border-radius: 4px;
            border: 1px solid #ddd;
            font-size: 1em; /* Adjust input text size for mobile */
        }

        .form-group input[type="file"] {
            padding: 5px;
            font-size: 1em; /* Adjust file input font size for mobile */
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

        /* Mobile-specific adjustments */
        @media (max-width: 768px) {
            .edit-container {
                padding: 15px;
                margin: 10px;
            }

            .edit-container h1 {
                font-size: 1.6em;
            }

            .form-group label {
                font-size: 0.9em;
            }

            .form-group input[type="text"],
            .form-group textarea,
            .form-group input[type="file"] {
                font-size: 1em;
            }

            .btn-submit {
                font-size: 1.2em;
                padding: 12px; /* Increase padding for touch devices */
            }
        }

        .alert.success {
            background-color: #d4edda;
            color: #155724;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #c3e6cb;
            border-radius: 5px;
            text-align: center;
        }
    </style>

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

    <div class="edit-container">
        <h1>Edit Game</h1>

        <?php if (isset($_SESSION['success_message'])): ?>
            <div class="alert success">
                <?php 
                echo $_SESSION['success_message']; 
                unset($_SESSION['success_message']); // Clear the message
                ?>
            </div>
        <?php endif; ?>


        <form action="edit_game.php?id=<?php echo $game_id; ?>" method="POST" enctype="multipart/form-data">

            <div class="form-group">
                <label for="title">Title:</label>
                <input type="text" id="title" name="title" value="<?php echo htmlspecialchars($game['title']); ?>" required>
            </div>

            <div class="form-group">
                <label for="description">Description:</label>
                <textarea id="description" name="description" rows="15" required><?php echo htmlspecialchars($game['description']); ?></textarea>
            </div>

            <div class="form-group">
                <label>Existing Images:</label>
                <div class="existing-images">
                    <?php
                    $imageArray = json_decode($game['image'], true);
                    if (!empty($imageArray)) {
                        foreach ($imageArray as $image_path) {
                            echo "<img src='" . htmlspecialchars($image_path) . "' alt='Game Image'>";
                        }
                    } else {
                        echo "No images available";
                    }
                    ?>
                </div>
            </div>

            <div class="form-group">
                <label for="images">Upload New Image (optional):</label>
                <input type="file" id="images" name="images[]" multiple>
            </div>

            <div class="form-group">
                <label for="gameLink">Game Link:</label>
                <input type="text" id="gameLink" name="gameLink" value="<?php echo htmlspecialchars($game['gameLink']); ?>" required>
            </div>

            <button type="submit" class="btn-submit">Update Game</button>
            <input type="button" value="Cancel" onclick="window.location.href='admin_game.php';" class="cancel-button">
        </form>
    </div>

    <?php include 'footer.php'; ?>
</body>
</html>

<?php
$conn->close();
?>
