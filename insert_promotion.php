<?php
include 'databaseconnection.php';

// Retrieve POST data
$title = $_POST['title'];
$description = $_POST['description'];
$start_date = $_POST['start_date'];
$end_date = $_POST['end_date'];
$code = $_POST['code'];
$productID = $_POST['productID'];

// Prepare the SQL query
$sql = "INSERT INTO promotion (productID, title, description, start_date, end_date, code) 
        VALUES (?, ?, ?, ?, ?, ?)";

// Prepare the statement
$stmt = $conn->prepare($sql);
// Bind parameters to the prepared statement
$stmt->bind_param("isssss", $productID, $title, $description, $start_date, $end_date, $code);

// Execute the query
if ($stmt->execute()) {
    // Redirect on success
    header("Location: admin_promotion.php?status=success");
    exit();
} else {
    // If the query fails, show the error and stop
    echo "Error Adding The Promotion: " . $stmt->error;
}

// Close the statement
$stmt->close();

// Close the connection
$conn->close();
?>