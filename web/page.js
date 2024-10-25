const totalPages = 562;
//let currentPage = 1;
//page=parseInt(page);
//function buton(){
//   window.alert("page is"+page);
//}

//

function loadPage(page) {
    fetch(`paging?page=${page}`, {
        method: 'GET',
        headers: {
            'Content-Type': 'text/html'
        }
    })
    .then(response => response.text())
    .then(data => {
        document.getElementById('content').innerHTML = data;
        currentPage = page;
        updatePagination();
    })
    .catch(error => console.error('Error fetching page:', error));
}







//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function updatePagination() {
  const pagination = document.querySelector('.pagination-custom');
  pagination.innerHTML = `
    <li class="page-item ${currentPage === 1 ? 'disabled' : ''}" id="prev-page">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
        <span class="sr-only">Previous</span>
      </a>
    </li>
  `;

  if (currentPage > 3) {
    pagination.innerHTML += `<li class="page-item"><a class="page-link" href="paging?page=1">1</a></li>`;
    if (currentPage > 4) {
      pagination.innerHTML += `<li class="page-item" id="ellipsis-start"><a class="page-link" href="#">...</a></li>`;
    }
  }

  for (let i = Math.max(1, currentPage - 2); i <= Math.min(totalPages, currentPage + 2); i++) {
    pagination.innerHTML += `<li class="page-item ${i === currentPage ? 'active' : ''}"><a class="page-link" href="paging?page=${i}">${i}</a></li>`;
  }

  if (currentPage < totalPages - 2) {
    if (currentPage < totalPages - 3) {
      pagination.innerHTML += `<li class="page-item" id="ellipsis-end"><a class="page-link" href="#">...</a></li>`;
    }
    pagination.innerHTML += `<li class="page-item"><a class="page-link" href="paging?page=${totalPages}">${totalPages}</a></li>`;
  }

  pagination.innerHTML += `
    <li class="page-item ${currentPage === totalPages ? 'disabled' : ''}" id="next-page">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
        <span class="sr-only">Next</span>
      </a>
    </li>
  `;

  document.getElementById('prev-page').addEventListener('click', (e) => {
    e.preventDefault();
    if (currentPage > 1) {
      currentPage--;
      window.location.href = `paging?page=${currentPage}`;
    }
  });

  document.getElementById('next-page').addEventListener('click', (e) => {
    e.preventDefault();
    if (currentPage < totalPages) {
      currentPage++;
      window.location.href = `paging?page=${currentPage}`;
    }
  });

  document.querySelectorAll('.page-item a').forEach(item => {
    item.addEventListener('click', (e) => {
      e.preventDefault();
      const page = parseInt(e.target.textContent);
      if (!isNaN(page)) {
        currentPage = page;
        window.location.href = `paging?page=${currentPage}`;
      }
    });
  });
}


document.addEventListener('DOMContentLoaded', () => {
  const pageInput = document.getElementById('page-input');
  const pageNumber = document.getElementById('page-number');
  const goPageButton = document.getElementById('go-page');

  const urlParams = new URLSearchParams(window.location.search);
  const pageParam = parseInt(urlParams.get('page'));
  if (!isNaN(pageParam) && pageParam > 0 && pageParam <= totalPages) {
    currentPage = pageParam;
  }

  updatePagination();

  goPageButton.addEventListener('click', () => {
    const page = parseInt(pageNumber.value);
    if (page && page > 0 && page <= totalPages) {
      currentPage = page;
      window.location.href = `paging?page=${currentPage}`;
    }
  });

  document.addEventListener('click', (e) => {
    if (!document.querySelector('.pagination-custom').contains(e.target) && !pageInput.contains(e.target)) {
      pageInput.style.display = 'none';
    }
  });
});