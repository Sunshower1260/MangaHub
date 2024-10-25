<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manga hub</title>
        <link rel="stylesheet" href="css/page.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/darkmode.css">
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css">
        <link rel="stylesheet" href="css/homepage.css">


    </head>


    <%
            String username = (String) session.getAttribute("username");
            Integer userid = (Integer) session.getAttribute("userid");
    %>      

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


   
        <%-- -------------------------------------------------------------------------------------------------------------------- --%>

        <%-- -------------------------------------------------------------------------------------------------------------------- --%>
        <section class="content">
            <div class="container">
                <div class="row">
                    <!-- Truyện 1 -->
                    <c:forEach var="comic" items="${list}">
                        <div class="col-lg-4 col-md-6 col-sm-12 comic-card">
                            <a href="comicinfo.jsp?id=${comic.id}"  style="text-decoration: none">
                                <div class="story-card">
                                    <img src="images/${comic.id}/bia.jpg" alt="Tên Truyện 1" max-width="200px" max-height="300px">
                                    <h3 class="story-title"><c:out value="${comic.title}"/> </h3>
                                    <div class="story-description">
                                        <ul>
                                            <li><a href="chapter.jsp?id=${comic.id}&chapter=3">Chapter 3</a></li>
                                            <li><a href="chapter.jsp?id=${comic.id}&chapter=2">Chapter 2</a></li>
                                            <li><a href="chapter.jsp?id=${comic.id}&chapter=1">Chapter 1</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </a>   
                        </div>
                    </c:forEach>
                    <div/>

                    </section>
                    <%-- -------------------------------------------------------------------------------------------------------------------- --%>

                    <script>var currentPage = <c:out value="${page}"/>;</script>  



                    <section id="scroll">
                        <div class="container my-4">
                            <nav aria-label="Page navigation">
                                <ul class="pagination pagination-custom">
                                    <li class="page-item disabled" id="prev-page">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>
                                    <!-- Pages will be dynamically inserted here -->
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item"><a class="page-link" href="#">...</a></li>
                                    <li class="page-item"><a class="page-link" href="#">561</a></li>
                                    <li class="page-item"><a class="page-link" href="#">562</a></li>
                                    <li class="page-item" id="next-page">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </li>
                                </ul>
                                <div class="page-input" id="page-input">
                                    <input type="number" class="form-control" id="page-number" placeholder="Page number">
                                    <button class="btn btn-primary mt-2" id="go-page">Go</button>
                                </div>
                            </nav>
                        </div>
                    </section>
                    </main>

                    <footer id="fot">
                        <a class="logo" href="begin.jsp">
                            <img src="css/logo2.png" alt="Logo" id="logo" class="img-fluid">
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




                    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
                    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

                    <script src="mjs.js"></script>
                    <script src="page.js"></script>
                    <script src="darkmode.js"></script>
                    </body>


                    </html>