// Simple Product Filter Example (Can be enhanced for more dynamic behavior)
document.querySelectorAll('.sidebar ul li a').forEach(link => {
    link.addEventListener('click', function(event) {
        event.preventDefault();
        const category = this.textContent.trim();
        filterProductsByCategory(category);
    });
});

function filterProductsByCategory(category) {
    // Logic to filter products by category
    console.log('Filtering by category:', category);
}