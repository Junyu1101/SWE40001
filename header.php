<?php
if (session_status() === PHP_SESSION_NONE && basename($_SERVER['PHP_SELF']) !== 'recipe_detail.php') {
    session_start();
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CCK Fresh Mart</title>
    <link rel="stylesheet" href="styles/style.css">
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

</head>
<body>
    <header>
        <div class="header-container">
            <div class="logo">
                <a href="index.php">
                    <img src="images/ccklogo.png" alt="CCK Logo">
                </a>
            </div>
            <div class="login">
            <?php if (isset($_SESSION['role']) && $_SESSION['role'] == 'member'): ?>
                <span>Welcome, <?php echo htmlspecialchars($_SESSION['user']['memberID']); ?></span>
                <a href="logout.php">Logout</a>
            <?php else: ?>
                <a href="admin_login.php">Login</a>
            <?php endif; ?>
            </div>
        </div>
        <div class="navbar-wrapper">
            <?php include 'navbar.php'; ?>
        </div>
    </header>
