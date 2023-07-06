package Webkit.Servlet;

import Webkit.DataBaseUtils;
import Webkit.Entity.News;
import Webkit.Entity.User;
import Webkit.Login.loginTest;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.awt.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @ Author     :LeeTee.
 * @ Date       ：Created in 12:16 2023/7/6
 * @ Description：
 * @ Modified By：
 */

@WebServlet("/GenerateNewsx")
public class GenerateNewsx extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String stype= (String)req.getParameter("types");
        req.setAttribute("stype",stype);
        List<News> newsList=new ArrayList<>(),noticeList=new ArrayList<>();
        if(stype.equals("news"))
        {
            //news -get Info
            String sql="select * from news";
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
                        News n=new News(head,date,content);
                        newsList.add(n);
                }

            }catch (Exception e)
            {
                System.out.println("加载新闻失败,数据库连接失效!");
            }
            req.setAttribute("news",newsList);
        }else {
            //notice  -get Info
             String sqly="select * from notice";
            //新闻  标题-时间-内容 News
            try (Connection conn= DataBaseUtils.getConnection(); PreparedStatement stmt = conn.prepareStatement(sqly);)
            {
                ResultSet rs=stmt.executeQuery(sqly);
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


          req.setAttribute("notice",noticeList);
        }
        req.getRequestDispatcher("/WEB-INF/JSP/generateNewsx.jsp").forward(req,resp);
    }
}
