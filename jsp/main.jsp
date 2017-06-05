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
    String query_type = request.getParameter("select");//获取查询类型
    String query_content = request.getParameter("query");//获取查询关键字，查询为模糊查询
    if (query_content == null){
        query_content = "";
    }
    if (query_content != null && query_type != null){
        if (query_type.equals("学号")){
            jdbcQuery = "select * from Student where number like '" + query_content + "%'";

        }
        else {
            jdbcQuery = "select * from Student where name like '" + query_content + "%'";
        }
    }
    else{
        jdbcQuery = "select * from Student";
    }
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
    <div class="body_3">
        <div class="body_3_1">
            <table align="center" bordercolor="#C0C0C0" border="1">
                <form name="form_1" method="get" action="main.jsp">
                    <tr bgcolor="#1E90FF">
                        <td>数据查询</td>
                        <td>
                            <select name="select">
                                <option value="学号">学号</option>
                                <option value="姓名"selected>姓名</option>
                            </select>
                        </td>
                        <td>
                            <div align="center">
                                <input name="query" type="text" id="query_2" size="16">
                            </div>
                        </td>
                        <td>
                            <div align="center">
                                <input type="submit" name="Submit" value="查询">
                            </div>
                        </td>
                    </tr>
                </form>
            </table>
        </div>
        <div>
            <table width="50%" broder="0" align="center" cellpadding="2" bgcolor="#1E90FF">
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
        <%@include file="bottom.jsp"%>
    </footer>
</body>
</html>
