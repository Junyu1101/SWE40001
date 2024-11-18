<?php

include "role_admin_check.php";
include 'databaseconnection.php'; // Database connection file

$searchQuery = isset($_GET['query']) ? $_GET['query'] : '';

$query = "SELECT * FROM user WHERE memberID LIKE '%$searchQuery%' OR phoneNumber LIKE '%$searchQuery%'";

$result = mysqli_query($conn, $query);

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
