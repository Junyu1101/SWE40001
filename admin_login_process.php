<?php
session_start();
include 'databaseconnection.php';
// Check if the request is a POST request
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = trim(htmlspecialchars($_POST['name']));
    $pass = trim(htmlspecialchars($_POST['pass']));

    // Validate input: Check if either field is empty
    if (empty($name) || empty($pass)) {
        echo "Both fields are required.";
        exit;
    }

    // Prepare the SQL statement to prevent SQL injection
    $stmt = $conn->prepare("SELECT * FROM admin WHERE name = ? AND pass = ?");
    $stmt->bind_param("ss", $name, $pass);
    
    // Execute the query
    $stmt->execute();
    
    // Get the result
    $result = $stmt->get_result();

    // Check if a matching row was found
    if ($result->num_rows > 0) {
        $_SESSION['user'] = $result->fetch_assoc();
        $_SESSION['role'] = 'admin';
        // Success: Redirect to admin dashboard
        header('Location: admin_home.php');
        exit;
    } else {
        // Failed: Show an error message
        echo "Invalid admin credentials.";
    }

    // Close the statement and connection
    $stmt->close();
    $conn->close();
}
?>
