<?php
include 'databaseconnection.php';
function getRewards($conn) {
    $sql = "SELECT * FROM daily_wheel";
    $result = $conn->query($sql);
    
    $rewards = [];
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $rewards[] = $row;
        }
    }
    return $rewards;
}

$rewards = getRewards($conn); // Fetch rewards
$numRewards = count($rewards);
?>

<div class="wheelBody">
    <div class="wheel-content">
        <h2 class="wheel-title">Daily Wheel</h2>
        <p class="wheel-description">Spin to win vouchers!</p>
    <div class="wheel-container">
        <div class="wheel-spinBtn">Spin</div>
            <div class="wheel">
                <?php

                    // Loop through each reward and generate the segment
                    foreach ($rewards as $index => $reward) {
                        // Get color, name, or value if available, else set defaults
                        $color = !empty($reward['color']) ? htmlspecialchars($reward['color']) : '#ffffff';
                        $value = htmlspecialchars($reward['reward_value']);
                        
                        
                        echo "<div class='wheelNum' id='segment-$index' style='--i:$index; --clr:$color;'>";
                        echo "<span>$value</span>";
                        echo "</div>";
                    }
                ?>

            </div>
            
    </div>
    </div>



</div>

<!-- Pop-up Modal -->
<div class="wheel-popup" id="popup">
        <div class="wheel-popup-content">
            <p><span id="prize"></span></p>
            <span id="memberPopup">
                <p>Please enter your Member ID and Phone Number to claim your prize:</p>
                <p><input type="text" id="memberID" placeholder="Member ID" required></p>
                <p><input type="text" id="phoneNumber" placeholder="Phone Number" required></p>

                <a href="https://www.cckfm.com.my/V2/Login/Index/?rt=https%3A%2F%2Fwww.cckfm.com.my%2F&unLoginId=1a3901c0-ba0f-4fb8-b4e7-924205b8a856&reason=notlogin&officialShopId=200073&authRedirectType=Default#/"><p>Not a member? Register now!</p></a>

            </span>
            <button class="claim-btn" onclick="handleWheelClaim()"><span id="prizebutton">Claim Prize</span></button>
        </div>
</div>

<script>
let wheel = document.querySelector('.wheel');
let spinBtn = document.querySelector('.wheel-spinBtn');
let popup = document.getElementById('popup');
let memberPopup = document.getElementById('memberPopup');
let prizeText = document.getElementById('prize');
let buttonText = document.getElementById('prizebutton');
let claimed = false;
let currentPrize = null;




spinBtn.onclick = function() {
    claimed = false;
    let rotationAngle = Math.floor(Math.random() * 3600) + 360;
    wheel.style.transform = "rotate(" + rotationAngle + "deg)";

    setTimeout(() => {
        const finalAngle = rotationAngle % 360;
        const segmentAngle = 360 / <?php echo $numRewards; ?>;

        const adjustedAngle = (finalAngle + (segmentAngle / 2)) % 360;
        const winningSegment = Math.floor(finalAngle / segmentAngle);
        const prize = document.querySelector(`#segment-${winningSegment} span`).textContent;
        //const prize = "Nothing";

        currentPrize = prize;
        

        if (currentPrize === "Nothing") {   
            prizeText.textContent = "You got Nothing. Better luck next time!";
            buttonText.textContent = "Close";
            popup.classList.add('show');
        } else {
            prizeText.textContent = `You won a ${prize} voucher! Click the button below to claim it!`;
            buttonText.textContent = "Claim";
            popup.classList.add('show');
            memberPopup.classList.add('show');
        }

        
    }, 5000);
};

function handleWheelClaim() {
    if (!claimed) {
        if (currentPrize === "Nothing") {
            closeWheelPopup();
            memberPopup.classList.remove('show');
        } else {

            let memberID = document.getElementById('memberID').value;
            let phoneNumber = document.getElementById('phoneNumber').value;

            if (!memberID || !phoneNumber) {
                alert('Please fill in both Member ID and Phone Number.');
                return;
            }else{
                // Send AJAX request to check if the member exists
                let xhr = new XMLHttpRequest();
                xhr.open("POST", "check_member.php", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        let response = JSON.parse(xhr.responseText);

                        if (response.status === 'true') {
                            // If member is found, allow claiming
                            prizeText.textContent = `Here is your voucher code: ${generateVoucherCode()}`;
                            console.log(response.message);
                            buttonText.textContent = "Close";
                            memberPopup.classList.remove('show');
                            claimed = true;
                        } else if (response.message === 'Member exists, but already in user table.'){
                            prizeText.textContent = "You have already claimed the reward.";
                            buttonText.textContent = "Close";
                            memberPopup.classList.remove('show');
                            claimed = true;
                        }else{
                            // If member does not exist
                            prizeText.textContent = "Invalid Member ID or Phone Number.";
                            buttonText.textContent = "Claim";
                            claimed = false;
                        }
                    }
                };
                xhr.send("memberID=" + encodeURIComponent(memberID) + "&phoneNumber=" + encodeURIComponent(phoneNumber));
            }
        }
    } else {
        closeWheelPopup();
    }
}

function closeWheelPopup() {
    popup.classList.remove('show');
    // Clear the input fields
    document.getElementById('memberID').value = "";
    document.getElementById('phoneNumber').value = "";
}

function generateVoucherCode() {
    return 'VOUCHER-' + Math.floor(1000 + Math.random() * 9000);
}

</script>




