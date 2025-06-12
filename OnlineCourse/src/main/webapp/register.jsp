<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 2025/1/2
  Time: 12:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>在线学生课程管理系统</title>
  <style>
    * {
      margin: 0;
      padding: 0;
    }

    html {
      height: 100%;
      width: 100%;
      overflow: hidden;
      margin: 0;
      padding: 0;
      background: url('${pageContext.request.contextPath}/images/3.jpg') no-repeat;
      background-size: cover;
      -moz-background-size: 100% 100%;
    }

    body {
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100%;
    }

    em,
    i {
      font-style: normal;
    }

    .register {
      width: 430px;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 420px;
      background-color: rgba(75, 81, 95, 0.3);
      box-shadow: 7px 7px 17px rgba(52, 56, 66, 0.5);
      border-radius: 5px;
      text-align: center;
    }

    .register em {
      font-size: 14px;
    }

    a {
      font-size: 14px;
      margin-top: 90px;
      margin-right: 66px;
      color: azure;
    }

    a:hover {
      color: rgb(19, 111, 186);
    }

    .uaccount {
      margin-top: 24px;
      /*margin-left: 20px;*/
      color: azure;
    }

    .sname {
      margin-top: 5px;
      margin-right: 8px;
      color: azure;
    }

    .password {
      margin-top: 5px;
      color: azure;
    }

    .password2 {
      margin-top: 5px;
      margin-right: 30px;
      color: azure;
    }

    /*添加的p*/
    .checkAccount,
    .checkPwd,
    .checkPwd2,
    .checkSname {
      margin-top: 1px;
      height: 15px;
      font-size: 10px;
      line-height: 15px;
      /* 设置固定高度 */
      /*border: black solid 1px;!*提示信息*!*/
    }

    input[type="text"],
    input[type="password"] {
      margin-left: 15px;
      border-radius: 5px;
      border-style: hidden;
      height: 30px;
      width: 180px;
      background-color: rgba(216, 191, 216, 0.5);
      outline: none;
      color: #f0edf3;
      padding-left: 10px;
    }

    .button {
      margin-top: 14px;
      margin-left: 20px;
      margin-bottom: 6px;
      border-color: cornsilk;
      background-color: rgba(100, 149, 237, .7);
      color: aliceblue;
      border-style: hidden;
      border-radius: 5px;
      width: 100px;
      height: 31px;
      font-size: 16px;
      cursor: pointer;
    }
    /*提示框*/
    .alert{
      font-size: 14px;
      width: 180px;
      height: 30px;
      border-radius: 4px;
      line-height: 30px;
      color: rgb(247, 248, 248);
      background-color: rgb(48, 169, 244);
      margin-top: 10px;
    }
  </style>

  <!-- jQuery导入 -->
  <script type="text/javascript" src="js/jQuery.js"></script>
  <script type="text/javascript" src="js/isLegal.js"></script>
</head>
<body>
<div class="register">
  <form action="toregister">
    <h1 style="color: azure;">REGESTER</h1>
    <p class="uaccount">账号:<input name="account" class="Uname" type="text" value="${student.sno}"></p>
    <p class="checkAccount"></p>
    <p class="sname">用户名:<input name="sname" class="Sname" type="text" value="${student.sname}"></p>
    <p class="checkSname"></p>
    <p class="password">密码:<input name="pwd" class="Pwd" type="password" value="${student.spwd}"></p>
    <p class="checkPwd"></p>
    <p class="password2">确认密码:<input name="pwd2" class="Pwd2" type="password" value="${student.spwd}"></p>
    <p class="checkPwd2"></p>
    <p style="text-align: center;">
      <input type="submit" class="button" onclick="return Verify()" value="注册">
      <input type="reset" class="button" value="重置">
    </p>
    <a href="index.jsp">已有账号，去登录？</a>

  </form>
</div>
<script>
  $(document).ready(function() {
    // 检查msg是否有数据
    if ('${msg}' !== '') {
      // 显示警告信息
      $('.register a').after('<p class="alert" >${msg}</p>');
    }
  });
  /*综合验证 */
  function Verify() {
    var account = $(".Uname").val().trim(); // 账号
    var sname = $(".Sname").val().trim(); // 用户名
    var pwd = $(".Pwd").val(); // 密码
    var pwd2 = $(".Pwd2").val(); // 确认密码

    // 验证账号
    if (account === '') {
      alert("账号不能为空！");
      return false;
    }
    // 验证用户名
    // if (sname === '') {
    //     alert("用户名不能为空！");
    //     return false;
    // }
    // 验证密码
    if (pwd === '') {
      alert("密码不能为空！");
      return false;
    }
    // 密码强度验证，至少6位，包括数字、大写字母、小写字母
    var regPwd = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[^]{6,20}$/;
    if (!regPwd.test(pwd)) {
      alert("密码必须包含至少6位，包括数字、大写字母、小写字母！");
      return false;
    }

    // 验证确认密码
    if (pwd2 === '') {
      alert("请再次输入密码以确认！");
      return false;
    }
    if (pwd !== pwd2) {
      alert("两次输入的密码不一致！");
      return false;
    }
    // 如果所有验证都通过
    return true;
  }


</script>
</body>

</html>
