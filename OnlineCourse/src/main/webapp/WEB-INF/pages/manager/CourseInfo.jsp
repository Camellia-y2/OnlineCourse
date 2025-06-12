<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 2025/1/2
  Time: 14:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.pojo.Course" %>
<html>
<head>
  <title>查询课程</title>
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
    .addSubmit,.goBack,.goBackUpdate{
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


    .addPtime,
    .updatePtime{
      margin-right: 32px;
    }

    .goBack:hover, .addSubmit:hover,.updateSubmit:hover,.goBackUpdate:hover {
      color: blue;
    }

    .addSubmit,.updateSubmit {
      margin-top: 18px;
      margin-left: 26px;
      width: 60px;
      height: 30px;
      border: none;
      border-radius: 12px;
      background-color: rgb(234, 87, 87);
    }

    .goBack,.goBackUpdate {
      margin-top: 18px;
      margin-left: 46px;
      width: 60px;
      height: 30px;
      border: none;
      border-radius: 12px;
    }

    .addCredit,.updateCredit{
      margin-left: 16px;
    }
    .addExamType,.addPtime,.addTtime,
    .updateExamType,.updatePtime,.updateTtime{
      margin-right: 13px;
    }
  </style>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mCourse.css">
</head>
<body>
<div class="Box">
  <div class="queryBox">
    <form action="" method="post" name="queryFlower">
      <span>课程号：<input type="text" name="cno" class="queryFid" /></span>
      <span>课程名：<input type="text" name="cname" class="queryFtype" /></span>
      <input type="reset" value="重置" class="queryReset" />
      <button type="button" class="querySubmit">查询</button>
      <button class="addBt">新增</button>
    </form>
  </div>
  <div class="Head">
    <table class="title">
      <tr class="tHead">
        <td>课程号</td>
        <td>课程名</td>
        <td>学分</td>
        <td>理论学时</td>
        <td>实践学时</td>
        <td>考核方式</td>
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
<%--添加课程表单--%>
  <div class="addfBox" style="display: none">
    <form action="" method="post"
          name="addFlower">
      <h3>新增课程信息</h3>
      课程号：<input type="text" value="" name="cno" class="addCno" /><br/>
      课程名：<input type="text" value="" name="cname" class="addCname" /><br/>
      学分：<input type="text" value="" name="credit" class="addCredit" /><br/>
      理论学时：<input type="text" value="" name="ttime" class="addTtime" /><br/>
      实践学时：<input type="text" value="" name="ptime" class="addPtime" /><br/>
      考核方式：<input type="text" value="" name="exam" class="addExamType" /><br/>
      <button class="addSubmit" name="addFlower">添加</button>
      <button class="goBack">关闭</button>
    </form>
  </div>
<%--更新课程表单--%>
<div class="updateBox" style="display: none">
  <form action="" method="post" name="updateCourse">
    <h3>更新课程信息</h3>
    课程号：<input type="text" value="" name="cno" class="updateCno" readonly /><br/>
    课程名：<input type="text" value="" name="cname" class="updateCname" /><br/>
    学分：<input type="text" value="" name="credit" class="updateCredit" /><br/>
    理论学时：<input type="text" value="" name="ttime" class="updateTtime" /><br/>
    实践学时：<input type="text" value="" name="ptime" class="updatePtime" /><br/>
    考核方式：<input type="text" value="" name="exam" class="updateExamType" /><br/>
    <button class="updateSubmit">更新</button>
    <button class="goBackUpdate">关闭</button>
  </form>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  $(document).ready(function() {

    // 查询全部课程数据
    $.ajax({
      type: 'GET',
      url: '${pageContext.request.contextPath}/manager/queryCourses', // 确保URL与Controller一致
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
      var queryFid = $('.queryFid').val();
      var queryFtype = $('.queryFtype').val();

      // 发起查询请求
      $.ajax({
        type: 'GET',
        url: '${pageContext.request.contextPath}/manager/queryCourses', // 确保URL与Controller一致
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        data: {flag: 0, cno: queryFid, cname: queryFtype},
        success: function(data) {
          $('.flowerTable').html(data);
        },
        error: function(error) {
          console.log("Error: ", error);
        }
      });
    });
  });
  // 删除按钮的点击事件
  $(document).on('click', '.deleteBt', function(e) {
    e.preventDefault(); // 阻止默认行为
    var cno = $(this).attr('href').split('=')[1]; // 获取课程编号

    // 发起删除请求
    $.ajax({
      type: 'GET',
      url: '${pageContext.request.contextPath}/manager/deleteCourse',
      data: { cno: cno },
      success: function(response) {
        if (response === "success") {
          // 删除成功后重新查询课程
          $.ajax({
            type: 'GET',
            url: '${pageContext.request.contextPath}/manager/queryCourses',
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
        console.log("Error: ", error);
        alert("删除请求失败。");
      }
    });
  });
  // 新增课程的 AJAX 请求
  $('.addBt').click(function(e) {
    e.preventDefault(); // Prevent default anchor behavior
    $('.addfBox').toggle(); // Toggle visibility of the add form
  });
  $('form[name="addFlower"]').on('submit', function(e) {
    e.preventDefault(); // 阻止默认表单提交
    // 获取表单数据
    var formData = {
      cno: $('.addCno').val(),
      cname: $('.addCname').val(),
      credit: $('.addCredit').val(),
      ttime: $('.addTtime').val(),
      ptime: $('.addPtime').val(),
      exam: $('.addExamType').val()
    };

    // 发起 AJAX 请求以添加新课程
    $.ajax({
      type: 'GET',
      url: '${pageContext.request.contextPath}/manager/addCourse', // 确保此 URL 与控制器一致
      data: formData,
      success: function(response) {
        if (response === "success") {
          // 新增成功后重新查询课程
          $.ajax({
            type: 'GET',
            url: '${pageContext.request.contextPath}/manager/queryCourses',
            data: { flag: 1 },
            success: function(data) {
              $('.flowerTable').html(data); // 更新课程列表
            },
            error: function(error) {
              console.log("Error:", error);
            }
          });
        } else {
          alert("添加失败，请稍后重试。"); // 提示添加失败
        }
      },
      error: function(error) {
        console.log("Error", error);
        alert("添加请求失败。"); // 提示请求失败
      }
    });
  });

  // 关闭新增表单的事件处理
  $('.goBack').click(function(e) {
    e.preventDefault(); // 阻止默认行为
    $('.addfBox').hide(); // 隐藏新增表单
  });

  // 更新按钮的点击事件
  $(document).on('click', '.updateBt', function(e) {
    e.preventDefault(); // 阻止默认行为

    // 获取课程信息
    var cno = $(this).data('cno');
    var cname = $(this).data('cname');
    var credit = $(this).data('credit');
    var ttime = $(this).data('ttime');
    var ptime = $(this).data('ptime');
    var exam = $(this).data('exam');

    // 填充更新表单
    $('.updateCno').val(cno);
    $('.updateCname').val(cname);
    $('.updateCredit').val(credit);
    $('.updateTtime').val(ttime);
    $('.updatePtime').val(ptime);
    $('.updateExamType').val(exam);

    // 显示更新表单
    $('.updateBox').toggle();
  });
  // 更新课程的 AJAX 请求
  $('form[name="updateCourse"]').on('submit', function(e) {
    e.preventDefault(); // 阻止默认表单提交

    // 获取表单数据
    var formData = {
      cno: $('.updateCno').val(),
      cname: $('.updateCname').val(),
      credit: $('.updateCredit').val(),
      ttime: $('.updateTtime').val(),
      ptime: $('.updatePtime').val(),
      exam: $('.updateExamType').val()
    };

    // 发起 AJAX 请求以更新课程
    $.ajax({
      type: 'GET',
      url: '${pageContext.request.contextPath}/manager/updateCourse', // 确保此 URL 与控制器一致
      data: formData,
      success: function(response) {
        if (response === "success") {
          // 更新成功后重新查询课程
          $.ajax({
            type: 'GET',
            url: '${pageContext.request.contextPath}/manager/queryCourses',
            data: { flag: 1 },
            success: function(data) {
              $('.flowerTable').html(data); // 更新课程列表
            },
            error: function(error) {
            }
          });
        } else {
          alert("更新失败，请稍后重试。"); // 提示更新失败
        }
      },
      error: function(error) {
        alert("更新请求失败。"); // 提示请求失败
      }
    });
  });
  // 关闭更新表单的事件处理
  $('.goBackUpdate').click(function(e) {
    e.preventDefault(); // 阻止默认行为
    $('.updateBox').hide(); // 隐藏更新表单
  });
</script>

</body>
</html>