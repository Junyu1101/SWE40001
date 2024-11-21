document.addEventListener("scroll", () => {
    const navbar = document.querySelector(".navbar-wrapper");
    const shrinkThreshold = 50; // Scroll threshold for shrinking

    if (window.scrollY > shrinkThreshold) {
        navbar.classList.add("shrink");
    } else {
        navbar.classList.remove("shrink");
    }
});
