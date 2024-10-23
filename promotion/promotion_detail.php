<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>CCK - Promotion Details</title>
  <link rel="stylesheet" href="styles/style.css">
  <link rel="stylesheet" href="promotion/style.css">
  <!-- Font Awesome CDN -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <script>
    function loadPromotionDetail() {
      const params = new URLSearchParams(window.location.search);
      const id = params.get("id");

      fetch(`fetch_promotion_detail.php?id=${id}`)
        .then((response) => response.json())
        .then((detail) => {
          if (detail.error) {
            document.getElementById("promotion-detail").innerText =
              "Promotion not found";
          } else {
            document.getElementById("promotion-detail").innerHTML = `
              <h2>${detail.title}</h2>
              <p>${detail.description}</p>
              <div class="dates">
                <span>Start Date: ${detail.start_date}</span>
                <span>End Date: ${detail.end_date}</span>
              </div>
              <div class="productname">
                <p>
                  <a href="product.php?id=${detail.productID}">${detail.name}</a>
                </p>
              </div>
              <button class="show-code-btn" onclick="showPromotionCode('${detail.code}')">
                Show Code
              </button>
            `;
          }
        })
    }

    function showPromotionCode(code) {
      // Create the overlay
      const overlay = document.createElement('div');
      overlay.classList.add('overlay');
      document.body.appendChild(overlay);

      // Create the popup
      const codePopup = document.createElement('div');
      codePopup.classList.add('code-popup');
      codePopup.innerHTML = `
    <div class="popup-content">
      <h3>Promotion Code</h3>
      <p id="promo-code">${code}</p>
      <button onclick="copyCode()">Copy Code</button>
      <button onclick="closePopup()">Close</button>
    </div>
    `;
      document.body.appendChild(codePopup);
    }

    function copyCode() {
      const code = document.getElementById('promo-code').innerText;
      navigator.clipboard.writeText(code).then(() => {
        alert('Code copied to clipboard!');
      }).catch(err => console.error('Error copying text:', err));
    }

    function closePopup() {
      const popup = document.querySelector('.code-popup');
      const overlay = document.querySelector('.overlay');

      // Remove the popup and the overlay
      if (popup) popup.remove();
      if (overlay) overlay.remove();
    }

    document.addEventListener("DOMContentLoaded", loadPromotionDetail);
  </script>
</head>

<body>
  <header>
    <div class="header-container">
      <div class="backicon">
        <a href="promotion.php">
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

  <div class="promotion-detail" id="promotion-detail"></div>

  <?php include 'footer.php'; ?>
</body>

</html>