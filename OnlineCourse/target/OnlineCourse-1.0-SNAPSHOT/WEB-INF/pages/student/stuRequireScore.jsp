<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="org.example.pojo.StudentGrade" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>学生查询成绩页面</title>
    <link rel="stylesheet" href="https://lf26-cdn-tos.bytecdntp.com/cdn/expire-1-M/twitter-bootstrap/5.1.3/css/bootstrap.min.css">
    <script src="https://lf6-cdn-tos.bytecdntp.com/cdn/expire-1-M/popper.js/2.11.2/umd/popper.min.js"></script>
    <script src="https://lf26-cdn-tos.bytecdntp.com/cdn/expire-1-M/twitter-bootstrap/5.1.3/js/bootstrap.min.js"></script>
    <style>
        body {
            background-color: rgba(93, 118, 152, 0.35);
        }
        #exit {
            text-decoration: none;
            color: black;
            position: relative;
            top: 12px;
            left: 13px;
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
        }
        .form2 {
            width: 60%;
            margin-top: 4px;
        }
        #btn1, #btn2 {
            background-color: #678ce0;
            border: 0;
        }
        #btn3 {
            background-color: #2da67b;
        }
        #btn4 {
            background-color: #cc4444;
        }
    </style>
</head>

<body>
<a href="${pageContext.request.contextPath}/welcome/welcome" id="exit"> < 返回</a>

<div class="container mt-3">
    <h2>学生查询页面</h2>
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="form1">
                <form action="${pageContext.request.contextPath}/student/stuRequireScoreByCno" method="post" class="mb-3">
                    <div class="input-group">
                        <input type="text" id="cno" name="cno" class="form-control" placeholder="课程编号">
                        <button type="submit" name="queryBy" id="btn1" class="btn btn-primary">按课程号查询</button>
                    </div>
                </form>
                <form action="${pageContext.request.contextPath}/student/stuRequireScoreByCname" method="post" class="mb-3">
                    <div class="input-group">
                        <input type="text" id="cname" name="cname" class="form-control" placeholder="课程名">
                        <button type="submit" name="queryBy" id="btn2" class="btn btn-primary">按课程名查询</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-md-5">
            <div class="form2">
                <form action="${pageContext.request.contextPath}/student/stuRequireAllScores" method="post" class="mb-2">
                    <button type="submit" value="查询所有成绩" id="btn3" class="btn btn-success w-100">查询所有成绩</button>
                </form>
                <form action="${pageContext.request.contextPath}/student/stuRequireFailingCourses" method="post">
                    <button type="submit" value="查询挂科课程" id="btn4" class="btn btn-danger w-100">查询挂科课程</button>
                </form>
            </div>
        </div>
    </div>

    <table class="table table-light table-hover content mt-4">
        <thead>
        <tr>
            <th>学号</th>
            <th>姓名</th>
            <th>课程编号</th>
            <th>课程名</th>
            <th>成绩</th>
            <th>考试日期</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="score" items="${scoreList}">
            <tr>
                <td>${score.sno}</td>
                <td>${score.sname}</td>
                <td>${score.cno}</td>
                <td>${score.cname}</td>
                <td>
                    <c:choose>
                        <c:when test="${score.score == 0}">
                            暂无
                        </c:when>
                        <c:otherwise>
                            ${score.score}
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <c:choose>
                        <c:when test="${empty score.examtime}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;---
                        </c:when>
                        <c:otherwise>
                            ${score.examtime}
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <p class="small">*若考试成绩和日期暂无 请等待管理员上传</p>
</div>
</body>
</html>