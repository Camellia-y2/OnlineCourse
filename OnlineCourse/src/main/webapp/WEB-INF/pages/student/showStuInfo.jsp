<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.example.pojo.Student" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>学生个人主页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/showStuInfo.css">
</head>

<body>
<%
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");

    // 从控制器获取学生信息（该步骤在控制器中处理，并通过请求传递 Student 对象）
    Student student = (Student) request.getAttribute("student");
%>

<!-- 详细信息页面 -->
<a href="${pageContext.request.contextPath}/welcome/welcome" id="exit">
    < 返回</a>
<h1>个 人 主 页</h1>
<div class="page">

    <div class="top">
        <form action="${pageContext.request.contextPath}/student/showStuInfo" method="post" class="specificMessage">
            <div class="leftpage">
                <p>姓名：<span id="name">${student.sname}</span></p>
                <p>学号：<span id="id">${student.sno}</span></p>
                <p>密码：<span id="password">${student.spwd}</span></p>
<%--                <p>性别：<span id="sex">${student.sex}</span></p>--%>
<%--                <p>学校：<span id="school">${student.school}</span></p>--%>
            </div>
            <!-- 证件照 -->
            <div class="rightpage">
                <img alt="证件照" src="${pageContext.request.contextPath}/images/3.jpg">
            </div>
        </form>
    </div>

    <!-- 修改个人信息按钮 -->
    <div class="bottom">
        <form action="${pageContext.request.contextPath}/student/infoUpdate" method="post">
            <button id="changeMessage"> 修改个人信息 </button>
        </form>
    </div>
</div>
</body>
</html>