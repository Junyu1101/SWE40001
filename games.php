<?php include 'header.php'; ?>

<div class="game-container">
        <h1>Available Games</h1>
        <div class="game-list">
            <!-- Example Game Cards -->
            <div class="game-card">
                <img src="path/to/game1-thumbnail.jpg" alt="Game 1 Thumbnail">
                <h3>Game 1</h3>
                <p>A brief description of Game 1.</p>
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

<?php include 'footer.php'; ?>