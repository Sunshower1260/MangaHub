<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manga Hub - Berserk</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            margin-top: 50px;
        }
        .btn-favorite {
            margin-top: 20px;
        }
        .debug-info {
            margin-top: 20px;
            padding: 10px;
            background-color: #f0f0f0;
            border: 1px solid #ccc;
        }
    </style>
</head>
<body>
    <div class="container text-center">
        <h1>Favorite Comics</h1>
        <form action="favAdd" method="post">
            <input type="hidden" name="user_id" value="<%= session.getAttribute("userid") %>">
            <input type="hidden" name="comic_id" value="${id}"> <!-- Thay comic_id thật vào đây -->
            <input type="hidden" name="action" id="action" value="add">
            <button type="submit" class="btn btn-primary btn-favorite" onclick="document.getElementById('action').value='add';">Add to Favorites</button>
            <button type="submit" class="btn btn-secondary btn-favorite" onclick="document.getElementById('action').value='remove';">Remove from Favorites</button>
        </form>
    </div>

</body>
</html>
