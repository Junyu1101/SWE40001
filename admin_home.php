<!-- admin_home.php -->
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
                <img src="images/ccklogo.png" alt="CCK Logo">
            </div>
            <div class="login">
                <a href="index.php">Logout</a>
            </div>
        </div>
        <div class="navbar-wrapper">
            <?php include 'navbar.php'; ?>
        </div>
    </header>

<div class="admin-container">
    <h1>Welcome, Admin!</h1>
    <div class="admin-sections">
        <div class="admin-box">
            <h2>Manage Products</h2>
            <p>View and update product information.</p>
        </div>
        <div class="admin-box">
            <h2>View Users</h2>
            <p>Monitor registered users and their activity.</p>
        </div>
        <div class="admin-box">
            <h2>Manage Promotions</h2>
            <p>Update or create new promotional offers.</p>
        </div>
        <div class="admin-box">
            <h2>Manage Recipes</h2>
            <p>View or update recipes.</p>
        </div>
        <div class="admin-box">
            <h2>Manage Games</h2>
            <p>Add or remove games.</p>
        </div>
    </div>
</div>

<br>
<br>


<?php include 'footer.php'; ?>
