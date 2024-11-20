<?php
include 'databaseconnection.php'; // Include your database connection file

// Check if the memberID and phoneNumber are set in the POST request
if (isset($_POST['memberID']) && isset($_POST['phoneNumber'])) {
    $memberID = $_POST['memberID'];
    $phoneNumber = $_POST['phoneNumber'];
    
    // Query to check if the member exists in the "exist_member" table
    $stmt = $conn->prepare("SELECT * FROM exist_member WHERE memberID = ? AND phoneNum = ?");
    $stmt->bind_param("ss", $memberID, $phoneNumber);
    $stmt->execute();
    $result = $stmt->get_result();

    // If the member exists
    if ($result->num_rows > 0) {
        // Check if the member already exists in the "user" table
        $checkUserStmt = $conn->prepare("SELECT * FROM user WHERE memberID = ? AND phoneNumber = ?");
        $checkUserStmt->bind_param("ss", $memberID, $phoneNumber);
        $checkUserStmt->execute();
        $checkResult = $checkUserStmt->get_result();

        // If the member does not exist in "user" table, insert them
        if ($checkResult->num_rows == 0) {
            // Insert into "user" table, excluding the spinId (auto-generated)
            $insertStmt = $conn->prepare("INSERT INTO user (memberID, phoneNumber) VALUES (?, ?)");
            $insertStmt->bind_param("ss", $memberID, $phoneNumber);
            $insertStmt->execute();

            echo json_encode(['status' => 'true', 'message' => 'Member found and added to user table.']); // Successfully added to 'user' table
        } else {
            echo json_encode(['status' => 'false', 'message' => 'Member exists, but already in user table.']); // Already exists in 'user' table
        }
    } else {
        echo json_encode(['status' => 'false', 'message' => 'Invalid Member ID or Phone Number.']); // Member not found in 'exist_member'
    }
} else {
    // Return error if memberID or phoneNumber is missing
    echo json_encode(['status' => 'false', 'message' => 'Missing memberID or phoneNumber.']); // Missing data
}