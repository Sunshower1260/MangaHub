const darkModeToggle = document.getElementById('dark-mode-toggle');
const body = document.body;
const icon = darkModeToggle.querySelector('i');
const image= document.getElementById('logo');

const foot=document.getElementById('fot');

// đổi icon 
function updateIcon(isDarkMode) {
    if (isDarkMode) {
        icon.classList.remove('bx-moon');
        icon.classList.add('bx-sun');
        image.src="css/darklogo.png";
    } else {
        icon.classList.remove('bx-sun');
        icon.classList.add('bx-moon');
        image.src="css/logo2.png";
    }
}

// var chế độ hiện tại từ localStorage 
if (localStorage.getItem('darkMode') === 'enabled') {
    body.classList.add('dark-mode');
    updateIcon(true);
} else {
    updateIcon(false);
}
// Làm màu khi người dùng bấm nút
darkModeToggle.onclick = () => {
    body.classList.toggle('dark-mode');// thêm hoặc xóa lớp dark-mode
    const isDarkMode = body.classList.contains('dark-mode');// kiểm tra dark-mode có tồn tại ko ?,lưu kết quả
    localStorage.setItem('darkMode', isDarkMode ? 'enabled' : 'disabled');// nếu tồn tại thì isDarkmode=true,.....kết quả bắn lên localStorgare
    updateIcon(isDarkMode);
};
