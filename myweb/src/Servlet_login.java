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


@WebServlet("/login")
public class Servlet_login extends HttpServlet {


    private FileSystemProvider session;
    private PrintStream out;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String username=request.getParameter("username");
        String password=request.getParameter("password");
        if(UserDAO.login(username,password)){
           out.println("welcome"+username);

          // session.setAttribute("name",username);to do
            response.sendRedirect("index.jsp");
        } else {
           out.println("登陆失败");
            response.sendRedirect("login.html");
        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}