package Webkit.Servlet;

import Webkit.DataBaseUtils;
import Webkit.Service.service;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import javax.swing.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;



/**
 * @ Author     :LeeTee.
 * @ Date       ：Created in 20:56 2023/7/6
 * @ Description：
 * @ Modified By：
 */

@WebServlet("/modifyUser")
public class modifyUser extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        boolean ok= service.isExist(String.valueOf(req.getParameter("FclientName")),String.valueOf(req.getParameter("Fpassword")));
        String message=null;
        if(ok)
        {
           service.updateUser(String.valueOf(req.getParameter("FclientName")),String.valueOf(req.getParameter("Fpassword")),String.valueOf(req.getParameter("LclientName")),String.valueOf(req.getParameter("Lpassword")));
          message="更新成功";
        }else message="输入原账号/密码错误!";
        session.setAttribute("message",message);
        req.getRequestDispatcher(service.lastUrlPath(req.getContextPath())+"/index").forward(req,resp);

    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }
}