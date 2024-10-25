<!DOCTYPE html>
<html>
<head>
    <title>Forget Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css">
    <link rel="stylesheet" href="css/darkmode.css">

    <script>
        function showAlert(message) {
            alert(message);
        }
    </script>
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <div class="d-flex align-items-center main-nav">
                    <ul class="navbar-nav d-flex align-items-center">
                        <li class="nav-item me-3 active">
                            <a class="nav-link" href="index.jsp"><i class='bx bx-home'></i></a>
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
                                <a href="all.jsp?tag=Action">Action</a>
                                <a href="all.jsp?tag=drama">Drama</a>
                                <a href="all.jsp?tag=comedy">Comedy</a>
                                <a href="all.jsp?tag=horror">Horror</a>
                                <a href="all.jsp?tag=romance">Romance</a>
                                <a href="all.jsp?tag=Adventure">Adventure</a>
                                <a href="all.jsp?tag=sci-fi">Sci-Fi</a>
                                <a href="all.jsp?tag=Fantasy">Fantasy</a>
                            </div>
                        </li>
                    </ul>
                </div>

                <!-- Center: Logo -->
                <a class="logo" href="index.jsp">
                    <img src="css/logo2.png" alt="Logo" id="logo" class="img-fluid">
                </a>

                <!-- Right Side: Search Bar and Account -->
                <div class="d-flex align-items-center">
                    <form class="d-flex" id="searchs">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" action="search" method="get">
                        <button class="btn btn-outline-success ms-2" type="submit">Search</button>
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

    <main>
        <div class="wrapper">
            <form action="ForgetPasswordServlet" method="post">
                <h1>Forget Password</h1>
                <div class="input-box">
                    <br>
                    <input type="email" id="email" name="email" placeholder="email" required>
                </div>
                <div class="input-box">
                    <br>
                    <input type="text" id="phone" name="phone" placeholder="phone" required>
                </div>
                <br>
                <button type="submit" class="btn">Submit</button>

                <%
                    String message = (String) request.getAttribute("message");
                    if (message != null) {
                %>
                    <script>
                        showAlert("<%= message %>");
                    </script>
                <% } %>
            </form>
        </div>
    </main>

    <script src="darkmode.js"></script>
</body>
</html>
