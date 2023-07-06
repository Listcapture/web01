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
        if(ok)
        {
            String sqlx="update User set clientName=? ";
            String sqly="update User set password = ? ";
            try (Connection conn= DataBaseUtils.getConnection(); PreparedStatement stmt1=conn.prepareStatement(sqlx);PreparedStatement stmt2=conn.prepareStatement(sqly);){
                stmt1.setString(1,String.valueOf(req.getParameter("LclientName")));
                stmt2.setString(1,String.valueOf(req.getParameter("Lpassowrd")));
                stmt1.execute();
                stmt2.execute();
            }catch (Exception e)
            {
                e.printStackTrace();
            }
           session.setAttribute("message","更新成功");

        }else session.setAttribute("message","输入原账号/密码错误!");

        req.getRequestDispatcher("/WEB-INF/JSP/manage.jsp").forward(req,resp);

    }

}