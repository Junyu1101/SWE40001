<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>CCK - Promotions</title>
  <link rel="stylesheet" href="promotion/promotion/style.css">
  <!-- Font Awesome CDN -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <script>
    function loadPromotions() {
      fetch("fetch_promotions.php")
        .then((response) => response.json())
        .then((promotions) => {
          const list = document.getElementById("promotions-list");
          promotions.forEach((promotion) => {
            const item = document.createElement("div");
            item.className = "promotion-item";
            item.innerText = promotion.title;
            item.onclick = () => {
              window.location.href = `promotion_detail.php?id=${promotion.promotionID}`;
            };
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
      <div class="backicon">
        <a href="index.php">
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
  <div class="promotions-list" id="promotions-list"></div>

  <?php include 'footer.php'; ?>
</body>

</html>