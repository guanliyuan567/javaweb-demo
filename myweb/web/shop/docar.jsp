<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/22
  Time: 13:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="bean.toolbean.MyTools" %>
<%@ page import="bean.valuebean.GoodsSingle" %>
<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="myCar" class="bean.toolbean.ShopCar" scope="session"/>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <title></title>
</head>
<body>
<%
    String action = request.getParameter("action");
    if (action == null)
        action = "";
    if (action.equals("buy")) {                                    //购买商品
        ArrayList goodslist = (ArrayList) session.getAttribute("goodslist");
        int id = MyTools.strToint(request.getParameter("id"));
        GoodsSingle single = (GoodsSingle) goodslist.get(id);
        myCar.addItem(single);        //调用ShopCar类中的addItem()方法添加商品
        response.sendRedirect("show.jsp");
    } else if (action.equals("remove")) {                            //移除商品
        String name = request.getParameter("name");        //获取商品名称
        myCar.removeItem(name);        //调用ShopCar类中的removeItem()方法移除商品
        response.sendRedirect("shopcar.jsp");
    } else if (action.equals("clear")) {                            //清空购物车
        myCar.clearCar();                //调用ShopCar类中的clearCar()方法清空购物车
        response.sendRedirect("shopcar.jsp");
    } else {
        response.sendRedirect("show.jsp");
    }
%>
</body>
</html>

