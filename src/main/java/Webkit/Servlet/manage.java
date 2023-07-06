package Webkit.Servlet;

import Webkit.DataBaseUtils;
import Webkit.Entity.User;
import Webkit.Entity.News;
import Webkit.Login.loginTest;
import com.mysql.cj.protocol.x.XMessage;
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
import java.util.ArrayList;
import java.util.List;

/**
 * @ Author     :LeeTee.
 * @ Date       ：Created in 21:19 2023/7/5
 * @ Description：
 * @ Modified By：
 */
@WebServlet("/manage")
public class manage extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        个人信息
        String sql="select * from news";
        List<News> newsList= new ArrayList<News>(),noticeList=new ArrayList<>();
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
                newsList.add(new News(head,date,content));
            }

        }catch (Exception e)
        {
            System.out.println("加载新闻失败,数据库连接失效!");
        }
        req.setAttribute("news",newsList);
        sql="select * from notice";
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

        }catch (Exception e)
        {
            System.out.println("加载公告失败,数据库连接失效!");
        }
        req.setAttribute("notices",noticeList);
        //公告 标题-时间-内容 notices
        req.getRequestDispatcher("/WEB-INF/JSP/manage.jsp").forward(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
          this.doPost(req,resp);
    }
}
