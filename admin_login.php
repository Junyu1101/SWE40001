<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link rel="stylesheet" href="styles/style.css">
</head>
<body class="loginbody">
    <div class="login-container">
        <h2>Admin Login</h2>
        <form action="admin_login_process.php" method="POST">
            <div class="input-group">
                <label for="name">Admin Name</label>
                <input type="text" name="name" id="name" required>
            </div>
            <div class="input-group">
                <label for="pass">Password</label>
                <input type="password" name="pass" id="pass" required>
            </div>
            <button type="submit">Login</button>
        </form>
    </div>

    <a href="member_login.php">Member Login</a>
</body>
</html>
