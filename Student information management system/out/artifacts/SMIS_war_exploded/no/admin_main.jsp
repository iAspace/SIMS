<%--
  Created by IntelliJ IDEA.
  User: iAspace
  Date: 2017/5/24
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    String jdbcQuery;
    int pageSize = 5;//每页显示的记录数
    int pageCount = 0;//总页数
    if(session.getAttribute("login_name")==null){
        response.sendRedirect("index.jsp");
    }
    String query_type = request.getParameter("select");//获取查询类别
    if(query_type==null)
        query_type = "学号";

    String query_content =request.getParameter("query");//获取查询类型
    if(query_content ==null) {
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
        rs.last();
        int lastRow = rs.getRow();
        pageCount = (lastRow % pageSize == 0) ? (lastRow / pageSize) : (lastRow / pageSize + 1);//计算分页后的总页数
        String showPage2=request.getParameter("showPage");
        int showPage;
        if(showPage2!=null) {
            if(Integer.parseInt(showPage2)>=1)
                showPage=Integer.parseInt(showPage2);
            else
            {
                showPage = 1;
            }
        }
        else {
            showPage = 1;
        }
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
<div>
    <div class="body_4">
        <ul>
            <li><p>查找学生信息</p></li>
            <li><a href="../jsp/increase.jsp">录入学生信息</a></li>
            <li><a href="del.jsp">删除学生信息</a></li>
            <li><a href="../jsp/modify.jsp">修改学生信息</a></li>
        </ul>
    </div>
    <div class="body_3">
        <div class="body_3_1">
            <table align="center"  width="40%" bordercolor="#87CEFA" border="2">
                <form name="form_1" method="get" action="admin_main.jsp">
                    <tr bgcolor="#1E90FF">
                        <td>数据查询</td>
                        <td>
                            <select name="select">
                                <option value="学号" selected>学号</option>
                                <option value="姓名">姓名</option>
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
                    int position=(showPage-1)*pageSize+1;
                    rs.absolute(position);
                    for (int i=1;i<=pageSize;i++){
                        int id=rs.getInt(1);
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
                        if(!rs.next())break;
                    }
                %>
                <form name="form2" method="get" action="admin_main.jsp">
                    <tr bgcolor="#D3D3D3">
                        <td >请选择页码：</td>
                        <td >
                            <input name="showPage" type="text" id="showPage" size="10">
                            <input type="hidden" name="select" size="2" maxlength="10" class="smallInput" value="<%=query_type%>">
                            <input type="hidden" name="query" size="2" maxlength="10" class="smallInput" value="<%=query_content%>">
                        </td>
                        <td colspan="3">
                            <div>
                                <input type="submit" name="Submit3" value="提交">
                                &nbsp;<a href="?showPage=<%=showPage-1%>&select=<%=query_type%>&query=<%=query_content%>">上页</a>
                                &nbsp;<a href="?showPage=<%=showPage+1%>&select=<%=query_type%>&query=<%=query_content%>">下页</a>
                                &nbsp;&nbsp;第<%=showPage%>页/共<%=pageCount%> 页
                            </div>
                        </td>
                    </tr>
                </form>
            </table>
            <%
                    con.close();
                }
                catch (SQLException e1){
                }
            %>
        </div>
        </div>
    </div>
</div>
<footer>
    <%@include file="../jsp/bottom_0.jsp"%>
</footer>
</body>
</html>
