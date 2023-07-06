package Webkit.Servlet;

import Webkit.Entity.User;
import Webkit.Login.loginTest;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

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
        User loginuser=new User();
        loginuser.setClientName(account);
        loginuser.setPassword(password);
        User examineUser= loginTest.login(loginuser);
        if(examineUser!=null)
        {
            req.setAttribute("user",examineUser);
            req.getRequestDispatcher("/home.jsp").forward(req,resp);
        }else {
            String msg="ERROR";
            req.setAttribute("msg" ,msg);
            req.getRequestDispatcher("/login.jsp").forward(req,resp);
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }
}
