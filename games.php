<?php include 'header.php'; ?>

<div class="game-container">
        <h1>Available Games</h1>
        <div class="game-list">
            <!-- Example Game Cards -->
            <div class="game-card">
                <img src="images/match3-banner.png" alt="Game 1 Thumbnail">
                <h3>Match 3</h3>
                <p>A game where you swap tiles to match and score! Earn at least 300 points to get a reward!</p>
                <button onclick="playGame('game1')">Play Now</button>
            </div>

            <div class="game-card">
                <img src="path/to/game2-thumbnail.jpg" alt="Game 2 Thumbnail">
                <h3>Game 2</h3>
                <p>A brief description of Game 2.</p>
                <button onclick="playGame('game2')">Play Now</button>
            </div>
            <!-- More game cards can be added here manually or through an API -->
        </div>

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

<!-- Pop-up Modal for Prize Claim -->
<div class="wheel-popup" id="popup">
    <div class="wheel-popup-content">
        <p><span id="prize"></span></p>
        <span id="memberPopup">
            <p>Please enter your Member ID and Phone Number to claim your prize:</p>
            <p><input type="text" id="memberID" placeholder="Member ID" required></p>
            <p><input type="text" id="phoneNumber" placeholder="Phone Number" required></p>
        </span>
        <button class="claim-btn" onclick="handleClaim()"><span id="prizebutton">Claim Prize</span></button>
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

    <!-- <script>
    function playGame(gameId) {
        const gameUrls = {
            'game1': '../match3-gamever3/index.html',
            'game2': 'https://cdn-factory.marketjs.com/en/some-other-game-url/index.html'
        };

        if (gameUrls[gameId]) {
            window.open(gameUrls[gameId], '_blank');
        } else {
            alert("Game not found.");
        }
    }
    </script> -->

    <script>

    let progressInterval;
    // Function to open the game in a modal
    function playGame(gameId) {
        const gameUrls = {
            'game1': '../match3-gamever4/index.html',
            'game2': 'https://cdn-factory.marketjs.com/en/some-other-game-url/index.html'
        };

        if (gameUrls[gameId]) {
            document.getElementById('gameFrame').src = gameUrls[gameId];
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
                    showPrizeModal();
                    window.removeEventListener('message', gameScoreListener); // Stop listening for game score updates
                }
            }
        };

        window.addEventListener('message', gameScoreListener);
    }

    // Function to show the modal popup
    function showPrizeModal() {
        // Show the modal and set the prize text
        document.getElementById('popup').classList.add('show');
        document.getElementById('prize').textContent = 'Congratulations! You\'ve earned the reward!';
        document.getElementById('prizebutton').textContent = 'Claim Prize';

        // You can adjust this logic to set any prize or additional info
        document.getElementById('memberPopup').classList.add('show');
    }

    function handleClaim() {
        if (!claimed){
            let memberID = document.getElementById('memberID').value;
            let phoneNumber = document.getElementById('phoneNumber').value;

            if (!memberID || !phoneNumber) {
                alert('Please fill in both Member ID and Phone Number.');
                return;
            }

            // Send AJAX request to check if the member exists
            let xhr = new XMLHttpRequest();
            xhr.open("POST", "check_member.php", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    let response = JSON.parse(xhr.responseText);

                    if (response.status === 'true') {
                        // If member is found, allow claiming
                        document.getElementById('prize').textContent = `Here is your voucher code: ${generateVoucherCode()}`;
                        console.log(response.message);
                        document.getElementById('prizebutton').textContent = "Close";
                        document.getElementById('memberPopup').classList.remove('show');
                        claimed = true;
                    } else if (response.message === 'Member exists, but already in user table.') {
                        document.getElementById('prize').textContent = "You have already claimed the reward.";
                        document.getElementById('prizebutton').textContent = "Close";
                        claimed = true;
                    } else {
                        // If member does not exist
                        document.getElementById('prize').textContent = "Invalid Member ID or Phone Number.";
                        document.getElementById('prizebutton').textContent = "Claim Prize";
                        claimed = false;
                    }
                }
            };
            xhr.send("memberID=" + encodeURIComponent(memberID) + "&phoneNumber=" + encodeURIComponent(phoneNumber));
        }else{
            closePopup();
        }
        
    }

    function closePopup() {
        popup.classList.remove('show');
    }

    function generateVoucherCode() {
        return 'VOUCHER-' + Math.floor(1000 + Math.random() * 9000);
    }
    </script>

<?php include 'footer.php'; ?>