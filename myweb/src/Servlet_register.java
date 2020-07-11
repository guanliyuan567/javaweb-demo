import dao.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintStream;
import java.nio.file.spi.FileSystemProvider;
import java.lang.String;


@WebServlet("/register")
public class Servlet_register extends HttpServlet {


    private FileSystemProvider session;
    private PrintStream out;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String name = request.getParameter("username");
        String pass1 = request.getParameter("password1");
        String pass2 = request.getParameter("password2");
        if (pass1.equals(pass2) && UserDAO.register(name, pass1)) {
            out.println("注册成功！！");
            out.println("<a href='login.html'>请登录</a>");
        } else {
            out.println("注册失败");
            out.println("<a href='register.html'>重新注册</a>");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}