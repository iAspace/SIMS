<%--
  Created by IntelliJ IDEA.
  User: iAspace
  Date: 2017/5/24
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <title>Title</title>
</head>
<body>
<div class="top">
    <h1>
        欢迎进入学生信息管理系统
    </h1>
</div>
<div class="body_4">
    <ul>
        <li><a href="../jsp/admin_main.jsp">查找学生信息</a></li>
        <li><p>录入学生信息</p></li>
        <li><a href="../jsp/del.jsp">删除学生信息</a></li>
        <li><a href="../jsp/modify.jsp">修改学生信息</a></li>
    </ul>
</div>
<form name="form2" method="post" action="../jsp/newData.jsp">
    <div class="banner banner_2 banner_3 banner_4">
        <div class="body_3_1">
            <h1>录入学生信息</h1>
        </div>
        <div class="body body_2">
            <div class="p p1 p3">
                <p>
                    &emsp;&emsp;学号:&nbsp;&nbsp;
                    <input name="number" type="text" id="number" value="">
                    <!--昵称判定-->
                </p>
            </div>
            <div class="p p1 p3">
                <p>
                    &emsp;&emsp;姓名:&nbsp;&nbsp;
                    <input name="name" type="text" id="name" value="">
                    <!--//-->
                </p>
            </div>
            <div class="p p1 p3">
                <p>
                    性别: &emsp;
                    <input name="sex" type="radio" value="男">男 &emsp; &emsp;
                    <input name="sex" type="radio" value="女">女
                </p>
            </div>
            <div class="p p1 p3">
                <p>
                    &emsp;&emsp;年龄:&nbsp;&nbsp;
                    <input name="age" type="text" value="">
                    <!---->
                </p>
            </div>
            <div class="p p1 p3">
                <p>
                    &emsp;&emsp;班级:&nbsp;&nbsp;
                    <input name="class" type="text" value="">
                    <!---->
                </p>
            </div>
            <div class="register register_1">
                <input class="submit submit_3"  id="Submit_1" name="Submit" type="Submit" value="添 加">
            </div>
        </div>
    </div>
</form>
<footer>
    <%@include file="bottom_0.jsp"%>
</footer>
</body>
</html>
