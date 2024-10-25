document.addEventListener('DOMContentLoaded', () => {
    const slider = document.getElementById('slider');
    const sliderItems = slider.children;
    const slideWidth = sliderItems[0].clientWidth + 10; // Cộng thêm 10px margin
    let currentIndex = 0;
    let isMoving = false;

    function updateSlider() {
        slider.style.transition = 'transform 0.5s ease-in-out';
        slider.style.transform = `translateX(-${currentIndex * slideWidth}px)`;
    }

    function slideLeft() {
        if (isMoving) return;
        isMoving = true;
        currentIndex = (currentIndex > 0) ? currentIndex - 1 : sliderItems.length - 5;
        updateSlider();
        setTimeout(() => {
            isMoving = false;
        }, 500);
    }

    function slideRight() {
        if (isMoving) return;
        isMoving = true;
        currentIndex = (currentIndex < sliderItems.length - 5) ? currentIndex + 1 : 0;
        updateSlider();
        setTimeout(() => {
            isMoving = false;
        }, 500);
    }

    // Auto-slide every 5 seconds
    setInterval(slideRight, 5000);

    // Initialize slider
    window.addEventListener('resize', () => {
        slider.style.transform = `translateX(-${currentIndex * slideWidth}px)`;
    });

    // Attach event listeners to arrow buttons
    document.querySelector('.left-arrow').addEventListener('click', slideLeft);
    document.querySelector('.right-arrow').addEventListener('click', slideRight);

    // Initialize the slider
    updateSlider();
});
