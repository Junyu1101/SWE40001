<?php
include "role_admin_check.php";
// Include the database connection
include 'databaseconnection.php';

// Check if the promotion ID is set in the URL
if (isset($_GET['id'])) {
    $promotionID = $_GET['id'];

    // Fetch the promotion data from the database
    $sql = "SELECT * FROM promotion WHERE promotionID = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $promotionID);
    $stmt->execute();
    $result = $stmt->get_result();

    // Check if promotion data exists
    if ($result->num_rows > 0) {
        $promotion = $result->fetch_assoc();
    } else {
        echo "Promotion not found.";
        exit();
    }

    $stmt->close();
} else {
    echo "No promotion ID specified.";
    exit();
}

// Fetch the list of products to populate the dropdown
$product_sql = "SELECT productID, name FROM product";
$product_result = $conn->query($product_sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Promotion</title>
    <link rel="stylesheet" href="styles/style.css">
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        /* Form Container Style */
        form {
            max-width: 600px;
            margin: 40px auto;
            padding: 40px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        /* Headings */
        h2 {
            text-align: center;
            font-size: 24px;
            color: #333;
        }

        /* Label and Input Fields */
        label {
            display: block;
            margin-bottom: 8px;
            font-size: 16px;
            color: #555;
        }

        input[type="text"],
        input[type="date"],
        textarea,
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        textarea {
            resize: vertical;
            height: 100px;
        }

        /* Submit Button */
        input[type="submit"] {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            color: white;
            background-color: #3498db;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }

        .backicon {
            margin-right: 10px;
        }

        .backicon a {
            text-decoration: none;
            /* Remove underline from the link */
            color: black;
            /* make the icon black color */
        }

        .backicon i {
            font-size: 2.5rem;
            /* make the icon bigger */
        }
        /* Responsive Adjustments */
        @media (max-width: 600px) {
            form {
                padding: 15px;
                margin: 20px;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="header-container">
            <div class="backicon">
                <a href="admin_promotion.php">
                    <i class="fa-sharp fa-solid fa-angle-left"></i>
                </a>
            </div>
            <div class="logo">
                <img src="images/ccklogo.png" alt="CCK Logo">
            </div>
            <div class="login">
                <a href="login.php">Login</a>
            </div>
        </div>
    </header>

    <h2>Edit Promotion</h2>
    <form action="update_promotion.php" method="POST">
        <input type="hidden" name="promotionID" value="<?php echo htmlspecialchars($promotion['promotionID']); ?>">

        <label for="title">Title:</label>
        <input type="text" id="title" name="title" value="<?php echo htmlspecialchars($promotion['title']); ?>" required>

        <label for="description">Description:</label>
        <textarea id="description" name="description" required><?php echo htmlspecialchars($promotion['description']); ?></textarea>

        <label for="start_date">Start Date:</label>
        <input type="date" id="start_date" name="start_date" value="<?php echo htmlspecialchars($promotion['start_date']); ?>" required>

        <label for="end_date">End Date:</label>
        <input type="date" id="end_date" name="end_date" value="<?php echo htmlspecialchars($promotion['end_date']); ?>" required>

        <label for="code">Promo Code:</label>
        <input type="text" id="code" name="code" value="<?php echo htmlspecialchars($promotion['code']); ?>" required>

        <label for="productID">Select Product:</label>
        <select id="productID" name="productID" required>
            <?php while ($product = $product_result->fetch_assoc()): ?>
                <option value="<?php echo $product['productID']; ?>"
                    <?php if ($promotion['productID'] == $product['productID']) echo 'selected'; ?>>
                    <?php echo htmlspecialchars($product['name']); ?>
                </option>
            <?php endwhile; ?>
        </select>

        <input type="submit" value="Update Promotion">
    </form>

    <?php include 'footer.php'; ?>
</body>
</html>

<?php
$conn->close();
?>
