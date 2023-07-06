package Webkit.Servlet;

import Webkit.DataBaseUtils;
import Webkit.Entity.User;
import Webkit.Entity.xnsx;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.awt.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * @ Author     :LeeTee.
 * @ Date       ：Created in 0:06 2023/7/5
 * @ Description：
 * @ Modified By：
 */
@WebServlet("/xnsxh")
public class xnsxh extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<xnsx> xnsxs=new ArrayList<xnsx>();
        User u= new User();
        u.setClientName((String) req.getAttribute("clientName"));
        u.setPassword((String) req.getAttribute("password"));
        req.setAttribute("user",u);
        try (Connection conn = DataBaseUtils.getConnection(); Statement stmt = conn.createStatement())
        {
            ResultSet rs= stmt.executeQuery("select * from xnsxh");

            while(rs.next()) {
                String date = rs.getString("date"), time = rs.getString("time"), head = rs.getString("head");
                String content = rs.getString("content");
                resp.setContentType("text/html");
                xnsx xnsxh1=new xnsx(time,date,head,content);
                xnsxs.add(xnsxh1);

            }
            req.setAttribute("xnsxs",xnsxs);
            req.getRequestDispatcher("/WEB-INF/JSP/xnsxh.jsp").forward(req,resp);

        }catch (Exception e){
            e.printStackTrace();
        }


    }
}
