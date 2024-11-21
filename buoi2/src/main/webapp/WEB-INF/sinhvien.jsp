<!doctype html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<h2>Danh sach sinh vien</h2>
<form action="/sinhvien/add" method="post">
    <label>Name: </label>
    <input type="text" name="name" value="${sv.name}"> <br>
    <label>Address: </label>
    <input type="text" name="address" value="${sv.address}"> <br>
    <label>Age: </label>
    <input type="text" name="age" value="${sv.age}"> <br>
    <label>Class: </label>
    <select name="lopHoc">
        <c:forEach items="${lstLopHoc}" var="l">
            <option value="${l.id}" ${l.id==sv.lopHoc.id?'selected':''}>${l.class_name}</option>
        </c:forEach>
    </select> <br>
    <label>Status: </label>
    <input type="radio" name="status" value="active" ${sv.status=="active"?"checked":""}> Active
    <input type="radio" name="status" value="inactive" ${sv.status=="inactive"?"checked":""}> Inactive <br>
    <button type="submit">ADD</button>
</form>
<table>
    <thead>
    <tr>
        <td>ID</td>
        <td>name</td>
        <td>address</td>
        <td>age</td>
        <td>Status</td>
        <td>Class</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="sinhVien" items="${list}">
        <tr>
            <td>${sinhVien.id}</td>
            <td>${sinhVien.name}</td>
            <td>${sinhVien.address}</td>
            <td>${sinhVien.age}</td>
            <td>${sinhVien.status}</td>
            <td>${sinhVien.lopHoc.class_name}</td>
            <td><a href="/sinhvien/delete/${sinhVien.id}">Xoa</a></td>
            <td><a href="/sinhvien/detail/${sinhVien.id}">Detail</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div>
    <a href="/page?page=${pagemin}&size=2"><button>First</button></a>
    <a href="/page?page=${pageRevious}&size2"><button>Revious</button></a>
    <a href="/page?page=${pageNext}&size=2"><button >Next</button></a>
    <a href="/page?page=${pagemax}&size=2"><button >Last</button></a>
</div>
</body>
</html>