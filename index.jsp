<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <title>学生信息管理系统</title>
    <script src="js/jquery.js" type="text/javascript"></script>
    　　<script src="js/jquery.cookie.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            if ($.cookie("rmbUser") == "true") {
                $("#Remember_password").attr("checked", true);
                $("#username").val($.cookie("username"));
                $("#password").val($.cookie("password"));
            }
        });
        //记住用户名密码
        function Save() {
            if ($("#Remember_password").attr("checked")) {
                var str_username = $("#username").val();
                var str_password = $("#password").val();
                $.cookie("rmbUser", "true", { expires: 7 }); //存储一个带7天期限的cookie
                $.cookie("username", str_username, { expires: 7 });
                $.cookie("password", str_password, { expires: 7 });
            }
            else {
                $.cookie("rmbUser", "false", { expire: -1 });
                $.cookie("username", "", { expires: -1 });
                $.cookie("password", "", { expires: -1 });
            }
        };
    </script>
</head>
<body>
<form name="form1" method="post" action="../jsp/login_user.jsp">
    <div class="banner banner_1">
        <div class="head head_1">
            <h1>
                学生信息管理系统
            </h1>
        </div>
        <div class="body body_1">
            <div class="p">
                <p>
                    username:&nbsp;&nbsp;
                    <input name="username" type="text" id="username" value="">
                    <a href="../html/register.html">注册账号</a>
                </p>
            </div>
            <div class="p">
                <p>
                    password:&nbsp;&nbsp;
                    <input name="password" type="password" id="password" value="">
                    <a href="../html/forget_user_password.html">找回密码</a>
                </p>
            </div>
            <%--<div class="checkbox">--%>
                <%--<p>--%>
                    <%--<input name="Remember_password" onclick="Save()" id="Remember_password" type="checkbox">记住密码&nbsp;--%>
                    <%--<input name="automatic_logon" type="checkbox" id="automatic_logon" onclick="Save()">自动登录--%>
                <%--</p>--%>
            <%--</div>--%>
            <div class="logon">
                <input class="submit submit_1"  id="Submit" name="Submit" type="submit" value="登陆">
            </div>
            <div class="switch">
                <p>
                    用户登录&nbsp;|&nbsp;<a href="../html/admin_login.html">管理登录</a>
                </p>
            </div>
        </div>
    </div>
</form>
</body>
</html>