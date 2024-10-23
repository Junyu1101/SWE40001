<div class="wheelBody">
    <div class="wheel-content">
        <h2 class="wheel-title">Daily Wheel</h2>
        <p class="wheel-description">Spin to win vouchers!</p>
    <div class="wheel-container">
        <div class="wheel-spinBtn">Spin</div>
            <div class="wheel">
                <div class="wheelNum" style="--i:1; --clr:#db7093;"><span>RM15</span></div>
                <div class="wheelNum" style="--i:2; --clr:#20b2aa;"><span>RM5</span></div>
                <div class="wheelNum" style="--i:3; --clr:#d63e92;"><span>Nothing</span></div>
                <div class="wheelNum" style="--i:4; --clr:#daa520;"><span>RM5</span></div>
                <div class="wheelNum" style="--i:5; --clr:#ff340f;"><span>RM10</span></div>
                <div class="wheelNum" style="--i:6; --clr:#ff7f50;"><span>RM5</span></div>
                <div class="wheelNum" style="--i:7; --clr:#3cb371;"><span>Nothing</span></div>
                <div class="wheelNum" style="--i:8; --clr:#4169e1;"><span>RM10</span></div>

            </div>
            
    </div>
    </div>

    <!-- Pop-up Modal -->
    <div class="wheel-popup" id="popup">
        <div class="wheel-popup-content">
            <h3>Congratulations!</h3>
            <p>You won a <span id="prize"></span> voucher! Click the button below to claim it!</p>
            <button class="claim-btn" onclick="closePopup()">Claim Prize</button>
        </div>
    </div>

</div>

<script>
let wheel = document.querySelector('.wheel');
let spinBtn = document.querySelector('.wheel-spinBtn');
let popup = document.getElementById('popup');
let prizeText = document.getElementById('prize');
let value = Math.ceil(Math.random() * 3600);

spinBtn.onclick = function() {
    wheel.style.transform = "rotate(" + value + "deg)";
    value += Math.ceil(Math.random() * 3600);

    // After the animation ends, show the pop-up
    setTimeout(() => {
        // Determine the prize based on the random spin
        let prize = determinePrize(); // You can write this function to determine the prize
        prizeText.textContent = prize;

        // Show the pop-up
        popup.classList.add('show');
    }, 5000); // Assuming the animation duration is 5s
}

function closePopup() {
    popup.classList.remove('show');
}

// Optional: Add your logic to determine the prize based on the spin value
function determinePrize() {
    // Example placeholder logic
    let prizes = ['15', '5', '0', '5', '10', '5', '0', '10'];
    let randomIndex = Math.floor(Math.random() * prizes.length);
    return prizes[randomIndex];
}

</script>



