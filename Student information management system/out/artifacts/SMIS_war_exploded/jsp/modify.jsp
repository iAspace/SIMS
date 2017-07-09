<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
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
//        if (number != null && name == null && sex == null && age == null && classes == null) {
//            condition = "update student set number='" + number + "',name='" + name + "',sex='" + sex + "',age='"
//                    + age + "',class='" + classes + "' where id=" + id;
//            sta.executeUpdate(condition);
//            con.close();
//            sta.close();
////            response.sendRedirect("admin_main_1.jsp");
//            out.print("<script>alert('您修改成功了!');self.location='../jsp/main_admin_1.jsp';</script>");
//        }
//        else{
            String condition = "select * from student where id=" + id;
            ResultSet rs = sta.executeQuery(condition);
            rs.next();
%>
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
    <form name="form2" method="post" action="../jsp/moData.jsp?id=<%=id%>">
        <div class="banner banner_2 banner_3 banner_4 banner_5">
            <div class="body_3_1">
                <h1>修改学生信息</h1>
            </div>
            <div class="body body_2 body_2_1">
                <div class="p p1 p3">
                    <p>
                        &emsp;&emsp;学号:&nbsp;&nbsp;
                        <input name="number" type="text" id="number" value="<%=rs.getString(2)%>">
                    </p>
                </div>
                <div class="p p1 p3">
                    <p>
                        &emsp;&emsp;姓名:&nbsp;&nbsp;
                        <input name="name" type="text" id="name" value="<%=rs.getString(3)%>">
                    </p>
                </div>
                <div class="p p1 p3">
                    <p>
                        性别: &emsp;
                        <%
                            String ch1, ch2;
                            if (rs.getString(4).equals("女")) {
                                ch1 = "unchecked";
                                ch2 = "checked";
                            } else {
                                ch1 = "checked";
                                ch2 = "unchecked";
                            }
                        %>
                        <input name="sex" type="radio" value="男" <%=ch1%>>男 &emsp; &emsp;
                        <input name="sex" type="radio" value="女" <%=ch2%>>女
                    </p>
                </div>
                <div class="p p1 p3">
                    <p>
                        &emsp;&emsp;年龄:&nbsp;&nbsp;
                        <input name="age" type="text" value="<%=rs.getInt(5)%>">
                        <!---->
                    </p>
                </div>
                <div class="p p1 p3">
                    <p>
                        &emsp;&emsp;班级:&nbsp;&nbsp;
                        <input name="class" type="text" value="<%=rs.getString(6)%>">
                    </p>
                </div>
                <div class="register register_1">
                    <input class="submit submit_3"  id="Submit_1" name="Submit" type="Submit" value="修 改">
                </div>
            </div>
        </div>
    </form>
    <%
//                con.close();
//
//            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    %>
    <footer>
        <%@include file="bottom_0.jsp"%>
    </footer>
</body>
</html>
