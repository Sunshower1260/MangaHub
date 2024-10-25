/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
 // Change this number to the total chapters you want to display
const dropdownMenu = document.querySelector('.chapter-choose');
const dropdownToggle = document.querySelector('#chapterDropdown');
const previousChapterButton = document.getElementById('prev-chapter');
const previousChapterButton2 = document.getElementById('prev-chapter2');
const nextChaterButton = document.getElementById('next-chapter');
const nextChaterButton2 = document.getElementById('next-chapter2');

for (let i = totalChapters; i >= 1; i--) {
    const chapterItem = document.createElement('a');
    chapterItem.className = 'dropdown-item';
    chapterItem.href = `chapter.jsp?id=${comicId}&chapter=${i}`;
    chapterItem.textContent = `Chapter ${i}`;
    chapterItem.addEventListener('click', () => {
        dropdownMenu.classList.remove('show');
    });
    dropdownMenu.appendChild(chapterItem);
}

document.getElementById('searchChapter').addEventListener('input', function () {
    const searchValue = this.value.toLowerCase();
    const items = dropdownMenu.querySelectorAll('.dropdown-item');
    items.forEach(item => {
        if (item.textContent.toLowerCase().includes(searchValue)) {
            item.style.display = '';
        } else {
            item.style.display = 'none';
        }
    });
});

document.getElementById('clearSearch').addEventListener('click', function () {
    document.getElementById('searchChapter').value = '';
    const items = dropdownMenu.querySelectorAll('.dropdown-item');
    items.forEach(item => {
        item.style.display = '';
    });
});

dropdownToggle.addEventListener('click', function (event) {
    event.stopPropagation();
    dropdownMenu.classList.toggle('show');
});

document.addEventListener('click', function (event) {
    if (!dropdownToggle.contains(event.target) && !dropdownMenu.contains(event.target)) {
        dropdownMenu.classList.remove('show');
    }
});


if (chapterId === 1) {
    previousChapterButton.disabled = true;
    previousChapterButton2.disabled = true;
    
}

if (chapterId === totalChapters){
    nextChaterButton.disabled = true;
    nextChaterButton2.disabled = true;
}

