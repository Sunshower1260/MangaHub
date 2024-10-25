<%-- 
    Document   : chapter
    Created on : 6 thg 7, 2024, 23:08:06
    Author     : Quocb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <%
        String id = request.getParameter("id");
        String chapter = request.getParameter("chapter");
        if (request.getAttribute("imagePaths")==null) {
            response.sendRedirect("loadchapter?id=" + id + "&chapter=" + chapter);
        }
    
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${namecomic} chapter  ${chapterId} </title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">


     

        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css">
        <link rel="stylesheet" href="css/truyen.css">
        <style>


            .form-control.me-2 {
                margin-right: 10px;
            }
            #genres{
                white-space: nowrap;
            }
            #scrollToTopBtn {
                position: fixed;
                bottom: 20px;
                right: 20px;
                display: none;
                width: 50px;
                height: 50px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 50%;
                cursor: pointer;
                outline: none;
                z-index: 1000;
                justify-content: center;
                align-items: center;
            }
            #scrollToTopBtn:hover {
                background-color: #0056b3;
            }
            .container.my-4{
                background-color: #fff;
                border-radius: 6px;
                box-shadow: 0 2px 3px rgb(10 10 10 / 10%), 0 0 0 1px rgb(10 10 10 / 10%);
                color: #4a4a4a;
                display: block;
                padding: 1.25rem;
            }
            .dark-mode .container.my-4{
                background-color:#202124 !important;
                color:#E0E0E0;
            }
            .dark-mode .dropdown-item{
                color: white;
            }
            .dark-mode .dropdown-item:hover{
                color:black;
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
                            
                            <li class="nav-item dropdown" id="genres">
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

        <%-- --------------------------------------------------------------------------------------------------------------------- --%>
        <script>var comicId = <c:out value="${comicId}"/>;</script>
        <div class="container my-4">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="begin.jsp">Trang Chủ</a></li>
                    <li class="breadcrumb-item"><a href="comicinfo.jsp?id=${comicId}&name=${namecomic}">${namecomic}</a></li>
                    <li class="breadcrumb-item active" aria-current="page">chapter ${chapterId}</li>
                </ol>
            </nav>

            <h1>${namecomic} <small></small></h1>

            <div class="alert alert-info">
                Sử dụng mũi tên trái (←) hoặc phải (→) để chuyển chapter
            </div>
            <script>var chapterId =<c:out value="${chapterId}"/> </script>
            <div class="chapter-navigation">
                <a href="chapter.jsp?id=${comicId}&chapter=${chapterId-1}"> <button class="btn btn-secondary" id="prev-chapter" >← Chap trước</button></a>
                <div class="choose">
                <div class="dropdown">
                    <button class="btn btn-primary dropdown-togglee" type="button" id="chapterDropdown" aria-haspopup="true" aria-expanded="false">
                        Chọn Chapter
                    </button>
                    <div class="dropdown-menu chapter-choose" aria-labelledby="chapterDropdown">
                        <div class="input-group px-3">
                            <input type="text" class="form-control" id="searchChapter" placeholder="Nhập số chap, ví dụ: 100">
                            <span class="input-group-text" id="clearSearch">&times;</span>
                        </div>
                        <!-- Chapters will be dynamically inserted here -->
                    </div>
                </div>
            </div>
                <a href="chapter.jsp?id=${comicId}&chapter=${chapterId+1}"><button class="btn btn-secondary" id="next-chapter" >Chap sau →</button></a>
            </div>
        </div>

        <div class="container">
            
        </div>
        <div class="image-container">
            <c:forEach var="imagePath" items="${imagePaths}">
                <img src="${imagePath}" alt="Chapter Image">
                <div class="space"></div>
            </c:forEach>
        </div>
        <button id="scrollToTopBtn">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-up">
            <line x1="12" y1="19" x2="12" y2="5"></line>
            <polyline points="5 12 12 5 19 12"></polyline>
            </svg>
        </button>
            <div class="container my-4">
            <div class="chapter-navigation">
                <a href="chapter.jsp?id=${comicId}&chapter=${chapterId-1}"> <button class="btn btn-secondary" id="prev-chapter2" >← Chap trước</button></a>
                <div class="choose">
                <div class="dropdown">
                    <div class="dropdown-menu chapter-choose" aria-labelledby="chapterDropdown">
                        <div class="input-group px-3">
                            <input type="text" class="form-control" id="searchChapter" placeholder="Nhập số chap, ví dụ: 100">
                            <span class="input-group-text" id="clearSearch">&times;</span>
                        </div>
                        <!-- Chapters will be dynamically inserted here -->
                    </div>
                </div>
            </div>
                <a href="chapter.jsp?id=${comicId}&chapter=${chapterId+1}"><button class="btn btn-secondary" id="next-chapter2" >Chap sau →</button></a>
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

            <script src="chapter.js"></script>
        <script src="darkmodefoot.js"></script>
        <script>
            const totalChapters = 1000;
            let mybutton = document.getElementById("scrollToTopBtn");

            window.onscroll = function () {
                scrollFunction();
            };

            function scrollFunction() {
                if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                    mybutton.style.display = "flex";
                } else {
                    mybutton.style.display = "none";
                }
            }
            mybutton.addEventListener("click", function () {
                window.scrollTo({top: 0, behavior: 'smooth'});
            });
            document.addEventListener('keydown', function (event) {
                if (event.key === 'ArrowLeft' && ${chapterId}!== 1 ) {
                    window.location.href = "chapter.jsp?id=${comicId}&chapter=${chapterId-1}";
                } else if (event.key === 'ArrowRight' && ${chapterId}!==  ${totalChapters}) {
                    window.location.href = "chapter.jsp?id=${comicId}&chapter=${chapterId+1}";
                }
            });
            // -------------------------------------------------------------------------------------------------

            
        </script>

    </body>
</html>
