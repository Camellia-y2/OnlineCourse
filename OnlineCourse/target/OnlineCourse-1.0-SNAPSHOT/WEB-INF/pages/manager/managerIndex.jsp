<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 2025/1/1
  Time: 22:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员页面</title>
    <link rel="stylesheet" href="css/mIndex.css">
</head>
<body>
<div class="nav">
    <div class="mname">
        <span><img src="images/uhead.jpg"></span>
        <p class="name"><%=session.getAttribute("mname") %></p>
    </div>
    <div class="index">
        <a href="${pageContext.request.contextPath}/welcome/welcome" target="showView">首页</a>
    </div>
    <ul class="navitem">
        <li><a href="javascript:;">用户管理</a>
            <ul class="fm">
                <li class="updatef"><a href="${pageContext.request.contextPath}/manager/userInfo" target="showView">信息更新</a></li>
            </ul></li>
        <li><a href="#">课程管理</a>
            <ul class="um">
                <li class="updateu"><a href="${pageContext.request.contextPath}/manager/courseInfo" target="showView">课程信息</a></li>
            </ul></li>
        <li><a href="#">学生成绩管理</a>
            <ul class="pm">
                <li class="updates"><a href="${pageContext.request.contextPath}/manager/studentGradeInfo" target="showView">考核成绩</a></li>
                <li class="updatep"><a href="${pageContext.request.contextPath}/manager/getGradeSummary" target="showView">学生成绩统计</a></li>
            </ul></li>
    </ul>
</div>
<script type="text/javascript">
    var aBs = document.querySelectorAll('.navitem li a');
    var liBs = document.querySelectorAll('.navitem li');
    for (var i = 0; i < aBs.length; i++) {
        aBs[i].addEventListener('click', function () {
            var ul = this.nextElementSibling;
            if (ul.style.display === 'block') {
                ul.style.display = 'none';
            } else {
                ul.style.display = 'block'
            }
        });
        aBs[i].addEventListener('mouseenter', function () {
            var ul = this.nextElementSibling;
            ul.style.display = 'block';
        });
    }
</script>
<div class="navT">
    <p></p>
    <i>管理员▼</i>
<%--    <button class="chat"></button>--%>
<%--    <em>|</em>--%>
    <button class="leave">退出</button>
</div>
<div class="showBox" style="height: 750px;">
    <iframe class="showView" name="showView" src="${pageContext.request.contextPath}/welcome/welcome">

    </iframe>
</div>
<script>
    var leave = document.querySelector('.leave');
    leave.addEventListener('click', function() {
        window.location.href = '${pageContext.request.contextPath}';
    });
    var chat = document.querySelector('.chat');
    chat.addEventListener('click', function() {
        window.location.href = 'chatRoom';
    });
</script>
</body>
</html>
