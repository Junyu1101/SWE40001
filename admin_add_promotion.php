<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Promotion</title>
    <link rel="stylesheet" href="styles/style.css">
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

</head>
<style>
    /* Style for the form container */
    form {
        max-width: 600px;
        margin: 40px auto;
        padding: 40px;
        background-color: #f9f9f9;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    /* Form headings */
    h2 {
        text-align: center;
        font-size: 24px;
        color: #333;
    }

    /* Label styling */
    label {
        display: block;
        margin-bottom: 8px;
        font-size: 16px;
        color: #555;
    }

    /* Input field styling */
    input[type="text"],
    input[type="date"],
    textarea,
    select {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 14px;
    }

    /* Textarea styling */
    textarea {
        resize: vertical;
        height: 100px;
    }

    /* Button styling */
    input[type="submit"] {
        width: 100%;
        padding: 12px;
        font-size: 16px;
        color: white;
        background-color: #3498db;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    input[type="submit"]:hover {
        background-color: #2980b9;
    }

    .backicon {
        margin-right: 10px;
    }

    .backicon a {
        text-decoration: none;
        /* Remove underline from the link */
        color: black;
        /* make the icon black color */
    }

    .backicon i {
        font-size: 2.5rem;
        /* make the icon bigger */
    }

    /* Responsive adjustments */
    @media (max-width: 600px) {
        form {
            padding: 15px;
            margin: 20px;
        }
    }
</style>

<body>
    <header>
        <div class="header-container">
            <div class="backicon">
                <a href="admin_promotion.php">
                    <i class="fa-sharp fa-solid fa-angle-left"></i>
                </a>
            </div>
            <div class="logo">
                <img src="images/ccklogo.png" alt="CCK Logo">
            </div>
            <div class="login">
                <a href="login.php">Login</a>
            </div>
        </div>
    </header>

    <h2>Add New Promotion</h2>
    <form action="insert_promotion.php" method="POST">
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" required><br><br>

        <label for="description">Description:</label>
        <textarea id="description" name="description" required></textarea><br><br>

        <label for="start_date">Start Date:</label>
        <input type="date" id="start_date" name="start_date" required><br><br>

        <label for="end_date">End Date:</label>
        <input type="date" id="end_date" name="end_date" required><br><br>

        <label for="code">Promo Code:</label>
        <input type="text" id="code" name="code" required><br><br>

        <label for="productID">Select Product:</label>
        <select id="productID" name="productID" required>
            <?php
            include 'databaseconnection.php';
            $result = $conn->query("SELECT productID, name FROM product");
            while ($row = $result->fetch_assoc()) {
                echo "<option value='" . $row['productID'] . "'>" . $row['name'] . "</option>";
            }
            $conn->close();
            ?>
        </select><br><br>

        <input type="submit" value="Add Promotion">
    </form>
    <?php include 'footer.php'; ?>
</body>

</html>