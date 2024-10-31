<?php
include 'databaseconnection.php';

$title = $_POST['title'];
$description = $_POST['description'];
$start_date = $_POST['start_date'];
$end_date = $_POST['end_date'];
$code = $_POST['code'];
$productID = $_POST['productID'];

$sql = "INSERT INTO promotion (productID, title, description, start_date, end_date, code) 
        VALUES (?, ?, ?, ?, ?, ?)";

$stmt = $conn->prepare($sql);
$stmt->bind_param("isssss", $productID, $title, $description, $start_date, $end_date, $code);

if ($stmt->execute()) {
    echo "New promotion added successfully!";
} else {
    echo "Error: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>