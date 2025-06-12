<%@ page import="org.example.pojo.StudentGrade" %>
<%@ page import="org.example.pojo.Student" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>总成绩页面</title>
  <!-- 新 Bootstrap5 核心 CSS 文件 -->
  <link rel="stylesheet" href="https://lf26-cdn-tos.bytecdntp.com/cdn/expire-1-M/twitter-bootstrap/5.1.3/css/bootstrap.min.css">

  <!--  popper.min.js 用于弹窗、提示、下拉菜单 -->
  <script src="https://lf6-cdn-tos.bytecdntp.com/cdn/expire-1-M/popper.js/2.11.2/umd/popper.min.js"></script>

  <!-- 最新的 Bootstrap5 核心 JavaScript 文件 -->
  <script src="https://lf26-cdn-tos.bytecdntp.com/cdn/expire-1-M/twitter-bootstrap/5.1.3/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/allScore.css">
</head>
<body>
<%
  response.setCharacterEncoding("UTF-8");
  request.setCharacterEncoding("UTF-8");
%>
<a href="${pageContext.request.contextPath}/welcome/welcome" id="exit"> < 返回</a>


<div class="container mt-3">
  <h1>成 绩 单</h1>

  <p class="zhu">🟢优秀</p>
  <p class="zhu">🔴挂科</p>
  <table class="table table-light table-hover content">
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
    <c:forEach var="score" items="${studentGrade}">
      <tr>
        <td>${score.sno}</td>
        <td>${score.sname}</td>
        <td>${score.cno}</td>
        <td>${score.cname}</td>
        <td>${score.score}</td>
        <td>${score.examtime}</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
  <p class="small">*若考试成绩和日期暂无 请等待管理员上传</p>
</div>
<script>
  window.addEventListener('DOMContentLoaded', (event) => {
    const table = document.querySelector('.content');
    const rows = table.querySelectorAll('tr');

    rows.forEach(row => {
      const scoreCell = row.querySelector('td:nth-of-type(5)'); // 获取成绩列
      const examDateCell = row.querySelector('td:nth-of-type(6)'); // 获取考试日期列

      // 检查成绩和考试日期
      if (scoreCell) {
        const score = parseInt(scoreCell.innerText); // 获取成绩，并转为整数

        // 如果成绩为0，显示“无”
        if (score === 0) {
          scoreCell.innerText = '暂无';
        } else if (score < 60) {
          scoreCell.style.backgroundColor = 'rgba(223, 25, 25, 0.42)'; // 设置背景色为红色
        } else if (score >= 90) {
          scoreCell.style.backgroundColor = 'rgba(128, 222, 158, 0.65)'; // 设置背景色为绿色
        }
      }

      // 检查考试日期是否为空
      if (examDateCell) {
        const examDate = examDateCell.innerText.trim(); // 获取考试日期并去除空格

        // 如果考试日期为空，显示“无”
        if (examDate === '') {
          examDateCell.innerText = '       ---';
        }
      }
    });
  });
</script>
</body>
</html>