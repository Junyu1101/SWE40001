<?php
require 'qrcodes/qrlib.php'; // Ensure this library is correctly included

// Check if productID is passed
if (isset($_GET['productID']) && is_numeric($_GET['productID'])) {
    $productID = $_GET['productID'];

    // URL for product details page
    $productDetailsURL = "http://localhost/CCKWEB2/product-details.php?productID=" . $productID;

    // QR code file path
    $qrFilePath = 'qrcodes/product_' . $productID . '.png';

    // Generate QR code
    QRcode::png($productDetailsURL, $qrFilePath, QR_ECLEVEL_L, 6);

    // Output the generated QR code as an image
    header('Content-Type: image/png');
    readfile($qrFilePath);
} else {
    echo "Invalid or missing productID.";
}
?>


