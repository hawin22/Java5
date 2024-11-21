<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<h3>${msg}</h3>
<h2>Danh sach banh trung thu</h2>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Ten</th>
        <th>Gia</th>
        <th>Ngon</th>
        <th>Action</th>
    </tr>
    <c:forEach items="${list}" var="l">
        <tr>
            <td>${l.id}</td>
            <td>${l.ten}</td>
            <td>${l.gia}</td>
            <td>${l.ngon?"Ngon":"Khong ngon"}</td>
            <td>
                <a href="/mooncake/detail/${l.id}">
                <button type="submit">Detail</button></a>
                <a href="/mooncake/delete/${l.id}">
                <button type="submit">Delete</button>
            </a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>