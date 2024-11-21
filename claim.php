<?php
include 'databaseconnection.php'; // Include your database connection file

if (!isset($_POST['memberID'], $_POST['phoneNumber'], $_POST['currentDate'], $_POST['gameID'])) {
    echo json_encode(['status' => 'false', 'message' => 'Missing memberID, phoneNumber, currentDate, or gameID.']);
    exit;
}

// Extract POST data
$memberID = $_POST['memberID'];
$phoneNumber = $_POST['phoneNumber'];
$currentDate = $_POST['currentDate'];
$gameID = $_POST['gameID'];

try {
    // Function to check if a member exists in a specific table
    function checkMemberExists($conn, $table, $memberID, $phoneNumber) {
        $stmt = $conn->prepare("SELECT * FROM $table WHERE memberID = ? AND phoneNumber = ?");
        $stmt->bind_param("ss", $memberID, $phoneNumber);
        $stmt->execute();
        return $stmt->get_result()->num_rows > 0;
    }

    // Function to add a new claim
    function addClaim($conn, $memberID, $currentDate, $gameID, $status) {
        $stmt = $conn->prepare("INSERT INTO claim (memberID, gameID, claim_date,  status) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("ssss", $memberID, $gameID, $currentDate,  $status);
        return $stmt->execute();
    }

    // Check if the member exists in the "exist_member" table
    if (!checkMemberExists($conn, 'exist_member', $memberID, $phoneNumber)) {
        echo json_encode(['status' => 'false', 'message' => 'Invalid Member ID or Phone Number.']);
        exit;
    }

    // Check if the member exists in the "user" table
    if (!checkMemberExists($conn, 'user', $memberID, $phoneNumber)) {
        // Add member to "user" table
        $stmt = $conn->prepare("INSERT INTO user (memberID, phoneNumber) VALUES (?, ?)");
        $stmt->bind_param("ss", $memberID, $phoneNumber);
        $stmt->execute();
    }

    // Check the most recent claim
    $stmt = $conn->prepare("SELECT claim_date FROM claim WHERE memberID = ? ORDER BY claim_date DESC LIMIT 1");
    $stmt->bind_param("s", $memberID);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $lastClaim = $result->fetch_assoc();
        $lastClaimDate = new DateTime($lastClaim['claim_date']);
        $currentDateObj = new DateTime($currentDate);

        // If the claim is within the same day, deny the claim
        if ($lastClaimDate->format('Y-m-d') === $currentDateObj->format('Y-m-d')) {
            echo json_encode(['status' => 'true', 'message' => 'Claim already made today.']);
            exit;
        }
    }

    // Add a new claim as successful
    if (addClaim($conn, $memberID, $currentDate, $gameID, 'successful')) {
        echo json_encode(['status' => 'true', 'message' => 'Claim successful.']);
    } else {
        echo json_encode(['status' => 'false', 'message' => 'Error adding claim.']);
    }
} catch (Exception $e) {
    echo json_encode(['status' => 'false', 'message' => 'An error occurred: ' . $e->getMessage()]);
}
