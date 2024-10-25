<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tìm truyện tranh</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css">
        <link rel="stylesheet" href="css/styles.css">

        <style>
            body {
                background-color: #f8f9fa;
            }
            body.dark-mode {
                background-color: #121212;
                color: #ffffff;
            }
            .filter-buttons button {
                margin-right: 5px;
                margin-bottom: 5px;
                border-radius: 5px;
            }
            .filter-buttons .btn-primary {
                background-color: #f39c12;
                border-color: #f39c12;
            }
            .filter-buttons .btn-primary:hover {
                background-color: #e67e22;
                border-color: #e67e22;
            }
            .sidebar {
                position: sticky;
                top: 20px;
            }
            .genre-list a {
                display: block;
                padding: 5px 0;
                color: #007bff;
                text-decoration: none;
                border-radius: 5px;
                transition: background-color 0.3s, color 0.3s;
            }
            .genre-list a:hover {
                background-color: #e9ecef;
                color: #0056b3;
            }
            .genre-list a.active {
                color: #d35400;
                font-weight: bold;
            }
            .card {
                border: none;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
                transition: transform 0.2s, box-shadow 0.2s;
            }
            .card:hover {
                transform: translateY(-5px);
                box-shadow: 0 8px 16px rgba(0,0,0,0.2);
            }
            .card img {
                height: 200px;
                object-fit: cover;
                border-top-left-radius: 10px;
                border-top-right-radius: 10px;
            }
            /* Dark mode styles */
            body.dark-mode .filter-buttons .btn-primary {
                background-color: #d35400;
                border-color: #d35400;
            }
            body.dark-mode .filter-buttons .btn-primary:hover {
                background-color: #e67e22;
                border-color: #e67e22;
            }
            body.dark-mode .genre-list a {
                color: #80bdff;
            }
            body.dark-mode .genre-list a:hover {
                background-color: #495057;
                color: #ff8c00;
            }
            body.dark-mode .genre-list a.active {
                color: #ff8c00;
            }
            body.dark-mode .card {
                background-color: #1f1f1f;
                box-shadow: 0 4px 8px rgba(255,255,255,0.1);
            }
            body.dark-mode .card:hover {
                box-shadow: 0 8px 16px rgba(255,255,255,0.2);
            }
        </style>
        <link rel="stylesheet" href="css/darkmode.css">
    </head>
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
                                <a href="tag?tag=Drama">Drama</a>
                                <a href="tag?tag=Comedy">Comedy</a>
                                <a href="tag?tag=Horror">Horror</a>
                                <a href="tag?tag=Romance">Romance</a>
                                <a href="tag?tag=Adventure">Adventure</a>
                                <a href="tag?tag=Sci-fi">Sci-Fi</a>
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
    <%--  ------------------------------------------------------------------------------------------------------------------------------- --%>
    <%String tag=request.getParameter("tag"); %>
    <body>
        <div class="container my-5">
            <div class="row">
                <div class="col-md-9">
                    <h1 class="mb-4">Tìm truyện tranh thể loại <%=tag %></h1>
                    <div class="input-group mb-4">
                        <select class="form-select">
                            <option selected>Tất cả thể loại truyện tranh</option>
                            <!-- Add more options as needed -->
                        </select>
                        <button class="btn btn-primary">Tất cả</button>
                        <button class="btn btn-secondary">Hoàn thành</button>
                        <button class="btn btn-secondary">Đang tiến hành</button>
                    </div>
                    <div class="filter-buttons mb-4">
                        <button class="btn btn-outline-secondary">Truyện mới</button>
                        <button class="btn btn-outline-secondary">Top all</button>
                        <button class="btn btn-outline-secondary">Top tháng</button>
                        <button class="btn btn-outline-secondary">Top tuần</button>
                        <button class="btn btn-outline-secondary">Top ngày</button>
                        <button class="btn btn-outline-secondary">Theo dõi</button>
                        <button class="btn btn-outline-secondary">Bình luận</button>
                        <button class="btn btn-outline-secondary">Số chapter</button>
                        <button class="btn btn-outline-secondary">Top Follow</button>
                    </div>
                    <div class="row">
                        <!-- Example manga card -->
                        <c:forEach var="truyen" items="${list}">
                            <div class="col-md-3 mb-4">
                                <div class="card">
                                    <a href="comicinfo.jsp?id=${truyen.id}"  style="text-decoration: none">
                                        <img src="images/${truyen.id}/bia.jpg" class="card-img-top" alt="Manga">
                                        <div class="card-body">
                                            <h5 class="card-title"><c:out value="${truyen.title}"/> </h5>
                                            <a class="card-text" href="chapter.jsp?id=${truyen.id}&chapter=3">Chapter 3</p>
                                            <a class="card-text" href="chapter.jsp?id=${truyen.id}&chapter=2">Chapter 2</p>
                                            <a class="card-text" href="chapter.jsp?id=${truyen.id}&chapter=1">Chapter 1</p>
                                            <a class="card-text"><small class="text-muted">1 năm trước</small></p>
                                        </div>
                                    </a>   
                                </div>
                            </div>
                        </c:forEach>
                        <!-- Repeat for more manga cards -->
                    </div>
                </div>
                <div class="col-md-3 sidebar">
                    <h4>Thể loại</h4>
                    <div class="genre-list">
                        <a href="tag?tag=Action">Action</a>
                        <a href="tag?tag=Drama">Drama</a>
                        <a href="tag?tag=Comedy">Comedy</a>
                        <a href="tag?tag=Horror">Horror</a>
                        <a href="tag?tag=Romance">Romance</a>
                        <a href="tag?tag=Adventure">Adventure</a>
                        <a href="tag?tag=Sci-fi">Sci-Fi</a>
                        <a href="tag?tag=Fantasy">Fantasy</a>
                        <a href="tag?tag=Slice%20of%20life">Slice of life</a>
                    </div>

                </div>
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


        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="darkmodefoot.js"></script>
    </body>
</html>
