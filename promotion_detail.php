<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>CCK - Promotion Details</title>
  <link rel="stylesheet" href="promotion/promotion/style.css">
  <link rel="stylesheet" href="styles/style.css">
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
            document.getElementById("promotion-detail").innerText = "Promotion not found";
          } else {
            document.getElementById("promotion-detail").innerHTML = `
          <div class="promotion-detail-title">
            <h2>${detail.title}</h2>
          </div>
          <div class="dates">
            <div class = "promotion-end-date">
            <p>End Date</p>
              <span >${detail.end_date}</span>
            </div>
            <div class= "promotion-expiry-date">
            <p>Expiring In</p>
              <span id="time-remaining"></span>
            </div>
          </div>
          <div class = "promotion-detail-content">
            <p style="  font-weight: bold;">
              Description
            </p>
            <p>${detail.description}</p>
          </div>
          <div class="fixed-bottom-button">
            <button class="show-code-btn" onclick="showPromotionCode('${detail.code}')">
              Show Code
            </button>
          </div>
        `;
            // Start the countdown
            startCountdown(detail.end_date);

            // Set the product name in the header
            document.getElementById("product-name").textContent = detail.name;

            // Set the product image and make it clickable
            const productImageElement = document.querySelector(".product-image img");
            productImageElement.src = `${detail.image}`;
            productImageElement.alt = detail.name;

            // Make the product image clickable
            const productLinkElement = document.getElementById("product-link");
            productLinkElement.href = `product-detail.php?id=${detail.productID}`;
          }
        });
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

    function startCountdown(endDate) {
      const end = new Date(endDate).getTime();

      function updateCountdown() {
        const now = new Date().getTime();
        const distance = end - now;

        if (distance > 0) {
          const days = Math.floor(distance / (1000 * 60 * 60 * 24));
          const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
          const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
          const seconds = Math.floor((distance % (1000 * 60)) / 1000);

          document.getElementById("time-remaining").innerText = `${days}d ${hours}h ${minutes}m ${seconds}s`;
        } else {
          document.getElementById("time-remaining").innerText = "Expired";
          clearInterval(countdownInterval); // Stop updating once expired
        }
      }

      // Update countdown every second
      const countdownInterval = setInterval(updateCountdown, 1000);
      updateCountdown(); // Initial call to display immediately
    }

    document.addEventListener("DOMContentLoaded", loadPromotionDetail);
  </script>
</head>

<body>
  <header>
    <div class="header-container">
      <div class="backicon">
        <a href="promotions.php">
          <i class="fa-sharp fa-solid fa-angle-left"></i>
        </a>
      </div>
      <div class="product-image">
        <!-- Wrap the image in an anchor for redirection -->
        <a id="product-link" href="">
          <img src="" alt="Product Image">
        </a>
      </div>
      <div></div>
      <div class="product-name">
        <!-- Dynamically load product name -->
        <span id="product-name">Sweet Corn Special</span>
      </div>
    </div>
  </header>

  <div class="promotion-detail-container">
    <div class="promotion-detail" id="promotion-detail"></div>
  </div>

  <?php include 'footer.php'; ?>
</body>

</html>