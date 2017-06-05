<%--
  Created by IntelliJ IDEA.
  User: iAspace
  Date: 2017/5/25
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>
    <%
        String number_0 =request.getParameter("number_0");
        if(number_0 == null){
            number_0 = "";
        }
        number_0 = new String(number_0.getBytes("ISO-8859-1"),"utf-8");
        String number =request.getParameter("number");
        if(number == null){
            number = "";
        }
        number = new String(number.getBytes("ISO-8859-1"),"utf-8");
        String name = request.getParameter("name");
        if (name == null){
            name = "";
        }
        name = new String(name.getBytes("ISO-8859-1"),"utf-8");
        String sex = request.getParameter("sex");
        if (sex == null){
            sex = "";
        }
        sex = new String(sex.getBytes("ISO-8859-1"),"utf-8");
        String age = request.getParameter("age");
        if(age == null){
            age = "";
        }
        String classes = request.getParameter("class");
        if (classes == null){
            classes ="";
        }
        classes = new String(classes.getBytes("ISO-8859-1"),"utf-8");
        try{
            Class.forName("com.mysql.jdbc.Driver");
        }catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stu_info", "root", "mysql");
            Statement sta = con.createStatement();
            ResultSet rs = sta.executeQuery("select * from Student where number = '" + number_0 + "'");
            if(rs.next()){
                rs = sta.executeQuery("select * from Student where number = '" + number + "'");
                if(rs.next()) {
                    out.print("<script>alert('您修改的学号已存在，请重新输入!');self.location='../jsp/modify.jsp';</script>");
                }
                else{
                    String condition = "update Student set number ='" + number + "',name='" + name + "' ,sex ='" + sex + "',age = '" + age + "',classes='" + classes + "' where number ='" + number_0 + "' ";
                    sta.executeUpdate(condition);
                    con.close();
                }
            }
            else{
                out.print("<script>alert('您输入的学号未找到，请重新输入!');self.location='../jsp/modify.jsp';</script>");
            }
        }catch(SQLException e1) {
            e1.printStackTrace();
        }
    %>
</p>
    out.print("<script>alert('您修改成功了!');self.location='../jsp/main_admin.jsp';</script>");
</body>
</html>
