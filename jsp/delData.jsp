<%--
  Created by IntelliJ IDEA.
  User: iAspace
  Date: 2017/5/24
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String number= request.getParameter("number");
        if (number == null){
            number ="";
        }
        number = new String(number.getBytes("ISO-8859-1"),"utf-8");
        try{
            Class.forName("com.mysql.jdbc.Driver");
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stu_info", "root", "mysql");
            Statement sta = con.createStatement();
            ResultSet rs = sta.executeQuery("select * from Student where number = '" + number + "'");
            if(rs.next()) {
                String condition = "delete from Student where number =" + number + "";
                sta.executeUpdate(condition);
                con.close();
                out.print("<script>alert('删除成功!');self.location='../jsp/main_admin.jsp';</script>");
            }
            else{
                out.print("<script>alert('未找到该学号!');self.location='../jsp/del.jsp';</script>");
            }
        }catch(SQLException e1) {
            e1.printStackTrace();
        }
    %>

</body>
</html>
