<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../boostrap/css/bootstrap.min.css">
    <title>Document</title>
</head>
<body class="container">
<form action="/user/add" method="post">
    <label>ID</label>
    <input type="text" name="id">
    <label>Name</label>
    <input type=" text" name="name">
    <button type="submit">ADD</button>
</form>
<table class="table table-bordered">
    <tr>
        <th>ID</th>
        <th>Name</th>
    </tr>
<c:forEach items="${list}" var="l">
    <tr>
        <td>${l.id}</td>
        <td>${l.name}</td>
        <td><a href="/user/detail/${l.id}">
            <button class="btn btn-success">Detail</button></a>
       <a href="/user/detail/${l.id}">
            <button class="btn btn-warning">Update</button>
        </a>
        <a href="/user/delete/${l.id}">
            <button class="btn btn-danger">Delete</button>
        </a></td>
    </tr>
</c:forEach>
</table>
</body>
</html>