<?php
include 'databaseconnection.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $title = htmlspecialchars($_POST['title']);
    $description = htmlspecialchars($_POST['description']);
    $imagePaths = [];
    $gameLink = htmlspecialchars($_POST['gameLink']);

    // Handle file uploads
    if (!empty($_FILES['images']['name'][0])) {
        foreach ($_FILES['images']['tmp_name'] as $key => $tmp_name) {
            $image_name = basename($_FILES['images']['name'][$key]);
            $image_path = "images/" . $image_name;
            $file_type = mime_content_type($tmp_name);

            // Allow only image file types
            if (in_array($file_type, ['image/jpeg', 'image/png', 'image/gif'])) {
                if (move_uploaded_file($tmp_name, $image_path)) {
                    $imagePaths[] = $image_path;
                } else {
                    header("Location: upload_game.php?error=FileUploadFailed");
                    exit;
                }
            } else {
                header("Location: upload_game.php?error=InvalidFileType");
                exit;
            }
        }
    }

    // Convert image paths array to JSON
    $imagesJSON = json_encode($imagePaths);

    // Insert game details
    $sql = "INSERT INTO game (title, description, image, gameLink) VALUES (?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssss", $title, $description, $imagesJSON, $gameLink);

    if ($stmt->execute()) {
        header("Location: upload_game.php?status=success");
        exit();
    } else {
        header("Location: upload_game.php?error=DatabaseError");
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
    <title>Upload Game</title>
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
    <h1 class="form_h1">Upload Game</h1>

    <!-- Display success or error message -->
    <?php if (isset($_GET['status']) && $_GET['status'] == 'success'): ?>
        <p class="success-message">Game uploaded successfully!</p>
    <?php elseif (isset($_GET['error'])): ?>
        <p class="error-message"><?php echo htmlspecialchars($_GET['error']); ?></p>
    <?php endif; ?>

    <form action="upload_game.php" method="POST" enctype="multipart/form-data" class="admin-form">

        <label for="title">Title:</label>
        <input type="text" name="title" required><br>

        <label for="description">Description:</label>
        <textarea name="description" required></textarea><br>

        <label for="images">Upload Images (multiple allowed):</label>
        <input type="file" name="images[]" multiple accept="image/jpeg, image/png, image/gif"><br>

        <label for="gameLink">Link:</label>
        <input type="text" name="gameLink" required></inp><br>
        

        <input type="submit" value="Upload">
        <input type="button" value="Cancel" onclick="window.location.href='admin_game.php';" class="cancel-button">
    </form>
</body>
</html>
