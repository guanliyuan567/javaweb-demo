<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/22
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.valuebean.GoodsSingle" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <title></title>
</head>
<body>
<% ArrayList goodslist = (ArrayList) session.getAttribute("goodslist"); %>
��ǰ��¼�û�<%=session.getAttribute("name")%>;
<%
    if (session.getAttribute("name") != null) {
        out.println("<a href='/logout.jsp'>ע��</a>");
    } else {
        out.println("<a href='/login.html'>���¼</a>");
    }
%><br>
<table border="1" width="450" rules="none" cellspacing="0" cellpadding="0">
    <tr height="50">
        <td colspan="3" align="center">�ṩ��Ʒ����</td>
    </tr>
    <tr align="center" height="30" bgcolor="lightgrey">
        <td>����</td>
        <td>�۸�(Ԫ/��)</td>
        <td>����</td>
    </tr>
    <% if (goodslist == null || goodslist.size() == 0) { %>
    <tr height="100">
        <td colspan="3" align="center">û����Ʒ����ʾ��</td>
    </tr>
    <%
    } else {
        for (int i = 0; i < goodslist.size(); i++) {
            GoodsSingle single = (GoodsSingle) goodslist.get(i);
    %>
    <tr height="50" align="center">
        <td><%=single.getName()%>
        </td>
        <td><%=single.getPrice()%>
        </td>
        <td><a href="docar.jsp?action=buy&id=<%=i%>">����</a></td>
    </tr>
    <%
            }
        }
    %>
    <tr height="50">
        <td align="center" colspan="3"><a href="<% if(session.getAttribute("name") != null) {
    out.println("shopcar.jsp");
} else {
    out.println("/login.html");
}%>">�鿴���ﳵ</a></td>
    </tr>
</table>
</body>
</html>

