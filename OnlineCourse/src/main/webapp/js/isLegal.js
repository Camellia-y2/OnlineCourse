/**
 * 
 */
$(function () {
    // 验证登录用户
    $(".Uname").blur(function () {
        var value = $(this).val();
        // （即中文字符、英文字母、数字或下划线）必须连续出现2到8次。
        var regUName = /^[A-Za-z0-9]{2,8}$/;
        //判断
        var flag = regUName.test(value);
        if (flag) {
            $(this).css("border", "");
            $(".checkAccount").text(""); // 清除提示
        }
        else if (value.length == 0) {
            $(this).css("border", "1px solid red");
            $(".checkAccount").css("color", "red");
            $(".checkAccount").text("账号不能为空！");
        }
        else {
            $(this).css("border", "1px solid red");
            $("checkAccount").css("color", "red");
            $("checkAccount").text("用户名格式不正确！");
        }
    });
    $(".Uname").on('input', function () {
        var value = $(this).val();
        if (value.length >= 0 && value.length <= 8) {
            $(".Uname").css("border", "");
            if ($(".register").css('display') === 'block') {
                $("checkAccount").css("color", "rgb(88, 139, 108)");
                $("checkAccount").text("用户名长度在2~8之间，可以是英文字母，数字，汉字");
            }
        }
        else if (value.length > 8) {
            $(this).css("border", "1px solid red");
            $("checkAccount").css("color", "red");
            $("checkAccount").text("超出规定长度！");
        } else {
            $(this).css("border", "");
            $("checkAccount").text("");
        }
    });
    // 验证登录密码
    // 验证密码函数
    function validatePassword(value) {
        var regPwd = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,20}$/;
        var flag = regPwd.test(value);
        if (flag) {
            $(".Pwd").css("border", "");
            $(".checkPwd").text(""); // 清除提示
        } else if (value.length == 0) {
            $(".Pwd").css("border", "1px solid red");
            $(".checkPwd").css("color", "red");
            $(".checkPwd").text("密码不能为空！");
        } else {
            $(".Pwd").css("border", "1px solid red");
            $(".checkPwd").css("color", "red");
            $(".checkPwd").text("密码格式错误！");
        }
    }
    // 密码输入框失去焦点时进行密码验证
    $(".Pwd").blur(function () {
        validatePassword($(this).val());
    });
    // 密码输入框输入时进行提示
    $(".Pwd").on('input', function () {
        var value = $(this).val();
        if (value.length >= 0 && value.length <= 20) {
            if ($(".register").css('display') === 'block') {
                $(".checkPwd").css("color", "rgb(88, 139, 108)");
                $(".checkPwd").text("密码长度为6~20，必须包括大小写字母和数字");
            }
        } else if (value.length > 20) {
            $(".Pwd").css("border", "1px solid red");
            $(".checkPwd").css("color", "red");
            $(".checkPwd").text("超出规定长度！");
        } else {
            $(this).css("border", "");
            $(".checkPwd").text("");
        }
    });
    //验证密码是否一致
    function validateSPassword() {
        if ($(".SPwd").val() !== $(".register .Pwd").val()) {
            $(".SPwd").css("border", "1px solid red");
            $(".cSPwd").css("color", "red");
            $(".cSPwd").text("密码前后不一致！");
        } else if ($(".SPwd").val().length == 0) {
            $(".SPwd").css("border", "1px solid red");
            $(".cSPwd").css("color", "red");
            $(".cSPwd").text("密码不能为空！");
        } else {
            $(".SPwd").css("border", "");
            $(".cSPwd").css("color", "");
            $(".cSPwd").text("");
        }
    }

    $(".SPwd").blur(function () {
        validateSPassword();
    });

    $(".SPwd").on('input', function () {
        validateSPassword();
    });
   
})
