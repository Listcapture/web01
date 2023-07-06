package Webkit.test;

import Webkit.DataBaseUtils;
import Webkit.Entity.News;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @ Author     :LeeTee.
 * @ Date       ：Created in 22:57 2023/7/3
 * @ Description：
 * @ Modified By：
 */
public class testlogin {

    public static void main(String[] args) {
        String sql="select * from news";
        List<News> newsList=new ArrayList<>();
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
    }
}
