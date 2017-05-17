<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/18
  Time: 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <title>学生信息管理系统</title>
</head>
<body>
<form name="form1" method="post" action="bottom.jsp">
    <div class="banner">
        <div class="head">
            <h1>
                学生信息管理系统
            </h1>
        </div>
        <div class="body">
            <div class="p">
                <p>
                    username:&nbsp;&nbsp;
                    <input name="username" type="text" id="username_1" value="">
                    <a href="*">注册账号</a>
                </p>
            </div>
            <div class="p">
                <p>
                    password:&nbsp;&nbsp;
                    <input name="password" type="password" id="password_1" value="">
                    <a href="*">找回密码</a>
                </p>
            </div>
            <div class="checkbox">
                <p>
                    <input name="Remember password" type="checkbox" id="Remember password">记住密码&nbsp;
                    <input name="automatic logon" type="checkbox" id="automatic logon">自动登录
                </p>
            </div>
            <div class="logon">
                <input class="submit"  id="Submit" name="Submit" type="submit" value="登陆">
            </div>
        </div>
    </div>
</form>
</body>
</html>