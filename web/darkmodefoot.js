/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


const darkModeToggle = document.getElementById('dark-mode-toggle');
const body = document.body;
const icon = darkModeToggle.querySelector('i');
const image = document.getElementById('logo');
const image2 = document.getElementById('logo2');
const foot = document.querySelector('footer');

// Change icon
function updateIcon(isDarkMode) {
    if (isDarkMode) {
        icon.classList.remove('bx-moon');
        icon.classList.add('bx-sun');
        image.src = "css/darklogo.png";
        foot.style.backgroundColor = '#24272a';
        image2.src = "css/darklogo.png";
    } else {
        icon.classList.remove('bx-sun');
        icon.classList.add('bx-moon');
        image.src = "css/logo2.png";
        foot.style.backgroundColor = 'lightblue';
        image2.src = "css/logo2.png";
    }
}

// Current mode from localStorage
if (localStorage.getItem('darkMode') === 'enabled') {
    body.classList.add('dark-mode');
    updateIcon(true);
} else {
    updateIcon(false);
}

// Toggle color when user clicks the button
darkModeToggle.onclick = () => {
    body.classList.toggle('dark-mode');
    const isDarkMode = body.classList.contains('dark-mode');
    localStorage.setItem('darkMode', isDarkMode ? 'enabled' : 'disabled');
    updateIcon(isDarkMode);
};
