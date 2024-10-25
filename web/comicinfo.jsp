<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <%   
        String id = request.getParameter("id");

    if (request.getAttribute("truyen") == null) {
        response.sendRedirect("comicinfo?id=" + id);
        return;
    }
    String chap = request.getParameter("oldchapter");
    boolean hasOldChapter = (chap != null && !chap.isEmpty());
    %>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title><c:out value="${truyen.title}"/></title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/page.css">
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css">
        <style>

            .blue-button {
                background-color: blue;
                color: white;
                border: none;
                padding: 10px 20px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
                border-radius: 8px;
                transition-duration: 0.4s;
            }
            .star-rating i {
                color: gold;
            }
            .chapter-list {
                list-style: none;
                padding-left: 0;

                width: 100%;
                border-radius: 5px;
                max-height: 500px;
                overflow: auto;

                box-shadow: 0 2px 3px rgb(10 10 10 / 10%), 0 0 0 1px rgb(10 10 10 / 10%);
                color: #4a4a4a;
                display: block;
                padding: 1.25rem;
                font-weight: 400;
                font-size: 15px;
            }
            .chapter-list li {
                display: flex;
                justify-content: space-between;
                padding: 0.5em 0;
                border-bottom: 1px solid #ddd;
            }
            img#bia {
                display: block;
                max-width: 100%;
                height: auto;
                margin-bottom: 20px; /* Thêm khoảng cách dưới ảnh nếu cần */
                transform: translateX(-300px);
            }
            #searchs{
                margin-left: 20px !important;
            }
            .container.my-5 {
                margin-top: 80px;
            }
            .form-control.me-2 {
                margin-right: 10px;
            }
            .container .me-10{
                background-color: #ffffff;
                border: 1px solid #ddd;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 1.25rem;
            }


            body.dark-mode .chapter-list {
                background-color: #333;
                color: #ffffff;
                box-shadow: 0 2px 3px rgb(221, 221, 221), 0 0 0 1px rgb(221, 221, 221);
            }
            .darkmode.mt-4.ke{
                color:whitesmoke;
            }


        </style>

        <link rel="stylesheet" href="css/darkmode.css">

    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">

                    <div class="d-flex align-items-center main-nav ">
                        <ul class="navbar-nav d-flex align-items-center">
                            <li class="nav-item me-3 active">
                                <a class="nav-link" href="begin.jsp"><i class='bx bx-home'></i></a>
                            </li>
                            <li class="nav-item me-3">
                                <a class="nav-link" href="favourite.jsp">Favourite</a>
                            </li>
                            <li class="nav-item me-3">
                                <a class="nav-link" href="history.jsp">History</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                   data-bs-toggle="dropdown" aria-expanded="false">
                                    Genres
                                </a>
                                <div class="dropdown-menu megamenu" aria-labelledby="navbarDropdown">
                                    <a href="tag?tag=Action">Action</a>
                                    <a href="tag?tag=drama">Drama</a>
                                    <a href="tag?tag=comedy">Comedy</a>
                                    <a href="tag?tag=horror">Horror</a>
                                    <a href="tag?tag=romance">Romance</a>
                                    <a href="tag?tag=Adventure">Adventure</a>
                                    <a href="tag?tag=sci-fi">Sci-Fi</a>
                                    <a href="tag?tag=Fantasy">Fantasy</a>
                                    <a href="tag?tag=Slice%20of%20life">Slice of life</a>
                                </div>
                            </li>
                        </ul>
                    </div>

                    <!-- Center: Logo -->
                    <a class="logo" href="begin.jsp">
                        <img src="css/logo2.png" alt="Logo" id="logo" class="img-fluid">
                    </a>

                    <!-- Right Side: Search Bar and Account -->
                    <div class="d-flex align-items-center">
                        <form class="d-flex" action="search" method="get">
                            <input class="form-control me-2" type="text" name="q" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success" type="submit">Search</button>
                        </form>

                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <c:choose>
                                    <c:when test="${not empty username}">
                                        <a class="nav-link" href="userinfo.jsp">${username}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="nav-link" href="login.jsp">ACCOUNT</a>
                                    </c:otherwise>
                                </c:choose>

                            </li>
                            <li class="nav-item">
                                <button id="dark-mode-toggle" class="btn btn-link nav-link"><i class='bx bx-moon'></i></button>
                            </li>
                        </ul>

                    </div>
                </div>
            </nav>
        </header>

        <%-- ------------------------------------------------------------------------------------------------------------------ --%>   


        <div class="container my-5">
            <div class="row me-10">
                <div class="col-md-4">
                    <img src="images/${truyen.id}/bia.jpg" id="bia"  class="img-fluid" alt="${truyen.title}">
                </div>
                <div class="col-md-8">
                    <h2><c:out value="${truyen.title}"/></h2>
                    <p><strong>Cập nhật lúc:</strong> <c:out value="${truyen.publisheddate}"/></p>
                    <p><strong>Tác giả:</strong> <c:out value="${truyen.author}"/> </p>
                    <p><strong>Tình trạng:</strong> Đang tiến hành</p>
                    <div >
                        <p><strong>Thể loại:</strong> 
                            <c:forEach var="theloai" items="${genre}">
                                <a href="tag?tag=${theloai}"><c:out value="${theloai}"/></a>

                            </c:forEach>
                        </p>
                    </div>
                    <p><strong>Lượt xem:</strong>${truyen.viewer}<span>&#128065</span> </p>

                    <form class="fav-but disabled" action="favAdd" method="post">
                        <input type="hidden" name="user_id" value="<%= session.getAttribute("userid") %>">
                        <input type="hidden" name="comic_id" value="${truyen.id}">
                        <input type="hidden" name="action" id="action" value="bjahba">
                        <button type="submit" class="btn btn-primary btn-favorite" onclick="document.getElementById('action').value = 'add';">Add to Favorites</button>
                        <button type="submit" class="btn btn-secondary btn-favorite" onclick="document.getElementById('action').value = 'remove';">Remove from Favorites</button>
                    </form>

                    <p>so nguoi theo doi</p>
                    <a href="chapter.jsp?id=${truyen.id}&chapter=1"><button class="btn btn-warning" >Đọc từ đầu</button></a>
                    <a href="chapter.jsp?id=${truyen.id}&chapter=3"><button class="btn btn-success">Đọc mới nhất</button></a>
                    <% if (hasOldChapter) { %>
                    <a href="chapter.jsp?id=${truyen.id}&chapter=<%= chap %>">
                        <button class="blue-button">Đọc tiếp chapter <c:out value="<%= chap %>"/> </button>
                    </a>
                    <% } %>
                </div>
            </div>
              
             
            <div class="container mt-4">
                 <hr class="ke"/>
                <div class="mt-4" style="">
                     <h5 style="text-align:center; ">Nội dung truyện </h5>
                 <p> <c:out value="${truyen.descriptionComic}"/> </p>
            </div>   
                 <hr class="ke"/>
                <h5>Danh sách chương</h5>
                <ul class="chapter-list">
                    <li><a href="chapter.jsp?id=${truyen.id}&chapter=3"><span>Chapter 3</span></a><span>3 tháng trước</span></li>
                    <li><a href="chapter.jsp?id=${truyen.id}&chapter=2"><span>Chapter 2</span></a><span>4 tháng trước</span></li>
                    <li><a href="chapter.jsp?id=${truyen.id}&chapter=1"><span>Chapter 1</span></a><span>5 tháng trước</span></li>
                </ul>
            </div>
        </div>


        <footer >
            <a class="logo" href="begin.jsp">
                <img src="css/logo2.png" alt="Logo" id="logo2" class="img-fluid">
            </a>
            <div class="footer-nav">
                <a href="https://www.facebook.com">
                    <i class='bx bxl-facebook-circle'></i>
                </a>
                <a href="https://www.instagram.com">
                    <i class='bx bxl-instagram-alt'></i>
                </a>
                <a href="https://x.com/">
                    <i class='bx bxl-twitter'></i>
                </a>
                <a href="https://www.youtube.com/">
                    <i class='bx bxl-youtube'></i>
                </a>
            </div>



        </footer>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var userId = '<%= session.getAttribute("userid") %>';
                if (!userId || userId === 'null') {
                    var buttons = document.querySelectorAll('.btn-favorite');
                    buttons.forEach(function (button) {
                        button.disabled = true;
                    });
                }
            });


        </script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <script src="darkmodefoot.js"></script>
    </body>
</html>
