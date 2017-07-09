<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username =request.getParameter("username");
    if(username == null){
        username = "";
    }
    username = new String(username.getBytes("ISO-8859-1"),"utf-8");
    System.out.print(username);
        String real_name =request.getParameter("real_name");
        if(real_name == null){
            real_name = "";
        }
    real_name = new String(real_name.getBytes("ISO-8859-1"),"utf-8");
    String password =request.getParameter("password");
    if(password == null){
        password = "";
    }
    password = new String(password.getBytes("ISO-8859-1"),"utf-8");
    String Re_password =request.getParameter("Re_password");
    if(Re_password == null){
        Re_password = "";
    }
    Re_password = new String(Re_password.getBytes("ISO-8859-1"),"utf-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <title>重置</title>
    <script type="text/javascript">
        function RgTest(){
//            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;
            var Re_password = document.getElementById("Re_password").value;
//            var real_name = document.getElementById("real_name").value;
//            if(username === ""){
//                alert("请输入用户名!");
//            }
//            else if(username.length>10){
//                alert("用户名的长度不能超过十个字符！");
//            }
            if(password === ""){
                alert("请输入密码!");
            }
            else if(password.length < 6 ||password.length > 10){
                alert("密码长度应在6-10之间!");
            }
            else if(password !== Re_password){
                alert("两次输入的密码不一样!");
            }
//            else if(real_name === ""){
//                alert("请输入真实姓名!");
//            }
            else{
                form4.submit();
            }
        }
    </script>
</head>
<body>
<%System.out.print(username);

%>
<form name="form4" method="post" action="../jsp/re_user_register.jsp?username=<%=username%>&&real_name=<%=real_name%>">
    <div class="banner banner_2">
        <div class="head head_2">
            <h1>
                学生信息管理系统
            </h1>
        </div>
        <div class="head_h2">
            <h2>重置账号</h2>
        </div>
        <div class="body body_2">
            <div class="p">
                <p>
                    &emsp;&emsp;密码:&nbsp;&nbsp;
                    <input name="password" type="password" id="password" value="">
                </p>
            </div>
            <div class="p">
                <p>
                    确认密码:&nbsp;&nbsp;
                    <input name="Re_password" type="password" id="Re_password" value="">
                    <!---->
                </p>
            </div>
            <div class="register">
                <input class="submit submit_2" name="button" type="button" onclick="RgTest()" value="立即注册">
            </div>
        </div>
    </div>
</form>
</body>
</html>