<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Member Login</title>
    <link rel="stylesheet" href="styles/style.css">
</head>
<body class="loginbody">
    <div class="login-container">
        <h2>Member Login</h2>
        <form action="member_login_process.php" method="POST">
            <div class="input-group">
                <label for="memberID">Member ID</label>
                <input type="text" name="memberID" id="memberID" required>
            </div>
            <div class="input-group">
                <label for="phoneNum">Phone Number</label>
                <input type="tel" name="phoneNum" id="phoneNum" required>
            </div>
            <button type="submit">Login</button>
        </form>
    </div>

    <a href="admin_login.php">Admin Login</a>
</body>
</html>
