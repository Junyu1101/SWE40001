<?php

include "role_admin_check.php";

include 'databaseconnection.php'; // Database connection file

$query = "SELECT * FROM user";
$result = mysqli_query($conn, $query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management</title>
    <link rel="stylesheet" href="styles/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* User Management Styles */
        .user-container {
            width: 80%;
            max-width: 1000px;
            margin: 30px auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .user-title {
            text-align: center;
            color: rgb(236, 034, 043);
            margin-bottom: 20px;
            font-size: 24px;
        }

        .user-search {
            margin-bottom: 20px;
            display: flex;
            justify-content: center;
        }

        .user-search input {
            width: 70%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            margin-right: 10px;
        }

        .user-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        .user-table th, .user-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .user-table th {
            background-color: rgb(254, 193, 016);
            color: #fff;
        }

        .user-table tr:hover {
            background-color: #f1f1f1;
        }
    </style>
    <script>
        // Function for real-time search
        function searchUsers() {
            let searchQuery = document.getElementById("userSearch").value;

            // Create an XMLHttpRequest object
            let xhr = new XMLHttpRequest();

            // Configure it: GET-request for the URL /search_user.php
            xhr.open("GET", "user_search.php?query=" + encodeURIComponent(searchQuery), true);

            // Send the request over the network
            xhr.send();

            // Callback function when the request completes
            xhr.onload = function () {
                if (xhr.status === 200) {
                    // Update the table body with the response
                    document.getElementById("userTableBody").innerHTML = xhr.responseText;
                }
            };
        }
    </script>
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
            <?php include 'admin_navbar.php'; ?>
        </div>
    </header>

<div class="user-container">
    <h2 class="user-title">User Management</h2>

    <!-- Search Input -->
    <div class="user-search">
        <input type="text" id="userSearch" onkeyup="searchUsers()" placeholder="Search by Member ID or Phone Number">
    </div>

    <!-- User Table -->
    <table class="user-table">
        <thead>
            <tr>
                <th>Member ID</th>
                <th>Phone Number</th>
            </tr>
        </thead>
        <tbody id="userTableBody">
            <!-- User rows will be displayed here by the AJAX call -->
             <?php
                // Generate HTML rows for the table based on the query result
                if (mysqli_num_rows($result) > 0) {
                    while ($row = mysqli_fetch_assoc($result)) {
                        echo "<tr>
                                <td>" . htmlspecialchars($row['memberID']) . "</td>
                                <td>" . htmlspecialchars($row['phoneNumber']) . "</td>
                            </tr>";
                    }
                } else {
                    echo "<tr><td colspan='3' style='text-align: center;'>No users found</td></tr>";
                }
             ?>
        </tbody>
    </table>
</div>

<?php include 'footer.php';?>
