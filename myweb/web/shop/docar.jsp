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
<%
    String action = request.getParameter("action");
    if (action == null)
        action = "";
    if (action.equals("buy")) {                                    //������Ʒ
        ArrayList goodslist = (ArrayList) session.getAttribute("goodslist");
        int id = MyTools.strToint(request.getParameter("id"));
        GoodsSingle single = (GoodsSingle) goodslist.get(id);
        myCar.addItem(single);        //����ShopCar���е�addItem()���������Ʒ
        response.sendRedirect("show.jsp");
    } else if (action.equals("remove")) {                            //�Ƴ���Ʒ
        String name = request.getParameter("name");        //��ȡ��Ʒ����
        myCar.removeItem(name);        //����ShopCar���е�removeItem()�����Ƴ���Ʒ
        response.sendRedirect("shopcar.jsp");
    } else if (action.equals("clear")) {                            //��չ��ﳵ
        myCar.clearCar();                //����ShopCar���е�clearCar()������չ��ﳵ
        response.sendRedirect("shopcar.jsp");
    } else {
        response.sendRedirect("show.jsp");
    }
%>