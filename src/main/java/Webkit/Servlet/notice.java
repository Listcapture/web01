package Webkit.Servlet;

import Webkit.DataBaseUtils;
import Webkit.Entity.News;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @ Author     :LeeTee.
 * @ Date       ：Created in 23:49 2023/7/5
 * @ Description：
 * @ Modified By：
 */
@WebServlet("/notice")
public class notice extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sql="select * from news";
        List<News> noticeList=new ArrayList<>();
        //新闻  标题-时间-内容 News
        try (Connection conn= DataBaseUtils.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql);)
        {
            ResultSet rs=stmt.executeQuery(sql);
            String head,date,content;
            while(rs.next())
            {
                head=rs.getString("head");
                date=rs.getString("date");
                content=rs.getString("content");
                noticeList.add(new News(head,date,content));
            }
            req.setAttribute("notice",noticeList);
            req.getRequestDispatcher("home.jsp").forward(req,resp);
        }catch (Exception e)
        {
            System.out.println("加载公告失败,数据库连接失效!");
        }

    }
}
