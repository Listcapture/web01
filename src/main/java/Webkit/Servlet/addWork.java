package Webkit.Servlet;

import Webkit.Entity.xnsx;
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
 * @ Date       ：Created in 16:11 2023/7/7
 * @ Description：
 * @ Modified By：
 */
@WebServlet("/addWork")
public class addWork extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      String date=req.getParameter("date"),time=req.getParameter("time"),head=req.getParameter("head"),content=req.getParameter("content");
        service.addWork(date,time,head,content);
        HttpSession session=req.getSession();
        String message="添加成功";
        session.setAttribute("message",message);
        req.getRequestDispatcher("/WEB-INF/JSP/manage.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }
}
