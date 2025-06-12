<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.pojo.Course" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>选课页面</title>

    <!-- 新 Bootstrap5 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://lf26-cdn-tos.bytecdntp.com/cdn/expire-1-M/twitter-bootstrap/5.1.3/css/bootstrap.min.css">

    <!-- popper.min.js 用于弹窗、提示、下拉菜单 -->
    <script src="https://lf6-cdn-tos.bytecdntp.com/cdn/expire-1-M/popper.js/2.11.2/umd/popper.min.js"></script>

    <!-- 最新的 Bootstrap5 核心 JavaScript 文件 -->
    <script src="https://lf26-cdn-tos.bytecdntp.com/cdn/expire-1-M/twitter-bootstrap/5.1.3/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/selectCourse.css">
</head>
<body>
<a href="${pageContext.request.contextPath}/welcome/welcome" id="exit"> < 返回</a>

<div class="container mt-3">
    <h2 class="text-center">选课页面</h2>
    <form id="courseForm" action="${pageContext.request.contextPath}/student/selectCourses" method="post">
        <table class="table table-light table-hover">
            <thead>
            <tr>
                <th>选择</th>
                <th>课程编号</th>
                <th>课程名</th>
                <th>学分</th>
                <th>理论学时</th>
                <th>实践学时</th>
                <th>考核方式</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="course" items="${courseList}">
                <tr>
                    <td><input type="checkbox" name="courseCheckbox" value="${course.cno}"></td>
                    <td>${course.cno}</td>
                    <td>${course.cname}</td>
                    <td>${course.credit}</td>
                    <td>${course.ttime}</td>
                    <td>${course.ptime}</td>
                    <td>${course.exam}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <input type="button" value="确认选课" class="btn btn-primary btn-block" data-bs-toggle="modal" data-bs-target="#confirmModal">
    </form>
    <div>
        <button class="btn btn-primary btn-block">
            <a href="${pageContext.request.contextPath}/student/getShowStuSelectedCourses" style="color: white; text-decoration: none;">查看所选课程</a>
        </button>
    </div>
</div>

<!-- 确认模态框 -->
<div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="confirmModalLabel">确认选课</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                请确认您选择的课程。您是否确认选课？
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="confirmBtn">确认</button>
            </div>
        </div>
    </div>
</div>

<!-- 提示模态框 -->
<div class="modal fade" id="alertModal" tabindex="-1" aria-labelledby="alertModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="alertModalLabel">警告</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                请至少选择一门课程！
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">确定</button>
            </div>
        </div>
    </div>
</div>

<!-- 选课成功模态框 -->
<div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="successModalLabel">选课成功</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                您已成功选课！
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">确定</button>
            </div>
        </div>
    </div>
</div>

<script>
    document.getElementById('confirmBtn').addEventListener('click', function() {
        const checkboxes = document.querySelectorAll('input[name="courseCheckbox"]:checked');
        if (checkboxes.length === 0) {
            // 打开警告模态框
            const alertModal = new bootstrap.Modal(document.getElementById('alertModal'));
            alertModal.show();
            return;
        }

        // 提交表单并显示成功模态框
        document.getElementById('courseForm').addEventListener('submit', function() {
            const successModal = new bootstrap.Modal(document.getElementById('successModal'));
            successModal.show();
        });

        document.getElementById('courseForm').submit(); // 提交表单
    });
</script>
</body>
</html>
<%--<%@ page contentType="text/html; charset=UTF-8" %>--%>
<%--<%@ page import="java.util.List" %>--%>
<%--<%@ page import="org.example.pojo.Course" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>

<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>选课页面</title>--%>

<%--    <!-- 新 Bootstrap5 核心 CSS 文件 -->--%>
<%--    <link rel="stylesheet" href="https://lf26-cdn-tos.bytecdntp.com/cdn/expire-1-M/twitter-bootstrap/5.1.3/css/bootstrap.min.css">--%>

<%--    <!--  popper.min.js 用于弹窗、提示、下拉菜单 -->--%>
<%--    <script src="https://lf6-cdn-tos.bytecdntp.com/cdn/expire-1-M/popper.js/2.11.2/umd/popper.min.js"></script>--%>

<%--    <!-- 最新的 Bootstrap5 核心 JavaScript 文件 -->--%>
<%--    <script src="https://lf26-cdn-tos.bytecdntp.com/cdn/expire-1-M/twitter-bootstrap/5.1.3/js/bootstrap.min.js"></script>--%>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/selectCourse.css">--%>
<%--</head>--%>
<%--<body>--%>
<%--<a href="${pageContext.request.contextPath}/welcome/welcome" id="exit"> < 返回</a>--%>

<%--<div class="container mt-3">--%>
<%--    <h2 class="text-center">选课页面</h2>--%>
<%--    <form action="${pageContext.request.contextPath}/student/selectCourses" method="post" onsubmit="return confirmSelection()">--%>
<%--    <table class="table table-light table-hover">--%>
<%--        <thead>--%>
<%--        <tr>--%>
<%--            <th>选择</th>--%>
<%--            <th>课程编号</th>--%>
<%--            <th>课程名</th>--%>
<%--            <th>学分</th>--%>
<%--            <th>理论学时</th>--%>
<%--            <th>实践学时</th>--%>
<%--            <th>考核方式</th>--%>
<%--        </tr>--%>
<%--        </thead>--%>
<%--        <tbody>--%>
<%--            <c:forEach var="course" items="${courseList}">--%>
<%--                <tr>--%>
<%--                    <td><input type="checkbox" name="courseCheckbox" value="${course.cno}"></td>--%>
<%--                    <td>${course.cno}</td>--%>
<%--                    <td>${course.cname}</td>--%>
<%--                    <td>${course.credit}</td>--%>
<%--                    <td>${course.ttime}</td>--%>
<%--                    <td>${course.ptime}</td>--%>
<%--                    <td>${course.exam}</td>--%>
<%--                </tr>--%>
<%--            </c:forEach>--%>

<%--        </tbody>--%>
<%--    </table>--%>
<%--        <input type="submit" value="确认选课" class="btn btn-primary btn-block">--%>
<%--  </form>--%>
<%--    <div>--%>
<%--        <button class="btn btn-primary btn-block">--%>
<%--            <a href="${pageContext.request.contextPath}/student/getShowStuSelectedCourses">查看所选课程</a></button>--%>
<%--    </div>--%>
<%--</div>--%>

<%--</body>--%>
<%--<script>--%>
<%--    function confirmSelection() {--%>
<%--        const checkboxes = document.querySelectorAll('input[name="courseCheckbox"]:checked');--%>
<%--        if (checkboxes.length === 0) {--%>
<%--            alert("请至少选择一门课程！");--%>
<%--            return false;--%>
<%--        }--%>
<%--        if (confirm("你是否确认选课？")) {--%>
<%--            alert("选课成功！");--%>
<%--            return true;--%>
<%--        }--%>
<%--        return false;--%>
<%--    }--%>

<%--</script>--%>
<%--</html>--%>