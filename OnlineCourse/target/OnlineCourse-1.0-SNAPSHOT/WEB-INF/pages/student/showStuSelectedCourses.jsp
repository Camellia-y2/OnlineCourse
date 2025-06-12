<%@ page import="org.example.pojo.StudentGrade" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>所选课程页面</title>
    <link rel="stylesheet" href="https://lf26-cdn-tos.bytecdntp.com/cdn/expire-1-M/twitter-bootstrap/5.1.3/css/bootstrap.min.css">
    <script src="https://lf6-cdn-tos.bytecdntp.com/cdn/expire-1-M/popper.js/2.11.2/umd/popper.min.js"></script>
    <script src="https://lf26-cdn-tos.bytecdntp.com/cdn/expire-1-M/twitter-bootstrap/5.1.3/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/selectCourse.css">
</head>
<body>
<a href="${pageContext.request.contextPath}/student/getStuSelectCourse" id="exit"> < 返回</a>

<div class="container mt-3">
    <h2>所选课程</h2>
    <table class="table table-light table-hover content">
        <thead>
        <tr>
            <th>学号</th>
            <th>姓名</th>
            <th>课程编号</th>
            <th>课程名</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="sg" items="${studentGrade}">
            <tr>
                <td>${sg.sno}</td>
                <td>${sg.sname}</td>
                <td>${sg.cno}</td>
                <td>${sg.cname}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>