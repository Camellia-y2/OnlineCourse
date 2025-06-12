<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
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

        em, i {
            font-style: normal;
        }

        .login {
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

        .login em {
            font-size: 14px;
        }

        a {
            font-size: 14px;
            margin-top: 88px;
            margin-right: 70px;
            color: azure;
        }

        a:hover {
            color: rgb(19, 111, 186);
        }

        .uaccount {
            margin-top: 26px;
            color: azure;
        }

        .password {
            margin-top: 6px;
            color: azure;
        }

        .checkAccount,
        .checkPwd {
            margin-top: 1px;
            height: 15px;
            font-size: 10px;
            line-height: 15px; /* 设置固定高度 */
            color: red; /* 提示信息颜色 */
        }

        input[type="text"], input[type="password"] {
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

        .login input[type="radio"] {
            margin-top: 10px;
            margin-right: 26px;
            height: 15px;
            width: 15px;
            cursor: pointer;
        }

        .button {
            margin-bottom: 16px;
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

        .error-message {
            color: red;
            margin-top: 10px;
        }
    </style>
    <!-- jQuery导入 -->
    <script type="text/javascript" src="js/jQuery.js"></script>
    <script type="text/javascript" src="js/isLegal.js"></script>
</head>

<body>
<div class="container">
    <div class="login">
        <form action="tologin" id="form" method="post" name="form1" onsubmit="return Verify()">
            <h1 style="text-align: center;color: aliceblue;">LOGIN IN</h1>

            <p class="uaccount">账号:<input name="account" class="Uname" type="text"><label id="name_trip"></label></p>
            <p class="checkAccount"></p>

            <p class="password">密码:<input name="pwd" class="Pwd" type="password"><label id="password_trip"></label></p>
            <p class="checkPwd"></p>

            <em>学生</em>&nbsp;<input type="radio" name="person" value="0" checked="checked" />
            <em>管理员</em>&nbsp;<input type="radio" name="person" value="1" /><br>

            <%-- 显示错误提示信息 --%>
            <c:if test="${not empty msg}">
                <div class="error-message">${msg}</div>
            </c:if>

            <div style="text-align: center;margin-top: 30px;">
                <input type="submit" class="button" value="登录">
                <input type="reset" class="button" value="重置">
            </div>
            <a href="register.jsp">无账号，去注册？</a>
        </form>
    </div>
</div>
</body>
<script>
    /*综合验证 */
    function Verify() {
        var account = document.querySelector(".Uname").value.trim(); // 获取账号输入值并去除空格
        var pwd = document.querySelector(".Pwd").value; // 获取密码输入值

        // 验证账号是否为空
        if (account === '') {
            alert("账号不能为空！");
            return false;
        }

        // 验证密码是否为空
        if (pwd === '') {
            alert("密码不能为空！");
            return false;
        }

        // 如果账号和密码都已输入
        return true;
    }
</script>
</html>