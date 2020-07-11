import bean.toolbean.MyTools;
import bean.toolbean.ShopCar;
import bean.valuebean.GoodsSingle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.file.spi.FileSystemProvider;
import java.util.ArrayList;

@WebServlet("/docar")
public class Servlet_docar extends HttpServlet {


    private FileSystemProvider session;
    private ShopCar myCar;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null)
            action = "";
        if (action.equals("buy")) {                                    //购买商品

            ArrayList goodslist = (ArrayList) request.getAttribute("goodslist");//??
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


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}