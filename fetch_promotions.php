<?php
include 'databaseconnection.php';

$sql = "SELECT promotion.promotionID, promotion.title, promotion.description, promotion.start_date, promotion.end_date, product.name 
        FROM promotion 
        JOIN product ON promotion.productID = product.productID";

$result = $conn->query($sql);

$promotions = [];

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $promotions[] = $row;
    }
}

header('Content-Type: application/json');
echo json_encode($promotions);
?>