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
 * @ Date       ：Created in 11:19 2023/7/5
 * @ Description：
 * @ Modified By：
 */
@WebServlet("/directionIntroduction")
public class directionIntroduction extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/JSP/directionIntroduction.jsp").forward(req,resp);
    }
}
