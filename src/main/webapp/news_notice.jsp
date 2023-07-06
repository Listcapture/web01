<%@ page import="Webkit.Entity.News" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="Webkit.DataBaseUtils" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
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
            height:60%;
            display: flex;
            align-items: flex-start;
            justify-content: center;

        }
        .news-dist{
            width:40%;
            height:60%;

        }
        .news-dist:hover{
            box-shadow: rgba(50, 50, 93, 0.25) 0px 30px 60px -12px inset, rgba(0, 0, 0, 0.3) 0px 18px 36px -18px inset;
        }
        .notice-dist:hover{
            box-shadow: rgba(50, 50, 93, 0.25) 0px 30px 60px -12px inset, rgba(0, 0, 0, 0.3) 0px 18px 36px -18px inset;
        }
        .news-dist-head{
            font-size: 2em;
            text-align: center;
            border-top: 2px solid red;
            border-left: 1px deeppink solid;
            border-right: 1px pink solid;
            border-bottom: 1px aliceblue solid;
            padding: 10px;
        }
        .news-dist-item{
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .item:hover{
            box-shadow: rgba(3, 102, 214, 0.3) 0px 0px 0px 3px;
        }
        .item{
            display: flex;
            padding: 10px;
            flex-wrap: wrap;
            align-items: center;
            justify-content: center;
        }

        .space{
            width:20px;
        }
        .notice-dist{
            width: 40%;
            height:60%;
        }
        .auto-sub{
            display: none;
        }
        #item-text{
            position: relative;
            right: 0;
        }
        a{
            color:white;
        }
    </style>
</head>
<body>

<div class="board">
    <div class="board-content">
        <div class="news-dist">
            <div class="news-dist-head">要闻</div>
            <div class="news-dist-item">
                <ul>
                    <%

                         String sqlx="select * from news";
                         List<News> newsLists=new ArrayList<>();
                        //新闻  标题-时间-内容 News
                        try (Connection conn= DataBaseUtils.getConnection(); PreparedStatement stmt = conn.prepareStatement(sqlx);)
                        {
                            ResultSet rs=stmt.executeQuery(sqlx);
                            String head,date,content;
                            while(rs.next())
                            {
                                head=rs.getString("head");
                                date=rs.getString("date");
                                content=rs.getString("content");
                                News n=new News(head,date,content);
                                newsLists.add(n);
                            }
                            request.setAttribute("news",newsLists);
                        }catch (Exception e)
                        {
                            System.out.println("加载新闻失败,数据库连接失效!");
                        }
                    %>
                    <c:set var="curn" value="1"></c:set>
                    <c:forEach items="${news}" var="n" >
<%--                        <c:if test="${cnt>=6}">--%>
<%--                            <c:set var="flag" value="false"></c:set>--%>
<%--                        </c:if>--%>
                        <a href="GenerateNews?number=${curn}&types=news&clentName=${user.clientName}&password=${user.password}"><li class="item" style="font-size: 1.2em;border-bottom: 1px aliceblue solid; padding: 10px;">${n.head}<span id="item-text" style="font-size: 0.25em;">&nbsp;&nbsp;${n.date}</span></li></a>
                        <c:set var="curn" value="${curn+1}"></c:set>
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
                        sqlx="select * from notice";
                        List<News> noticeList=new ArrayList<>();
                        //新闻  标题-时间-内容 News
                        try (Connection conn= DataBaseUtils.getConnection(); PreparedStatement stmt = conn.prepareStatement(sqlx);)
                        {
                            ResultSet rs=stmt.executeQuery(sqlx);
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
                    <c:set var="cur" value="1"></c:set>
                    <c:forEach items="${notice}" var="n" >
                        <a href="GenerateNews?number=${cur}&types=notice&clentName=${user.clientName}&password=${user.password}"><li class="item" style="font-size: 1.2em;border-bottom: 1px aliceblue solid; padding: 10px;">${n.head}<span id="item-text" style="font-size: 0.25em">&nbsp;&nbsp;${n.date}</span></li></a>
                        <c:set var="cur" value="${cur+1}"></c:set>
                    </c:forEach>

                </ul>
            </div>

        </div>


    </div>
</div>

</body>
</html>