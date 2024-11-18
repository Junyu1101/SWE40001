<?php
// Include the database connection
include 'databaseconnection.php';

// Handle delete request
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['action'])) {
    if ($_POST['action'] == 'delete' && isset($_POST['promotion_id'])) {
        $promotion_id = $_POST['promotion_id'];

        // Validate the promotion ID before deletion
        if (!empty($promotion_id)) {
            $sql = "DELETE FROM promotion WHERE promotionID = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("i", $promotion_id);
            if ($stmt->execute()) {
                // Redirect back to the same page with a success status
                header("Location: admin_promotion.php?status=deleted");
                exit();
            } else {
                echo "Error deleting promotion: " . $conn->error;
            }
            $stmt->close();
        }
    }
}


// Fetch all promotions from the database
$sql = "SELECT promotion.promotionID, promotion.title, promotion.description, promotion.start_date, promotion.end_date, promotion.code, product.name AS product_name
        FROM promotion
        LEFT JOIN product ON promotion.productID = product.productID";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Promotion Management</title>
    <link rel="stylesheet" href="styles/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .promotion-container {
            max-width: 1000px;
            margin: 20px auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .promotion-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .promotion-table th,
        .promotion-table td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .promotion-table th {
            background-color: #f2f2f2;
            font-weight: bold;
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

        .btn-edit,
        .btn-add {
            background-color: #3498db;
        }

        .btn:hover {
            opacity: 0.8;
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
                <a href="index.php">Logout</a>
            </div>
        </div>
        <div class="navbar-wrapper">
            <?php include 'admin_navbar.php'; ?>
        </div>
    </header>

    <div class="promotion-container">
        <h1>Promotion Management</h1>

        <a href="admin_add_promotion.php" class="btn btn-add">Add New Promotion</a>

        <?php if ($result->num_rows > 0): ?>
            <table class="promotion-table">
                <thead>
                    <tr>
                        <th>Promotion ID</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Product</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Promo Code</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($row = $result->fetch_assoc()): ?>
                        <tr>
                            <td><?php echo htmlspecialchars($row['promotionID']); ?></td>
                            <td><?php echo htmlspecialchars($row['title']); ?></td>
                            <td><?php echo htmlspecialchars($row['description']); ?></td>
                            <td><?php echo htmlspecialchars($row['product_name'] ?? 'No Product'); ?></td>
                            <td><?php echo htmlspecialchars($row['start_date']); ?></td>
                            <td><?php echo htmlspecialchars($row['end_date']); ?></td>
                            <td><?php echo htmlspecialchars($row['code']); ?></td>
                            <td>
                                <div class="action-buttons">
                                    <form action="admin_promotion.php" method="POST"
                                        onsubmit="return confirm('Are you sure you want to delete this promotion?');"
                                        style="display:inline;">
                                        <input type="hidden" name="promotion_id" value="<?php echo $row['promotionID']; ?>">
                                        <input type="hidden" name="action" value="delete">
                                        <button type="submit" class="btn btn-delete">Delete</button>
                                    </form>
                                    <a href="admin_edit_promotion.php?id=<?php echo $row['promotionID']; ?>"
                                        class="btn btn-edit">Edit</a>
                                </div>
                            </td>
                        </tr>
                    <?php endwhile; ?>
                </tbody>
            </table>
        <?php else: ?>
            <p>No promotions found.</p>
        <?php endif; ?>
    </div>

    <?php include 'footer.php'; ?>

    <script>
        // Check if the 'status' parameter is set in the URL
        const urlParams = new URLSearchParams(window.location.search);
        const status = urlParams.get('status');

        if (status === 'success') {
            alert("Promotion added successfully!");
        } else if (status === 'error') {
            alert("There was an error adding the promotion.");
        } else if (status === 'updated') {
            alert("Promotion updated successfully!");
        } else if (status === 'deleted') {
            // Show the toast notification for promotion deletion
            const toast = document.getElementById("toast");
            toast.classList.add("show");

            // Hide the toast after 3 seconds
            setTimeout(() => {
                toast.classList.remove("show");
            }, 3000);
        }
    </script>


</body>

</html>

<?php
$conn->close();
?>