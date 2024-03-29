package Webkit.Servlet;

import Webkit.Entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * @ Author     :LeeTee.
 * @ Date       ：Created in 16:08 2023/7/6
 * @ Description：
 * @ Modified By：
 */
@WebServlet("/index")
public class index extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        session.removeAttribute("user");
        session.removeAttribute("message");
        req.getRequestDispatcher("/home.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }
}
