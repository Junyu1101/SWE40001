<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $_POST['name'];
    $pass = $_POST['pass'];

    // Basic validation for the hardcoded admin credentials
    if ($name === 'admin' && $pass === '123') {
        // Success: Redirect to admin dashboard
        header('Location: admin_home.php');
        exit;
    } else {
        // Failed: Show an error message
        echo "Invalid admin credentials.";
    }
}
?>
