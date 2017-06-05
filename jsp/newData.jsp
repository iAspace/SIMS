<%--
  Created by IntelliJ IDEA.
  User: iAspace
  Date: 2017/5/22
  Time: 9:13
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
                String condition = "insert into Student value('" + number + "','" + name + "','" + sex + "','" + age + "','" + classes + "')";
                ResultSet rs = sta.executeQuery("select * from Student where number = '" + number + "'");
                if(rs.next()){
                 out.print("<script>alert('您输入的学号已经存在，请重新输入新的学号!');self.location='../jsp/increase.jsp';</script>");
                }
                else {
                    sta.executeUpdate(condition);
                    con.close();
                }
            }catch(SQLException e1) {
                e1.printStackTrace();
            }
        %>
    </p>
    out.print("<script>alert('您添加成功了!');self.location='../jsp/main_admin.jsp';</script>");
</body>
</html>
