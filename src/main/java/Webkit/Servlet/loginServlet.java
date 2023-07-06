package Webkit.Servlet;

import Webkit.Entity.User;
import Webkit.Login.loginTest;
import com.mysql.cj.Session;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * @ Author     :LeeTee.
 * @ Date       ：Created in 6:19 2023/7/4
 * @ Description：
 * @ Modified By：
 */
@WebServlet("/login")
public class loginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String account=(String)req.getParameter("account");
        String password=(String)req.getParameter("password");
        User loginuser=new User(account,password);
        User examineUser= loginTest.login(loginuser);
        String loginMessage=null;
        if(examineUser!=null)
        {
            req.setAttribute("user",examineUser);
            HttpSession session=req.getSession();
            session.setAttribute("user",examineUser);
            session.setAttribute("message",null);
            session.setAttribute("loginMessage",loginMessage);
            req.getRequestDispatcher("/home.jsp").forward(req,resp);
        }else {

            HttpSession session=req.getSession();
            loginMessage="登录失败,用户名或密码错误";
            req.setAttribute("loginMessage",loginMessage);
            req.getRequestDispatcher("/login.jsp").forward(req,resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }
}
