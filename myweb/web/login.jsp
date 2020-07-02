<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/22
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.UserDAO" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <title></title>
</head>
<body>
username=<%=request.getParameter("username")%>
password=<%=request.getParameter("password")%>
<%
String username=request.getParameter("username");
String password=request.getParameter("password");
if(UserDAO.login(username,password)){
out.println("welcome"+username);
session.setAttribute("name",username);
 response.sendRedirect("index.jsp");
    } else {
        out.println("登陆失败");
        response.sendRedirect("login.html");
    }
%>
</body>
</html>
