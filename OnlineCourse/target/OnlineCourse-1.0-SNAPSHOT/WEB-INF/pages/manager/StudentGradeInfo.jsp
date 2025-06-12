<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 2025/1/3
  Time: 14:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.pojo.Course" %>
<html>
<head>
  <title>学生课程学习管理</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    em, i {
      font-style: normal;
    }

    input[type="reset"], button {
      cursor: pointer;

    }
    .updateSubmit,.goBackUpdate{
      margin-top: 10px;
      background-color: rgb(48, 169, 244);
      color: rgb(247, 248, 248);
    }

    a {
      display: inline-block;
      text-decoration: none;
    }

    .addfBox,.updateBox {
      position: fixed;
      top: 120px;/*表单距离顶部*/
      left: 36%;
      width: 380px;
      height: 450px;
      text-align: center;
      background-color: white;
      border: 1px solid rgb(206, 196, 196);
      box-shadow: 0 0 10px 5px rgba(203, 199, 199, 0.6);
      border-radius: 8px;
      z-index: 10;
    }

    .addfBox input[type="text"],
    .updateBox input[type="text"]{
      margin-bottom: 1px;
      margin-top: 20px;
      width: 140px;
      height: 23px;
      text-align: center;
    }

    .addfBox h3,
    .updateBox h3{
      margin-top: 20px;
      margin-left: 16px;
      margin-bottom: 20px;
    }

    .updateScore{
      margin-right: 32px;
    }

    .updateSubmit:hover,.goBackUpdate:hover {
      color: blue;
    }

    .updateSubmit {
      margin-top: 18px;
      margin-left: 26px;
      width: 60px;
      height: 30px;
      border: none;
      border-radius: 12px;
      background-color: rgb(234, 87, 87);
    }

    .goBackUpdate {
      margin-top: 18px;
      margin-left: 46px;
      width: 60px;
      height: 30px;
      border: none;
      border-radius: 12px;
    }

    .score{
      margin-left: 22px;
    }
    .updateExamTime{
      margin-right: 16px;
    }

    .updateCname,.updateCno{
      margin-right: 11px;
    }

  </style>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mCourse.css">
</head>
<body>
<div class="Box">
  <div class="queryBox">
    <form action="" method="post" name="queryFlower">
      <span>学号：<input type="text" name="sno" class="querySno" /></span>
      <span>学生：<input type="text" name="sname" class="querySname" /></span>
      <span>课程号：<input type="text" name="cno" class="queryCno" /></span>
      <span>课程名：<input type="text" name="cname" class="queryCname" /></span>
      <input type="reset" value="重置" class="queryReset" />
      <button type="button" class="querySubmit">查询</button>
    </form>
  </div>
  <div class="Head">
    <table class="title">
      <tr class="tHead">
        <td>学号</td>
        <td>学生</td>
        <td>课程号</td>
        <td>课程名</td>
        <td>成绩</td>
        <td>考核时间</td>
        <td>更新</td>
        <td>删除</td>
      </tr>
    </table>
  </div>
  <div class="flowerData">
    <table class="flowerTable">
      <!-- 查询结果会动态填充到这里 -->
    </table>
  </div>
</div>

<%--更新课程表单--%>
<div class="updateBox" style="display: none">
  <form action="" method="post" name="updateCourse">
    <h3>更新成绩信息</h3>
    学号：<input type="text" value="" name="sno" class="updateSno" readonly /><br/>
    学生：<input type="text" value="" name="sname" class="updateSname" readonly/><br/>
    课程号：<input type="text" value="" name="cno" class="updateCno" readonly/><br/>
    课程名：<input type="text" value="" name="cname" class="updateCname" readonly/><br/>
    <span class="score">成绩：</span><input type="text" value="" name="score" class="updateScore" /><br/>
    考核时间：<input type="text" value="" name="examtime" class="updateExamTime" /><br/>
    <button class="updateSubmit">更新</button>
    <button class="goBackUpdate">关闭</button>
  </form>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  // 查询全部成绩数据
  $(document).ready(function() {

    // 查询全部课程数据
    $.ajax({
      type: 'GET',
      url: '${pageContext.request.contextPath}/manager/queryGrades', // 确保URL与Controller一致
      data: {flag: 1},
      contentType: "application/x-www-form-urlencoded; charset=UTF-8",
      success: function(data) {
        $('.flowerTable').html(data);
      },
      error: function(error) {
        console.log("Error: ", error);
      }
    });

    // 查询按钮点击事件
    $('.querySubmit').click(function(e) {
      e.preventDefault();
      var querySno = $('.querySno').val();
      var querySname = $('.querySname').val();
      var queryCno = $('.queryCno').val();
      var queryCname = $('.queryCname').val();

      // 发起查询请求
      $.ajax({
        type: 'GET',
        url: '${pageContext.request.contextPath}/manager/queryGrades', // 确保URL与Controller一致
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        data: {flag: 0, sno: querySno, sname: querySname, cno: queryCno, cname: queryCname },
        success: function(data) {
          $('.flowerTable').html(data);
        },
        error: function(error) {
          console.log("Error: ", error);
        }
      });
    });
  });


  // 删除按钮点击事件
  $(document).on('click', '.deleteBt', function(e) {
    e.preventDefault(); // 阻止默认行为
    // 获取学生成绩数据
    var gradeData = {
      sno: $(this).data('sno'),
      cno: $(this).data('cno'),
    };
    // AJAX 请求删除该学生成绩
    $.ajax({
      type: 'GET',
      url: '${pageContext.request.contextPath}/manager/deleteGrade',
      data: { sno: gradeData.sno, cno: gradeData.cno }, // 发送学生编号和课程编号
      success: function(response) {
        if (response === "success") {
          // 刷新成绩列表
          $.ajax({
            type: 'GET',
            url: '${pageContext.request.contextPath}/manager/queryGrades',
            data: { flag: 1 },
            success: function(data) {
              $('.flowerTable').html(data); // 更新课程列表
            },
            error: function(error) {
              console.log("Error: ", error);
            }
          });
        } else {
          alert("删除失败，请稍后重试。");
        }
      },
      error: function(error) {
        console.log("错误：", error);
        alert("删除请求失败。");
      }
    });
  });

  // 更新按钮点击事件
  $(document).on('click', '.updateBt', function(e) {
    e.preventDefault(); // 阻止默认行为
    // 获取学生成绩数据
    var gradeData = {
      sno: $(this).data('sno'),
      sname: $(this).data('sname'), // 新增
      cno: $(this).data('cno'),
      cname: $(this).data('cname'), // 新增
      score: $(this).data('score'),
      examtime: $(this).data('examtime')
    };

    // 填充更新表单
    $('.updateSno').val(gradeData.sno);
    $('.updateSname').val(gradeData.sname); // 新增
    $('.updateCno').val(gradeData.cno);
    $('.updateCname').val(gradeData.cname); // 新增
    $('.updateScore').val(gradeData.score);
    $('.updateExamTime').val(gradeData.examtime);

    // 显示更新表单
    $('.updateBox').toggle(); // 使用 toggle() 方法显示表单
  });

  // 更新成绩 AJAX 请求
  $('form[name="updateCourse"]').on('submit', function(e) {
    e.preventDefault(); // 阻止默认表单提交

    // 收集表单数据
    var formData = {
      sno: $('.updateSno').val(),
      sname: $('.updateSname').val(), // 新增
      cno: $('.updateCno').val(),
      cname: $('.updateCname').val(), // 新增
      score: $('.updateScore').val(),
      examtime: $('.updateExamTime').val()
    };

    // AJAX 请求更新学生成绩
    $.ajax({
      type: 'POST',
      url: '${pageContext.request.contextPath}/manager/updateGrade', // 确保此 URL 与控制器一致
      data: formData,
      success: function(response) {
        if (response === "success") {
          // 刷新成绩列表
          $.ajax({
            type: 'GET',
            url: '${pageContext.request.contextPath}/manager/queryGrades',
            data: { flag: 1 },
            success: function(data) {
              $('.flowerTable').html(data); // 更新课程列表
            },
            error: function(error) {
            }
          });
        } else {
          alert("更新失败，请稍后重试。");
        }
      },
      error: function(error) {
        console.log("更新成绩错误：", error);
        alert("更新请求失败。");
      }
    });
  });

  // 关闭更新表单事件
  $('.goBackUpdate').click(function(e) {
    e.preventDefault(); // 阻止默认行为
    $('.updateBox').hide(); // 隐藏更新表单
  });
</script>

</body>
</html>
