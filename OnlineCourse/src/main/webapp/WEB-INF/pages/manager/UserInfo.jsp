<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        em, i {
            font-style: normal;
        }

        input[type="submit"], input[type="reset"], button {
            cursor: pointer;
        }

        /* 一定要记得初始化 */
        .Box {
            position: relative;
            top: 4px;
            margin: 0px auto;
            height: 200px;
            width: 1300px;
            /* text-align: center; */
        }

        /*查询页面*/
        .queryBox {
            margin: 10px auto;
            width: 100%;
            height: 50px;
            border: 1px solid rgb(225, 218, 218);
            box-shadow: 0 0 3px 2px rgba(225, 221, 221, 0.6);
            border-radius: 3px;
        }

        .queryBox span {
            margin-top: 10px;
            margin-left: 20px;
            display: inline-block;
        }

        .queryBox input[type="text"] {
            width: 116px;
            height: 23px;
            border: 1px solid rgb(151, 148, 148);
            border-radius: 3px;
            text-align: center;
        }

        .queryBox .querySubmit, .queryBox .queryReset, .queryBox button {
            color: rgb(247, 248, 248);
            width: 50px;
            height: 26px;
            border: none;
            border-radius: 3px;
            /* rgb(36, 160, 237) */
            background-color: rgb(48, 169, 244);
        }

        .queryBox .queryReset {
            background-color: rgb(234, 87, 87);
        }

        /*数据显示页面*/

        /*表格页面*/
        .Head {
            width: 98%;
            border: 1px solid rgb(225, 218, 218);
            border-radius: 4px;
            margin: 0px auto;
            margin-top: 10px;
        }

        .flowerData {
            width: 98%;
            border-radius: 4px;
            margin: 0px auto;
            border: 1px solid rgb(225, 218, 218);
            border-top: none;
        }

        .flowerData table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            height: 30px;
            text-align: center;
        }
        /*课程信息显示 , */
        td:nth-child(1),td:nth-child(2)
        {
            width: 15%;
        }
        td:nth-child(3){
            width:70%;
        }
        .title {
            width: 100%;
            /*合并单元格*/
            border-collapse: collapse;
            table-layout: fixed;
        }

        .title tr {
            height: 40px;
            font-weight: 700;
            font-size: 18px;
        }

        .flowerTable {
            width: 100%;
            border-collapse: collapse;
            table-layout: fixed;
            border: 1px solid rgb(228, 219, 219);
        }

        .flowerTable tr {
            height: 40px;
        }

    </style>
    <title>Title</title>
</head>
<body>
<div class="Box">
    <div class="queryBox">
        <form action="" method="get" name="queryFlower">
            <span>学号：<input type="text" name="sno" class="querySno" /></span>
            <span>姓名：<input type="text" name="sname" class="querySname" /></span>
            <input type="reset" value="重置" class="queryReset" />
            <button type="button" class="querySubmit">查询</button>
        </form>
    </div>
    <div class="Head">
        <table class="title">
            <tr class="tHead">
                <td>学号</td>
                <td>姓名</td>
                <td></td>
            </tr>
        </table>
    </div>
    <div class="flowerData">
        <table class="flowerTable">
            <!-- 查询结果会动态填充到这里 -->
        </table>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {

        // 查询全部课程数据
        $.ajax({
            type: 'GET',
            url: '${pageContext.request.contextPath}/manager/queryUsers', // 确保URL与Controller一致
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
            var sno = $('.querySno').val();
            var sname = $('.querySname').val();

            // 发起查询请求
            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}/manager/queryUsers', // 确保URL与Controller一致
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                data: {flag: 0, sno: sno, sname: sname},
                success: function(data) {
                    $('.flowerTable').html(data);
                },
                error: function(error) {
                    console.log("Error: ", error);
                }
            });
        });
    });
</script>
</body>
</html>
