<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/homeStu.css">
</head>
<body>
<div class="container">
    <!-- 上部导航栏 -->
    <div class="top-nav">
        <div class="left">
            <h2>
                <%=session.getAttribute("sname")%>
                同学你好！
            </h2>
        </div>
        <div class="center">
            <h1>学生成绩管理系统</h1>
        </div>
        <form action="" method="post" class="person">
            <div class="person-left">
                <img src="${pageContext.request.contextPath}/images/3.jpg" alt="photo">
                <p><%=session.getAttribute("sname")%> </p>
            </div>
<%--            <a id="webChat" href="ex4-17-login.jsp" target="showView">聊天室🐰 &nbsp;&nbsp;|</a>--%>
            <a id="exit" href="${pageContext.request.contextPath}/student/toIndex" onclick="return confirm('确定要退出吗?');">退出登录</a>
        </form>
    </div>
    <!-- 左部导航栏 -->
    <div class="page-center">
        <div class="left-nav">
            <li><a href="${pageContext.request.contextPath}/student/showStuInfo" target="showView">个人主页</a></li>
            <li><a href="${pageContext.request.contextPath}/student/getStuAllScore" target="showView">总成绩单</a></li>
            <li><a href="${pageContext.request.contextPath}/student/getStuRequireScore" target="showView">查询成绩</a></li>
            <li><a href="${pageContext.request.contextPath}/student/getStuSelectCourse" target="showView">选课</a></li>
        </div>
        <!-- 中间内容区 -->
        <div class="showBox">
            <iframe class="showView" name="showView" src="${pageContext.request.contextPath}/welcome/welcome">
            </iframe>
        </div>
    </div>
</div>

</body>
</html>
