<?php
session_start();
session_unset(); // Clear session variables
session_destroy();
header("Location: index.php");
exit;
?>