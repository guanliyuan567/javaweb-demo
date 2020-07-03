<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/29
  Time: 17:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.valuebean.GoodsSingle" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <title></title>
</head>
<body>
<%!
    static ArrayList goodslist = new ArrayList();            //用来存储商品
    static {                                                //静态代码块
        String[] names = {"苹果", "香蕉", "梨", "橘子"};        //商品名称
        float[] prices = {2.8f, 3.1f, 2.5f, 2.3f};            //商品价格
        for (int i = 0; i < 4; i++) {                            //初始化商品信息列表
            //定义一个GoodsSingle类对象来封装商品信息
            GoodsSingle single = new GoodsSingle();
            single.setName(names[i]);                    //封装商品名称信息
            single.setPrice(prices[i]);                //封装商品价格信息
            single.setNum(1);                            //封装购买数量信息
            goodslist.add(i, single);                    //保存商品到goodslist集合对象中
        }
    }
%>
<%
    session.setAttribute("goodslist", goodslist);        //保存商品列表到session中
    response.sendRedirect("show.jsp");
%>
</body>
</html>
