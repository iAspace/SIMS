<%--
  Created by IntelliJ IDEA.
  User: iAspace
  Date: 2017/5/22
  Time: 14:52
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
        <li><a href="../jsp/increase.jsp">录入学生信息</a></li>
        <li><p>删除学生信息</p></li>
        <li><a href="../jsp/modify.jsp">修改学生信息</a></li>
    </ul>
</div>
<form name="form2" method="post" action="../jsp/delData.jsp">
    <div class="banner banner_2 banner_3 banner_4 banner_6">
        <div class="body_3_1">
            <h1>删除学生信息</h1>
        </div>
        <div class="body body_2 body_2_1">
            <div class="p p1 p3 p4 p5">
                <p>
                    &emsp;&emsp;学号:&nbsp;&nbsp;
                    <input name="number" type="text" id="number" value="">
                <p>&emsp;&emsp;&emsp;&emsp;需要删除的学生学号</p>
                </p>
            </div>
            <div class="register register_1">
                <input class="submit submit_3"  id="Submit_1" name="Submit" type="Submit" value="删 除">
            </div>
        </div>
    </div>
</form>
<footer>
    <%@include file="bottom_0.jsp"%>
</footer>
</body>
</html>
