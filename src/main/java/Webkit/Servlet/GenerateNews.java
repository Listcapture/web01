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

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * @ Author     :LeeTee.
 *
 * @ Date       ：Created in 10:11 2023/7/6
 * @ Description：
 * @ Modified By：
 */
@WebServlet("/GenerateNews")
public class GenerateNews extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setAttribute("user", loginTest.login(new User((String)req.getAttribute("clientName"),(String)req.getAttribute("password"))));
        int Index=Integer.valueOf(req.getParameter("number"));
        String type=String.valueOf(req.getParameter("types"));
        if(type.equals("news"))
        {
            //news -get Info
            String sql="select * from news ORDER BY ID DESC";
            //新闻  标题-时间-内容 News
            try (Connection conn= DataBaseUtils.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql);)
            {
                ResultSet rs=stmt.executeQuery(sql);
                String head,date,content;
                while(rs.next())
                {
                    int id=rs.getInt("id");
                    if(id!=Index)
                    {
                        continue;
                    }else {
                        head=rs.getString("head");
                        date=rs.getString("date");
                        content=rs.getString("content");
                        News n=new News(head,date,content);
                        req.setAttribute("news",n);
                        break;

                    }
                }

            }catch (Exception e)
            {
                System.out.println("加载新闻失败,数据库连接失效!");
            }

        }else {
            //notice  -get Info
            String sql="select * from notice ORDER BY id DESC";
            //新闻  标题-时间-内容 News
            try (Connection conn= DataBaseUtils.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql);)
            {
                ResultSet rs=stmt.executeQuery(sql);
                String head,date,content;
                int index=0;
                while(rs.next())
                {
                    int  id=rs.getInt("id");
                    if(id!=Index)
                    {
                        continue;
                    }else {
                        head=rs.getString("head");
                        date=rs.getString("date");
                        content=rs.getString("content");
                        News n=new News(head,date,content);
                        req.setAttribute("news",n);

                        break;

                    }
                }

            }catch (Exception e)
            {
                System.out.println("加载公告失败,数据库连接失效!");
            }
        }
        req.getRequestDispatcher("/WEB-INF/JSP/generateNews.jsp").forward(req,resp);
    }
}
