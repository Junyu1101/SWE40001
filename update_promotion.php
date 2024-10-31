<?php
include 'databaseconnection.php';

// Retrieve form data
$promotionID = $_POST['promotionID'];
$title = $_POST['title'];
$description = $_POST['description'];
$start_date = $_POST['start_date'];
$end_date = $_POST['end_date'];
$code = $_POST['code'];
$productID = $_POST['productID'];

// Update the promotion in the database
$sql = "UPDATE promotion SET title = ?, description = ?, start_date = ?, end_date = ?, code = ?, productID = ? WHERE promotionID = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("sssssii", $title, $description, $start_date, $end_date, $code, $productID, $promotionID);

if ($stmt->execute()) {
    echo "Promotion updated successfully!";
    echo "<br><a href='admin_promotion.php'>Back to Promotions</a>";
} else {
    echo "Error updating promotion: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>