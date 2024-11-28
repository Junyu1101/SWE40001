<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>CCK - Promotions</title>
  <link rel="stylesheet" href="promotion/promotion/style.css">
  <link rel="stylesheet" href="styles/style.css">
  <!-- Font Awesome CDN -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <style>
  </style>
  <script>
    function loadPromotions() {
      fetch("fetch_promotions.php")
        .then((response) => response.json())
        .then((promotions) => {
          const list = document.getElementById("promotions-list");
          promotions.forEach((promotion) => {
            const item = document.createElement("div");
            item.className = "promotion-item";

            images = JSON.parse(promotion.image); // Replace `row.image` with your actual data source
            firstImage = (images && images.length > 0) ? images[0] : 'images/placeholder.jpg';

            // Create image element
            const img = document.createElement("img");
            img.src = firstImage; // Assuming the image URL is stored in the 'image' field from your database
            img.alt = promotion.name;  // Alternative text for the image
            img.className = "promotion-image";

            // Create text element
            const text = document.createElement("div");
            text.className = "promotion-text";
            text.innerText = promotion.title; // Display the promotion title

            // Append the image and text to the item
            item.appendChild(img);
            item.appendChild(text);

            // Add onclick functionality
            item.onclick = () => {
              window.location.href = `promotion_detail.php?id=${promotion.promotionID}`;
            };

            // Append the item to the promotions list
            list.appendChild(item);
          });
        });
    }

    document.addEventListener("DOMContentLoaded", loadPromotions);
  </script>

</head>

<body>
<header>
        <div class="header-container">
            <div class="login">
                <a href="admin_login.php">Login</a>
            </div>
        </div>
        <div class="navbar-wrapper">
            <?php include 'navbar.php'; ?>
        </div>
    </header>
  <div class="promotions-list" id="promotions-list"></div>

  <script src="scripts/navbar-script.js"></script>
  <?php include 'footer.php'; ?>
