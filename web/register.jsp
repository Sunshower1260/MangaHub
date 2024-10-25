<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Your Title</title>
    
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="css/register.css">
        <link rel="stylesheet" href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css">
        
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
        <main>
            <% String errorMessage = (String) request.getAttribute("errorMessage");
                if (errorMessage != null) { %>
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <%= errorMessage %>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                <% } %>
            <div class="wrapper">
                <form action="signupServlet" method="POST">
                    <h1>Registration</h1>
                        <div class="input-box">
                            <div class="input-field">
                                <input type="text" placeholder="Full Name" name="fullname" required>
                                <i class='bx bx-user'></i>
                            </div>
                                <div class="input-field">
                                    <input type="text" placeholder="User Name" name="username" required>
                                    <i class='bx bx-user'></i>
                                </div>
                            </div>
                        <div class="input-box">
                        <div class="input-field">
                            <input type="password" placeholder="Password" name="password" required>
                                <i class="bx bxs-lock-alt"></i>
                            </div>
                            <div class="input-field">
                                <input type="password" placeholder="Confirm Password" name="confirmPassword" required>
                            <i class="bx bxs-lock-alt"></i>
                            </div>
                        </div>
                        <div class="input-box">
                            <div class="input-field">
                                <input type="email" placeholder="Email" name="email" required>
                                    <i class='bx bx-envelope'></i>
                                </div>
                                <div class="input-field">
                                <input type="text" placeholder="Phone" name="phone" required>
                                <i class='bx bxs-phone'></i>
                            </div>
                        </div>
    <label>
        <input type="checkbox" required> I declare that the above information provided is true and correct
    </label>
    <button type="submit" class="btn">Register</button>
                </form>
            </div>
        </main>
        
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        var closeButtons = document.querySelectorAll('.alert .btn-close');

        closeButtons.forEach(function(btn) {
            btn.addEventListener('click', function() {
                var alert = this.closest('.alert');
                alert.style.display = 'none';
            });
        });
    </script>
     <script src="darkmode.js"></script>
    </body>
</html>
