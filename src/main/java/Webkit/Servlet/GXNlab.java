package Webkit.Servlet;

import Webkit.Entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * @ Author     :LeeTee.
 * @ Date       ：Created in 12:33 2023/7/5
 * @ Description：
 * @ Modified By：
 */
@WebServlet("/GXNlab")
public class GXNlab extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User u= new User();
        u.setClientName((String) req.getAttribute("clientName"));
        u.setPassword((String) req.getAttribute("password"));
        req.setAttribute("user",u);
        req.getRequestDispatcher("/WEB-INF/JSP/GXNlab.jsp").forward(req,resp);
    }
}
