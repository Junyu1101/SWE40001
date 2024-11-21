const staticIcon = document.getElementById('static-icon');
const homePopup = document.getElementById('home-popup');
const closeBtn = document.querySelector('.close-btn');

// Show pop-up when the icon is clicked
staticIcon.addEventListener('click', () => {
    homePopup.style.display = 'flex';
});

// Close pop-up when clicking the close button
closeBtn.addEventListener('click', () => {
    homePopup.style.display = 'none';
});

// Close pop-up when clicking outside the content
homePopup.addEventListener('click', (e) => {
    if (e.target === homePopup) {
        homePopup.style.display = 'none';
    }
});
