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

        <!-- Sign-up Link -->
        <p>Not a member? <a href="https://www.cckfm.com.my/V2/Login/Index/?rt=https%3A%2F%2Fwww.cckfm.com.my%2F&unLoginId=1a3901c0-ba0f-4fb8-b4e7-924205b8a856&reason=notlogin&officialShopId=200073&authRedirectType=Default#/">Sign up now!</a></p>
    </div>

    <a href="admin_login.php">Admin Login</a>
</body>
</html>
