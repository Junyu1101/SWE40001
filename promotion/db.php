<?php
$host = '127.0.0.1';
$db = 'cck_websystem';
$user = 'root';
$pass = 'hanjunyu123';

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die('Connection failed: ' . $conn->connect_error);
}
?>