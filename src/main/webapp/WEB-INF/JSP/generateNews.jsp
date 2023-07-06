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
        .news-dist:hover{

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
            <div class="news-dist-head">${news.head}</div>
            <hr>
            <div class="news-dist-item">
                <div class="item">
                    ${news.content}
                </div>
                <div class="footer-item " >
                    <span>report by NEFU-SE ${news.date}</span>
                </div>

            </div>

        </div>
    </div>
</div>

</body>
</html>
<%@include file="/footer.jsp"%>