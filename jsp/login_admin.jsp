<%--
  Created by IntelliJ IDEA.
  User: iAspace
  Date: 2017/5/23
  Time: 15:02
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
    String username = request.getParameter("username");
    if(username != null){
        username = new String(username.getBytes("ISO-8859-1"),"utf-8");
    }
    String password = request.getParameter("password");
    if (password != null) {
        password = new String(password.getBytes("ISO-8859-1"),"utf-8");
    }
    try {
        Class.forName("com.mysql.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    try {
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stu_info", "root", "mysql");
        Statement sql = con.createStatement();
        ResultSet rs = sql.executeQuery("SELECT * FROM admin_info WHERE admin_name = '"+username+"'and password = '" + password +"'");
        //如果查询到正确的用户名和密码，则rs.next()返回真值
        if (rs.next()) {
            //成功登录的用户添加到session对象
            session.setAttribute("login_name", username);
            //登录成功后转向main.jsp
            response.sendRedirect("main_admin.jsp");
        }
        else{
            out.print("<script>alert('您的用户名或密码错误，请重新输入或注册'); history.go(-1)</script>");
            con.close();
        }
    } catch(SQLException e1){
        e1.printStackTrace();
    }
%>
</body>
</html>