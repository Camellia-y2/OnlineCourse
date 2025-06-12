<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>修改个人信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/infoStuUpdate.css">
    <style type="text/css">
        input[readonly] {
            background-color: rgba(167, 155, 155, 0.6); /* 灰色背景色 */
            cursor: not-allowed; /* 鼠标样式为禁止 */
        }
    </style>
</head>

<body>
<%
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");

    session = request.getSession(); // 正确获取 session 对象
    String sno = (String) session.getAttribute("sno");
    String sname = (String) session.getAttribute("sname");

%>

<a href="${pageContext.request.contextPath}/student/showStuInfo" id="exit"> < 返回</a>
<form action="${pageContext.request.contextPath}/student/infoDoUpdate" method="post" class="page">
    <h1>修改个人信息</h1>
    <div><span>学号: &nbsp;</span><input type="text" id="sno" name="sno" placeholder="id" readonly="readonly" value="<%= sno %>"></div>
    <div><span>姓名:</span><input type="text" id="sname" name="sname" placeholder="name" readonly="readonly" value="<%= sname %>"></div>
    <div><span>密码:</span><input type="password" id="spwd" name="spwd" placeholder="password"></div>
    <input type="submit" value="更新" id="updateInfo">
<%--    添加一个更新成功后的弹窗--%>
</form>
</body>
</html>