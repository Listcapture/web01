package Webkit.Servlet;

import Webkit.Service.service;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * @ Author     :LeeTee.
 * @ Date       ：Created in 17:08 2023/7/7
 * @ Description：
 * @ Modified By：
 */
@WebServlet("/addNews")
public class addNews extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String date=req.getParameter("date"),head=req.getParameter("head"),content=req.getParameter("content");
        service.addNews(date,head,content);
        HttpSession session=req.getSession();
        String message="添加成功";
        session.setAttribute("message",message);
        req.getRequestDispatcher("/WEB-INF/JSP/manage.jsp").forward(req,resp);
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }
}
