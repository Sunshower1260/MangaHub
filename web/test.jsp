<%-- 
    Document   : test
    Created on : 10 thg 7, 2024, 21:31:47
    Author     : Quocb
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1><% String id=request.getParameter("id");
            request.setAttribute("id",id);
           

            %>
       
            
        </h1>
            <c:forEach var="comic" items="${ans}">
                            <div class="col-lg-4 col-md-6 col-sm-12 comic-card">
                                <a href="comicinfo.jsp?id=${comic.comicid}" style="text-decoration: none">
                                    <div class="story-card">
                                        <img src="images/${comic.comicid}/bia.jpg" alt="${comic.comicname}" width="200" height="300">
                                        <h3 class="story-title"><c:out value="${comic.comicname}"/> </h3>
                                        <div class="story-description">
                                            <ul>
                                                <li><a href="chapter.jsp?id=${comic.comicid}&chapter=${comic.lastchapter}">Chapter ${comic.lastchapter}</a></li>
                                                <!-- Add other chapters if needed -->
                                            </ul>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>

           
    </body>
</html>
