<?php 

include 'databaseconnection.php';

$sql = "SELECT * FROM game";
$result = $conn->query($sql);


include 'header.php'; ?>

<br>
<br>


<div class="game-container">
        <?php
        if ($result->num_rows > 0) {
            echo "<div class='game-list'>";
            while ($row = $result->fetch_assoc()) {
                echo "<div class='game-card'>";

                // Decode image JSON to array
                $imageArray = json_decode($row['image'], true);
                foreach ($imageArray as $image_path) {
                    echo "<img src='" . htmlspecialchars($image_path) . "' alt='" . htmlspecialchars($row['title']) . "'>";
                }
                echo "<h3>" . htmlspecialchars($row['title']) . "</h3>";
                echo "<p>" . htmlspecialchars($row['description']) . "</p>";
                echo "<button onclick=\"playGame('" . htmlspecialchars($row['gameLink']) . "')\">Play Now</button>";

                
                echo "</div>"; // End of slides
            }
            echo "</div>"; //End game-list
        } else {
            echo "<p>No games available.</p>";
        }
    ?>
    <br>

        <?php include 'dailywheel.php'; ?>



    </div>

    <!-- Fullscreen Game Modal -->
<div id="gameModal" class="modal">
    <div class="modal-content">
        <button class="close-btn" onclick="closeGame()">Close</button>
        <iframe id="gameFrame" src="" frameborder="0"></iframe>
        <div class="progress-container">
            <p>Game Progress:</p>
            <progress id="gameProgress" max="300" value="0"></progress>
            <span id="progressText">0 / 300</span>
        </div>
    </div>
</div>

<!-- Prize Pop-up Modal -->
<div id="gamePopup" class="game-popup">
    <div class="game-popup-content">
        <div id="gamePrizeSection">
            <p>You won </p>
            <span id="gamePrizeMessage" class="game-prize-message"></span>
            <div class="game-popup-buttons">
                <button class="game-popup-retry" onclick="location.reload()">Retry</button>
                <button class="game-popup-claim" onclick="gameShowClaimForm()">Claim</button>
            </div>
        </div>

        
        <div id="gameClaimSection" class="game-claim-section">
            <p id="submit-result"></p>
            <div id="gameMemberInput" class="game-member-input">
            <p>Enter your Member ID and Phone Number to claim your prize:</p>
            <input type="text" id="gameMemberID" placeholder="Member ID" required>
            <input type="text" id="gamePhoneNumber" placeholder="Phone Number" required>
            <a href="https://www.cckfm.com.my/V2/Login/Index/?rt=https%3A%2F%2Fwww.cckfm.com.my%2F&unLoginId=1a3901c0-ba0f-4fb8-b4e7-924205b8a856&reason=notlogin&officialShopId=200073&authRedirectType=Default#/"><p>Not a member? Register now!</p></a>
            </div>
            <button onclick="gameHandleClaim()" id="game-submit-btn">Submit</button>
        </div>
    </div>
</div>

<style>
    /* Modal styling */
    .modal {
        display: none; /* Hidden by default */
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.8);
        z-index: 15;
        overflow: hidden;
    }

    .modal-content {
        position: relative;
        width: 90%;
        height: 90%;
        margin: 5% auto;
        background-color: white;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .close-btn {
        position: absolute;
        top: 10px;
        right: 10px;
        background-color: #f44336;
        color: white;
        border: none;
        padding: 5px 10px;
        cursor: pointer;
        font-size: 16px;
    }

    #gameFrame {
        width: 100%;
        height: 80%;
        border: none;
    }

    .progress-container {
        margin-top: 15px;
        text-align: center;
    }

    #gameProgress {
        width: 100%;
        height: 20px;
    }

    
</style>

    <script>
    const gamePopup = document.getElementById('gamePopup');
    const gamePrizeSection = document.getElementById('gamePrizeSection');
    const gameClaimSection = document.getElementById('gameClaimSection');
    const gameMemberInput = document.getElementById('gameMemberInput');
    const gamePrizeMessage = document.getElementById('gamePrizeMessage');
    const submitBtn = document.getElementById('game-submit-btn');
    const resultText = document.getElementById('submit-result');

    // Array of rewards
    const rewards = [
        "10% discount on your next purchase!",
        "Buy 1 Get 1 Free offer!",
        "RM10 off on orders above RM50!",
        "Exclusive 15% discount on selected items!"
    ];

    // Select a random reward from the list
    const randomReward = rewards[Math.floor(Math.random() * rewards.length)];

    let progressInterval;
    // Function to open the game in a modal
    function playGame(gameURL) {
        if (gameURL) {
            document.getElementById('gameFrame').src = gameURL;
            document.getElementById('gameModal').style.display = 'block';
            trackGameProgress();
        } else {
            alert("Game not found.");
        }
    }

    // Function to close the modal
    function closeGame() {
        document.getElementById('gameModal').style.display = 'none';
        document.getElementById('gameFrame').src = ''; // Reset iframe src
        

        if (progressInterval) {
            clearInterval(progressInterval); // Stop tracking progress when game closes
            progressInterval = null; // Reset interval ID
        }
    }

    // Function to update game progress
    function trackGameProgress() {
        const gameScoreListener =  function(event) {
            // Make sure the event is coming from the game window
            // You can restrict it to your game window URL by checking event.origin

            if (event.data.gameScore !== undefined) {
                const gameScore = event.data.gameScore;
                console.log("Received game score from game:", gameScore);
                
                // Update the progress bar or any other elements
                document.getElementById('gameProgress').value = gameScore;
                document.getElementById('progressText').textContent = `${gameScore} / 300`;

                if (gameScore >= 300) {
                    gameShowPrizePopup();
                    window.removeEventListener('message', gameScoreListener); // Stop listening for game score updates
                }
            }
        };

        window.addEventListener('message', gameScoreListener);
    }

    // Show the prize popup
    function gameShowPrizePopup() {
        gamePopup.style.display = 'flex';
        gamePrizeSection.style.display = 'block';
        gameClaimSection.style.display = 'none';
        gameMemberInput.style.display = 'block';
        gamePrizeMessage.textContent = `${randomReward}`;
    }

    // Show the claim form
    function gameShowClaimForm() {
        gamePrizeSection.style.display = 'none';
        gameClaimSection.style.display = 'block';
    }

    function gameHandleClaim() {
        if (!claimed){
            let memberID = document.getElementById('gameMemberID').value;
            let phoneNumber = document.getElementById('gamePhoneNumber').value;
            let currentDate = new Date().toISOString().slice(0, 10); // Get the current date in YYYY-MM-DD format
            let gameID = ''; // Replace with the actual game ID logic, if necessary

            if (!memberID || !phoneNumber) {
                alert('Please fill in both Member ID and Phone Number.');
                return;
            }

            // Send AJAX request to check if the member exists
            let xhr = new XMLHttpRequest();
                xhr.open("POST", "claim.php", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        let response = JSON.parse(xhr.responseText);

                        if (response.status === 'true') {
                            // If member is found and the claim is successful
                            switch (response.message) {
                                case 'Claim successful.':
                                    resultText.textContent = `Here is your voucher code: ${generateVoucherCode()}`;
                                    console.log(response.message);
                                    submitBtn.textContent = "Close";
                                    gameMemberInput.style.display = 'none';
                                    claimed = true;
                                    break;

                                case 'Claim already made today.':
                                    resultText.textContent = "You have already claimed the reward today.";
                                    console.log(response.message);
                                    submitBtn.textContent = "Close";
                                    gameMemberInput.style.display = 'none';
                                    claimed = true;
                                    break;

                                default:
                                    // Handle unexpected success message
                                    resultText.textContent = "Unexpected response. Please try again.";
                                    console.log(response.message);
                                    submitBtn.textContent = "Retry";
                                    claimed = false;
                                    break;
                            }

                        } else {
                            // If member does not exist or claim fails
                            resultText.textContent = "Invalid Member ID or Phone Number.";
                            console.log(response.message);
                            submitBtn.textContent = "Claim";
                            claimed = false;
                        }
                    }
                };
                xhr.send("memberID=" + encodeURIComponent(memberID) + 
                        "&phoneNumber=" + encodeURIComponent(phoneNumber) + 
                        "&currentDate=" + encodeURIComponent(currentDate) +
                        "&gameID=" + encodeURIComponent(gameID));
        }else{
            closePopup();
        }
        
    }

    function closePopup() {
        gamePopup.style.display = 'none';
        // Clear the input fields
        document.getElementById('gameMemberID').value = "";
        document.getElementById('gamePhoneNumber').value = "";

    }

    function generateVoucherCode() {
        return 'VOUCHER-' + Math.floor(1000 + Math.random() * 9000);
    }
    </script>

<?php include 'footer.php'; ?>