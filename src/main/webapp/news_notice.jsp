<%@ page import="Webkit.Entity.News" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="Webkit.DataBaseUtils" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<c:url var="b" value="/"></c:url>
<base href="${b}">
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        *{
            margin:0;
            padding: 0;
        }
        .board{
            color: deeppink;
            box-sizing: border-box;
            z-index: 999;
            color:white;

        }
        .board-content{
            background: -webkit-linear-gradient(right,aliceblue,lightcoral,lightskyblue,antiquewhite);
            width: 100%;
            height:100%;
            display: flex;
            align-items: center;
            justify-content: center;

        }
        .news-dist{
            width:40%;
            height:100%;

        }
        .news-dist-head{
            font-size: 2em;
            text-align: center;
            border-top: 2px solid red;
            border-left: 1px deeppink solid;
            border-right: 1px pink solid;
            border-bottom: 1px aliceblue solid;
        }
        .news-dist-item{
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .space{
            width:20px;
        }
        .notice-dist{
            width: 40%;
            height: 100%;
        }
        .auto-sub{
            display: none;
        }
    </style>
</head>
<body>
<form class="auto-sub" action="News" method="get" ><button type="submit"></button></form>
<form class="auto-sub" action="notice" method="get"><button  type="submit"></button></form>
<div class="board">
    <div class="board-content">
        <div class="news-dist">
            <div class="news-dist-head">要闻</div>
            <div class="news-dist-item">
                <ul>
                    <%
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
                            request.setAttribute("news",newsList);
                        }catch (Exception e)
                        {
                            System.out.println("加载新闻失败,数据库连接失效!");
                        }

                    %>

                    <c:forEach items="${news}" var="n" >
<%--                        <c:if test="${cnt>=6}">--%>
<%--                            <c:set var="flag" value="false"></c:set>--%>
<%--                        </c:if>--%>
                        <li class="item" style="font-size: 1.2em;border-bottom: 1px aliceblue solid; padding: 10px;">${n.head}<span style="font-size: 0.25em">&nbsp;&nbsp;${n.date}</span></li>
                    </c:forEach>
                </ul>
            </div>

        </div>
        <div class="space"></div>
        <div class="notice-dist">
            <div class="news-dist-head">公告</div>
            <div class="news-dist-item">
                <ul>
                    <%
                       sql="select * from notice";
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
                                News n=new News(head,date,content);
                                noticeList.add(n);
                            }
                            request.setAttribute("notice",noticeList);
                        }catch (Exception e)
                        {
                            System.out.println("加载新闻失败,数据库连接失效!");
                        }

                    %>

                    <c:forEach items="${notice}" var="n" >
                        <%--                        <c:if test="${cnt>=6}">--%>
                        <%--                            <c:set var="flag" value="false"></c:set>--%>
                        <%--                        </c:if>--%>
                        <li class="item" style="font-size: 1.2em;border-bottom: 1px aliceblue solid; padding: 10px;">${n.head}<span style="font-size: 0.25em">&nbsp;&nbsp;${n.date}</span></li>
                    </c:forEach>

                </ul>
            </div>

        </div>


    </div>
</div>

</body>
</html>