package Webkit.Servlet;

import Webkit.DataBaseUtils;
import Webkit.Service.service;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import javax.xml.crypto.Data;
import java.awt.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * @ Author     :LeeTee.
 * @ Date       ：Created in 20:36 2023/7/6
 * @ Description：
 * @ Modified By：
 */
@WebServlet("/addUser")
public class addUser extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sql="insert into User (clientName,password) values (?,?)";
        service.addUser(String.valueOf(req.getParameter("clientName")),String.valueOf(req.getParameter("password")));
        HttpSession session=req.getSession();
        session.setAttribute("message","添加成功!");
        req.getRequestDispatcher("/WEB-INF/JSP/manage.jsp").forward(req,resp);
    }

}
