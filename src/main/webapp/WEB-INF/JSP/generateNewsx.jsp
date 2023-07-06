<%--
  Created by IntelliJ IDEA.
  User: 李田
  Date: 2023/7/6
  Time: 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/header.jsp"%>
<%@include file="/nav.jsp"%>

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
      list-style: none;
      list-style-type: none;

    }
    a{
      color: white;
    }
    .board{
      color: deeppink;
      width:100%;
      height: 1280px;
      box-sizing: border-box;
      z-index: 999;
      color:white;
      box-shadow: rgba(50, 50, 93, 0.25) 0px 30px 60px -12px inset, rgba(0, 0, 0, 0.3) 0px 18px 36px -18px inset;
      background: -webkit-linear-gradient(right,aliceblue,lightcoral,lightskyblue,antiquewhite);
    }
    .board-content{

      width: 100%;
      height:100%;
      display: flex;
      align-items: flex-start;
      justify-content: center;

    }
    .news-dist{
      width:60%;
      height:70%;

    }


    .news-dist-head{
      font-size: 2em;
      text-align: center;
      border-top: 2px solid red;
      border-left: 1px deeppink solid;
      padding: 10px;
      border-right: 1px pink solid;
      border-bottom: 1px aliceblue solid;
    }
    .news-dist-item{
      padding: 10px;

    }
    .item:hover{
      box-shadow: rgba(3, 102, 214, 0.3) 0px 0px 0px 3px;
    }
    .item{
      padding: 10px;
      display: flex;
      align-items: center;
      justify-items: center;
      height:inherit;

    }
    .footer-item{
      width: inherit;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 10px;
    }

  </style>
</head>
<body>
<div class="board">
  <div class="board-content">
    <div class="news-dist">
      <div class="news-dist-head">
       ${stype}
      </div>
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
            <c:if test="${stype=='news'}">
              <c:forEach items="${news}" var="n" >
              <a href="GenerateNews?number=${curn}&types=${type}&clentName=${user.clientName}&password=${user.password}"><li class="item" style="font-size: 1.2em;border-bottom: 1px aliceblue solid; padding: 10px;">${n.head}<span id="item-text" style="font-size: 0.25em;">&nbsp;&nbsp;${n.date}</span></li></a>
                <c:set var="curn" value="${curn+1}"></c:set>
             </c:forEach>

            </c:if>
          <c:if test="${stype=='notice'}">
            <c:forEach items="${notice}" var="n" >
              <a href="GenerateNews?number=${curn}&types=${stype}&clentName=${user.clientName}&password=${user.password}"><li class="item" style="font-size: 1.2em;border-bottom: 1px aliceblue solid; padding: 10px;">${n.head}<span id="item-text" style="font-size: 0.25em;">&nbsp;&nbsp;${n.date}</span></li></a>
              <c:set var="curn" value="${curn+1}"></c:set>
            </c:forEach>

          </c:if>


        </ul>
      </div>

    </div>
  </div>
</div>

</body>
</html>
<%@include file="/footer.jsp"%>