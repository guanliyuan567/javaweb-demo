<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/22
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    //  session.removeAttribute("name");//从session表中移除一行
    session.invalidate();//销毁整个session表
    response.sendRedirect("index.jsp");
%>
</body>
</html>
