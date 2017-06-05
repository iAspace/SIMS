<%--
  Created by IntelliJ IDEA.
  User: iAspace
  Date: 2017/5/21
  Time: 18:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    String jdbcQuery;
        jdbcQuery = "select * from Student";
    try{
        Class.forName("com.mysql.jdbc.Driver");
    }catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    try {
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stu_info", "root", "mysql");
        Statement sta = con.createStatement();
        ResultSet rs = sta.executeQuery(jdbcQuery);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <title>查询-数据</title>
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
        <li><a href="../jsp/del.jsp">删除学生信息</a></li>
        <li><a href="../jsp/modify.jsp">修改学生信息</a></li>
    </ul>
</div>
    <div class="body_3">
        <div class="body_3_1">
            <h1>查看学生信息</h1>
        </div>
        <div>
            <table width="70%" broder="0" align="center" cellpadding="2" bgcolor="#87CEFA">
                <tr bgcolor="#3399ff">
                    <td width="20%">
                        <div align="center">学号</div>
                    </td>
                    <td width="20%">
                        <div align="center">姓名</div>
                    </td>
                    <td width="15%">
                        <div align="center">性别</div>
                    </td>
                    <td width="15%">
                        <div align="center">年龄</div>
                    </td>
                    <td width="30%">
                        <div align="center">班级</div>
                    </td>
                </tr>
                <%
                    while (rs.next()){
                %>
                <tr bgcolor="#ffffff">
                    <td>
                        <%= rs.getString(1) %>
                        <div align="center"></div>
                    </td>
                    <td>
                        <%= rs.getString(2) %>
                        <div align="center"></div>
                    </td>
                    <td>
                        <%= rs.getString(3) %>
                        <div align="center"></div>
                    </td>
                    <td>
                        <%= rs.getInt(4) %>
                        <div align="center"></div>
                    </td>
                    <td>
                        <%= rs.getString(5) %>
                        <div align="center"></div>
                    </td>
                </tr>
                <%
                        }
                        con.close();
                    }catch(SQLException e1) {
                        e1.printStackTrace();
                    }
                %>
            </table>
        </div>
</div>
<footer>
    <%@include file="bottom_0.jsp"%>
</footer>
</body>
</html>
