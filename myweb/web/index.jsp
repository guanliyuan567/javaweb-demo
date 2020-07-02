<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/15
  Time: 12:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
  <title>小小的练习</title>
</head>
<body>
当前登录用户<%=session.getAttribute("name")%>;
<%
  if (session.getAttribute("name") != null) {
    out.println("<a href='logout.jsp'>注销</a>");
  } else {
    out.println("<a href='login.html'>请登录</a>");
  }
%>
<a href="shop">购物</a>
<a href="24point">24点</a>
</body>
</html>