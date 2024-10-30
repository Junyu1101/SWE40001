<?php
include 'databaseconnection.php';

$promotionID = isset($_GET['id']) ? intval($_GET['id']) : 0;

$sql = "SELECT promotion.title, promotion.description, promotion.start_date, promotion.end_date, promotion.code, 
        product.name, product.image, product.productID 
        FROM promotion 
        JOIN product ON promotion.productID = product.productID 
        WHERE promotion.promotionID = $promotionID";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $promotion = $result->fetch_assoc();
    echo json_encode($promotion);
} else {
    echo json_encode(['error' => 'Promotion not found']);
}
?>