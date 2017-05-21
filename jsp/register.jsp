<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/25
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.* " errorPage="" %>
<%
    String username = request.getParameter("username");
    if(username != null){
        username = new String(username.getBytes("ISO-8859-1"),"utf-8");
    }
    String password = request.getParameter("password");
    if(password != null){
        password = new String(password.getBytes("ISO-8859-1"),"UTF-8");
    }
    String RealName = request.getParameter("real_name");
    if(RealName != null){
        RealName = new String(RealName.getBytes("ISO-8859-1"),"UTF-8");
    }
    try{
        Class.forName("com.mysql.jdbc.Driver");
    }catch (ClassNotFoundException e){
        e.printStackTrace();
    }
    try{
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stu_info","root","mysql");
        Statement sta = con.createStatement();
        ResultSet rs = sta.executeQuery("select * from user_info where username = '" + username +"'");
        if(rs.next()){
            if (username != null && password != null) {
                out.print("<script>alert('您输入的用户名已经存在，请重新输入新的用户名！');</script>");
            }
            session.setAttribute("register_false","您的用户名已经存在");
        }
        else {
            String condition = "insert into user_info values('" + RealName +"','" + username + "','" + password + "')";
            sta.executeUpdate(condition);
            session.setAttribute("register_success", "您注册成功了！");
            out.print("<script>alert('您注册成功了!');self.location='../html/index.html';</script>");
            con.close();
//            response.sendRedirect("../html/index.html");
        }
    }catch(SQLException e1) {
        e1.printStackTrace();
    }
%>
