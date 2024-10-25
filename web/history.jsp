<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.history" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Manga hub-History</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css">
    <link rel="stylesheet" href="css/styles.css">
        <style>
       /* Light mode */
.tag {
    background-color: #fff;
    border-radius: 6px;
    box-shadow: 0 2px 3px rgba(10, 10, 10, 0.1), 0 0 0 1px rgba(10, 10, 10, 0.1);
    color: #4a4a4a;
    display: block;
    padding: 1.25rem;
    margin-bottom: 1.5rem;
    
}

.tag .breadcrumb {
    background: #e9ecef;
    border-radius: 6px;
    padding: 0.75rem;
    margin-bottom: 1rem;
}

.tag .breadcrumb a {
    text-decoration: none;
    color: #007bff;
}

.tag .breadcrumb a:hover {
    text-decoration: underline;
}

.tag .content-header {
    border-bottom: 1px solid #e9ecef;
    padding-bottom: 1rem;
    margin-bottom: 1rem;
}

.tag .content-header h1 {
    font-size: 2rem;
    margin-bottom: 0.5rem;
}

.tag .content-header p {
    font-size: 1.125rem;
    color: #6c757d;
}

.tag .story-card {
    border: 1px solid #e9ecef;
    border-radius: 6px;
    padding: 1rem;
    text-align: center;
    background-color: #f8f9fa;
    transition: transform 0.3s, box-shadow 0.3s;
}

.tag .story-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.tag .story-card img {
    border-radius: 6px;
    margin-bottom: 1rem;
}

.tag .story-card .story-title {
    font-size: 1.25rem;
    font-weight: bold;
    margin-bottom: 0.5rem;
}

.tag .story-card .story-description {
    font-size: 0.875rem;
    color: #6c757d;
}

.tag .story-card .story-description ul {
    padding: 0;
    list-style: none;
}

.tag .story-card .story-description ul li {
    margin-bottom: 0.5rem;
}

.tag .story-card .story-description ul li a {
    text-decoration: none;
    color: #007bff;
}

.tag .story-card .story-description ul li a:hover {
    text-decoration: underline;
}

/* Dark mode */
body.dark-mode .tag {
    background-color: #2b2b2b;
    box-shadow: 0 2px 3px rgba(0, 0, 0, 0.5), 0 0 0 1px rgba(0, 0, 0, 0.2);
    color: #e4e4e4;
}

body.dark-mode .tag .breadcrumb {
    background: #3a3a3a;
}

body.dark-mode .tag .breadcrumb a {
    color: #1e90ff;
}

body.dark-mode .tag .breadcrumb a:hover {
    text-decoration: underline;
}

body.dark-mode .tag .content-header {
    border-bottom: 1px solid #3a3a3a;
}

body.dark-mode .tag .content-header h1 {
    color: #e4e4e4;
}

body.dark-mode .tag .content-header p {
    color: #c4c4c4;
}

body.dark-mode .tag .story-card {
    border: 1px solid #3a3a3a;
    background-color: #3a3a3a;
}

body.dark-mode .tag .story-card:hover {
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.5);
}

body.dark-mode .tag .story-card .story-title {
    color: #e4e4e4;
}

body.dark-mode .tag .story-card .story-description {
    color: #c4c4c4;
}

body.dark-mode .tag .story-card .story-description ul li a {
    color: #1e90ff;
}

        
    </style>
    <link rel="stylesheet" href="css/darkmode.css">
</head>
<body>
  <script>const id='<%= session.getAttribute("userid") %>' </script> 
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

  <%-- --------------------------------------------------------------------------- --%>
<div class="content tag">
            <div class="breadcrumb tagid">
                <a href="begin.jsp">Trang chủ</a> » <a href="history.jsp">Lịch sử</a>
            </div>
            <div class="content-header">
                <h1>History Manga</h1>
                <p>This genre is your History manga list.</p>

            </div>
            </div>  
  <%-- --------------------------------------------------------------------------- --%>
    
<%
    if (session.getAttribute("userid") == null) {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
        if (request.getParameter("check")==null) {
            response.sendRedirect("history");
    }
        ArrayList<history> ans = (ArrayList<history>) request.getAttribute("ans");
        if (ans == null || ans.isEmpty()) {
        %>
            <p>No history available.</p>
            
             <footer class="foot2">
        <a class="logo" href="index.jsp">
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
<%
        } else {
%>
            <section class="content">
                <div class="container">
                    <div class="row">
                        <c:forEach var="comic" items="${ans}">
                            <div class="col-lg-4 col-md-6 col-sm-12 comic-card">
                                <a href="comicinfo.jsp?id=${comic.comicid}" style="text-decoration: none">
                                    <div class="story-card">
                                        <img src="images/${comic.comicid}/bia.jpg" alt="${comic.comicname}" width="200" height="300">
                                        <h3 class="story-title"><c:out value="${comic.comicname}"/> </h3>
                                        <div class="story-description">
                                            <ul>
                                                <li><a href="chapter.jsp?id=${comic.comicid}&chapter=${comic.lastchapter}">Chapter ${comic.lastchapter}</a></li>
                                                <li><a href="deleteHistory?comicid=${comic.comicid}" style="color:red">Delete</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
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

            
            

            
            <%
        }
    
%>



 <script src="darkmodefoot.js"></script>
</body>
</html>

