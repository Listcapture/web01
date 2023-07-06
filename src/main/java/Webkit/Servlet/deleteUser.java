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
        String sql="delete from User where id=?";
        try (Connection conn= DataBaseUtils.getConnection(); PreparedStatement stmt=conn.prepareStatement(sql);){
            stmt.setInt(1,Integer.valueOf(req.getParameter("id")));
            stmt.executeUpdate();
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        HttpSession session=req.getSession();
        session.setAttribute("message","删除成功");
        req.getRequestDispatcher("/WEB-INF/JSP/manage.jsp").forward(req,resp);

    }

}