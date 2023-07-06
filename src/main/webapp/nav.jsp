<%@ page import="Webkit.Entity.User" %><%--
  Created by IntelliJ IDEA.
  User: 李田
  Date: 2023/7/4
  Time: 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page  language="java"  pageEncoding="UTF-8" %>
<c:url var="b" value="/"></c:url>
<base href="${b}">
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/CSS/nav.css">
    <style>
        a{
            text-decoration: none;
         }
    </style>
</head>

<body>
<div class="navigation" style="list-style: none;z-index:9999">
    <ul class="shell">
        <li class="button">
            <a href="home.jsp?clientName=${user.clientName}&password=${user.password}" style="text-decoration: none"><span>首页</span></a>
        </li>
        <li class="button">

            <span>专业介绍</span>
            <!--    图片+描述 static -->
            <ul>
                <a href="positionIntroduction?clientName=${user.clientName}&password=${user.password}" target="_blank"><li>专业简介</li></a>
                <a href="directionIntroduction?clientName=${user.clientName}&password=${user.password}" target="_blank"><li>方向简介</li></a>
            </ul>
        </li>
        <li class="button">
            <!--    图片+描述 static-->
            <span>实验室</span>
            <ul>
                <a href="ICTlab?clientName=${user.clientName}&password=${user.password}"><li>ICT实验室</li></a>
                <a href="WSlab?clientName=${user.clientName}&password=${user.password}"><li>WS实验室</li></a>
                <a href="NLPlab?clientName=${user.clientName}&password=${user.password}"><li>NLP实验室</li></a>
                <a href="GXNlab?clientName=${user.clientName}&password=${user.password}"><li>高性能实验室</li></a>
            </ul>
        </li>
        <li class="button">
            <!--  card 展示 static -->
            <span>教师队伍</span>
            <ul>
                <a href="Professor?clientName=${user.clientName}&password=${user.password}"> <li>教授</li></a>
                <a href="ViceProfessor?clientName=${user.clientName}&password=${user.password}"> <li>副教授</li></a>
                <a href="Tutor?user=?clientName=${user.clientName}&password=${user.password}"> <li>讲师</li></a>
            </ul>
        </li>
        <li class="button">
            <a href="xnsxh" target="" style="text-decoration: none"><span>就业指南</span></a>
        </li>
        <li class="button">
            <a href="" style="text-decoration: none"><span>新闻</span></a>
        </li>
        <li class="button" style="text-decoration: none">
            <a href=""><span>公告</span></a>
        </li>
    </ul>


</div>

</body>

</html>
