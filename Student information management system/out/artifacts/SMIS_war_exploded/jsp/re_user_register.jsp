<%--
  Created by IntelliJ IDEA.
  User: iAspace
  Date: 2017/5/23
  Time: 15:52
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
    System.out.print(username);
    System.out.print(password);
    System.out.print(RealName);

    try{
        Class.forName("com.mysql.jdbc.Driver");
    }catch (ClassNotFoundException e){
        e.printStackTrace();
    }
    try{
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stu_info","root","mysql");
        Statement sta = con.createStatement();
        ResultSet rs = sta.executeQuery("select * from user_info where user_name = '" + username +"'");
//        if(rs.next()){
//            session.setAttribute("register_false","您的用户名已经存在");
//            out.print("<script>alert('您输入的用户名已经存在，请重新输入新的用户名!');self.location='../html/re_user_register.html';</script>");
//        }
//        else {
            String condition = "update user_info set user_name = '" + username +"',password='" + password +"' where real_name ='" + RealName +"' ";
            sta.executeUpdate(condition);
            session.setAttribute("register_success_1", "您重置成功了！");
            out.print("<script>alert('您的密码重置成功了!');self.location='../index.jsp';</script>");
            con.close();
//        }
    }catch(SQLException e1) {
        e1.printStackTrace();
    }
%>
