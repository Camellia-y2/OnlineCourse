<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/statistics.css">
</head>
<body>
    <div class="Box">
        <div class="queryBox">
            <form action="${pageContext.request.contextPath}/manager/queryStatistics" method="post" name="queryFlower">
                <span>学号：<input type="text" name="sno" class="querySno" /></span>
                <span>姓名：<input type="text" name="sname" class="querySname" /></span>
                <input type="reset" value="重置" class="queryReset" />
                <button type="submit" class="querySubmit">查询</button>
            </form>

        </div>

        <div class="Head">
            <table class="title">
                <tr class="tHead">
                    <td>学号</td>
                    <td>姓名</td>
                    <td>已获学分</td>
                    <td>通过课程门数</td>
                    <td>不及格门数</td>
                    <td>各科平均成绩</td>
                </tr>
            </table>
        </div>
        <div class="flowerData">
            <table class="flowerTable">
                <c:forEach var="statistics" items="${statisticsList}">
                    <tr>
                        <td>${statistics.sno}</td>
                        <td>${statistics.sname}</td>
                        <td>${statistics.totalCredits}</td>
                        <td>${statistics.passedCourses}</td>
                        <td>${statistics.failedCourses}</td>
                        <td>${statistics.averageScore}</td>
                    </tr>
                </c:forEach>
            </table>
            </div>
    </div>
</body>
</html>