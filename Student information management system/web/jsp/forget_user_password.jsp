<%--
  Created by IntelliJ IDEA.
  User: iAspace
  Date: 2017/5/23
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.* " errorPage="" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String real_name = request.getParameter("real_name");
    if(real_name != null){
        real_name = new String(real_name.getBytes("ISO-8859-1"),"utf-8");
    }
    try {
        Class.forName("com.mysql.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    try {
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stu_info", "root", "mysql");
        Statement sql = con.createStatement();
        ResultSet rs = sql.executeQuery("SELECT * FROM user_info WHERE real_name = '"+real_name+"'");
        //如果查询到正确的用户名和密码，则rs.next()返回真值
        if (rs.next()) {
            //成功登录的用户添加到session对象
            session.setAttribute("forget_name", real_name);
            out.print("<script>alert('已找到您的真实姓名,请重置密码!');self.location='../html/re_user_register.html';</script>");
//            response.sendRedirect("../html/re_user_register.html");
        }
        else{
            out.print("<script>alert('你的真实姓名未注册,请重新输入或注册'); history.go(-1)</script>");
            con.close();
        }
    } catch(SQLException e1){
        e1.printStackTrace();
    }
%>
</body>
</html>