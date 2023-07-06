package Webkit.Servlet;

import Webkit.DataBaseUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * @ Author     :LeeTee.
 * @ Date       ：Created in 20:48 2023/7/6
 * @ Description：
 * @ Modified By：
 */
@WebServlet("/findUser")
public class findUser extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String clientName= req.getParameter("clientName");
        String sql="select * from User where clientName=? ";
        try (Connection conn= DataBaseUtils.getConnection(); PreparedStatement stmt=conn.prepareStatement(sql);){
            stmt.setString(1,(String)req.getParameter("clientName"));
            ResultSet rs=stmt.executeQuery();
            while(rs.next())
            {
                req.setAttribute("id",rs.getString("id"));
            }
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        HttpSession session=req.getSession();
        session.setAttribute("message","添加成功!");
        req.getRequestDispatcher("/WEB-INF/JSP/manage.jsp").forward(req,resp);

    }

}
