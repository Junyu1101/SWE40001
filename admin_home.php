<!-- admin_home.php -->
<?php
include "role_admin_check.php";
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

    <style>
        .admin-link {
            text-decoration: none; /* Remove underline */
            color: inherit; /* Inherit text color from parent */
        }

        .admin-box {
            cursor: pointer; /* Show pointer cursor when hovering over the box */
            transition: transform 0.2s ease-in-out;
        }

        .admin-box:hover {
            transform: scale(1.05); /* Slight zoom effect on hover */
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
                <a href="logout.php">Logout</a>
            </div>
        </div>
        <div class="navbar-wrapper">
            <?php include 'admin_navbar.php'; ?>
        </div>
    </header>

    <div class="admin-container">
    <h1>Welcome, Admin!</h1>
    <div class="admin-sections">
        <a href="admin_product.php" class="admin-link">
            <div class="admin-box">
                <h2>Manage Products</h2>
                <p>View and update product information.</p>
            </div>
        </a>
        <a href="admin_users.php" class="admin-link">
            <div class="admin-box">
                <h2>View Users</h2>
                <p>Monitor registered users and their activity.</p>
            </div>
        </a>
        <a href="admin_promotion.php" class="admin-link">
            <div class="admin-box">
                <h2>Manage Promotions</h2>
                <p>Update or create new promotional offers.</p>
            </div>
        </a>
        <a href="admin_recipe.php" class="admin-link">
            <div class="admin-box">
                <h2>Manage Recipes</h2>
                <p>View or update recipes.</p>
            </div>
        </a>
        <a href="admin_game.php" class="admin-link">
            <div class="admin-box">
                <h2>Manage Games</h2>
                <p>Add or remove games.</p>
            </div>
        </a>
    </div>
</div>


<br>
<br>


<?php include 'footer.php'; ?>
