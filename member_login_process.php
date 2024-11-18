<?php
session_start();
include 'databaseconnection.php';
// Check if the request is a POST request
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $memberID = trim(htmlspecialchars($_POST['memberID']));
    $phoneNum = trim(htmlspecialchars($_POST['phoneNum']));

    // Validate input: Check if either field is empty
    if (empty($memberID) || empty($phoneNum)) {
        echo "Both fields are required.";
        exit;
    }

    // Prepare the SQL statement to prevent SQL injection
    $stmt = $conn->prepare("SELECT * FROM exist_member WHERE memberID = ? AND phoneNum = ?");
    $stmt->bind_param("ss", $memberID, $phoneNum);
    
    // Execute the query
    $stmt->execute();
    
    // Get the result
    $result = $stmt->get_result();

    // Check if a matching row was found
    if ($result->num_rows > 0) {
        $_SESSION['user'] = $result->fetch_assoc();
        $_SESSION['role'] = 'member';
        // Success: Redirect to admin dashboard
        header('Location: index.php');
        exit;
    } else {
        // Failed: Show an error message
        echo "Invalid member credentials.";
    }

    // Close the statement and connection
    $stmt->close();
    $conn->close();
}
?>

