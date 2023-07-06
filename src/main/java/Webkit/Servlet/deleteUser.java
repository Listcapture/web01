package Webkit.Servlet;

import Webkit.DataBaseUtils;
import Webkit.Service.service;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * @ Author     :LeeTee.
 * @ Date       ：Created in 20:42 2023/7/6
 * @ Description：
 * @ Modified By：
 */
@WebServlet("/deleteUser")
public class deleteUser extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String message=null;
        int id= (int )Integer.valueOf(req.getParameter("id"));
        boolean ok=service.getClientNameByID((int)Integer.valueOf(req.getParameter("id")))!=null;
        HttpSession session=req.getSession();
        if(ok)
        {
            service.deleteUser(id);
            message="删除成功";
        }else message="删除失败,用户ID不存在";
        session.setAttribute("message",message);
        req.getRequestDispatcher("/WEB-INF/JSP/manage.jsp").forward(req,resp);

    }



}