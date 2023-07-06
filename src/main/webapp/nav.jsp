<%@ page import="Webkit.Entity.User" %>
<%@ page import="Webkit.Entity.News" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Webkit.DataBaseUtils" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.awt.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.ResultSet" %><%--
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
            color: white;
         }

        .lbt{
            width:100%;
            heght:720px;

        }
        .container{
            width: 960px;
            height:720px;
            overflow: hidden;
        }
        input[type=radio]{
            display: none;
        }
        li{
            list-style-type: none;
        }
        .container{
            position: relative;
            width:60%;
            height:55%;
            background:#333;
            overflow: hidden;

        }
        .box>image{
            width: 100%;
            height: 100%;
        }
        .pic{
            width:100%;
            height:100%;
            overflow: hidden;
        }
        .pic .box{
            position: relative;
            width:500%;
            height:100%;
            transition: margin 0.8s;
        }
        .pic .box > img{
            float: left;
            width:calc(100% / 5);
            height:100%;
            color: white;
        }
        .pic .before_box,
        .pic .after_box{
            position: absolute;
            top:0;
            width:200%;
            height:100%;
            opacity:0;
        }
        .pic .after_box{
            left:0;
        }
        .pic .before_box{
            right: 0;
        }
        .pic .after_box img,.pic .before_box img{
            width:50%;
            height:100%;
            float: left;
        }
        .count{
            display: flex;
            align-items:center;
            justify-content:center;
            position: absolute;
            bottom: 0;
            left:0;
            width:100%;
            height:10%;
            background:rgba(255,255,255,.1);
        }
        .count > ul{
            display: flex;
            align-items:center;
            justify-content:space-around;
            width:30%;
            height:100%;
        }
        .count li{
            float: left;
            width:1.2vmax;
            height:1.2vmax;
            border-radius: 50%;
        }
        .count li label{
            display: block;
            width:14px;
            height:14px;
            background:#447fff;
            border-radius: 50%;
            cursor: pointer;
            transition: 0.8s;
        }
        .count li .btn_1{
            background:white;
        }


        .dir_box{
            position: absolute;
            top:calc((100% - 100px) / 2);
            display: flex;
            width: 100px;
            height: 100px;
            background:rgba(0,0,0,.2);
        }
        .left_box{
            left:0;
        }
        .right_box{
            right:0;
        }

        .dir_box label{
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 50px;
            width: 100%;
            height: 100%;
            color: white;
            cursor: pointer;
        }
        .left_box label::after{
            content: "<";
        }
        .right_box label::after{
            content: ">";
        }

        .dir_box label{
            display: none;
        }
        .left_box .left_btn_1{
            display: flex;
        }
        .right_box .right_btn_1{
            display: flex;
        }
        /* 每次点击按钮 重置当前焦点按钮的样式 */
        input[type=radio]:checked ~ .count label{
            background: #447fff;
        }
        /* 重置当前显示的左右按钮 */
        input[type=radio]:checked ~ .dir_box label{
            display: none;
        }

        /* 下方按钮1 */
        #btn1:checked ~ .pic .box{
            margin-left: 0;
        }
        #btn1:checked ~ .count .btn_1{
            background:white;
        }
        #btn1:checked ~ .dir_box .btn_btn_1{
            display: flex;
        }

        /* 下方按钮2 */
        #btn2:checked ~ .pic .box{
            margin-left: -100%;
        }
        #btn2:checked ~ .count .btn_2{
            background:white;
        }
        #btn2:checked ~ .dir_box .btn_btn_2{
            display: flex;
        }

        /* 下方按钮3 */
        #btn3:checked ~ .pic .box{
            margin-left: -200%;
        }
        #btn3:checked ~ .count .btn_3{
            background:white;
        }
        #btn3:checked ~ .dir_box .btn_btn_3{
            display: flex;
        }

        /* 下方按钮4 */
        #btn4:checked ~ .pic .box{
            margin-left: -300%;
        }
        #btn4:checked ~ .count .btn_4{
            background:white;
        }
        #btn4:checked ~ .dir_box .btn_btn_4{
            display: flex;
        }

        /* 下方按钮5 */
        #btn5:checked ~ .pic .box{
            margin-left: -400%;
        }
        #btn5:checked ~ .count .btn_5{
            background:white;
        }
        #btn5:checked ~ .dir_box .btn_btn_5{
            display: flex;
        }


        /* 左边第一个按钮 */
        #left_btn1:checked ~ .pic .box{
            margin-left: -400%;
        }
        #left_btn1:checked ~ .count .btn_5{
            background:white;
        }
        #left_btn1:checked ~ .pic .before_box{
            transition: right 0.8s;
            opacity:1;
            right:-100%;
        }
        #left_btn1:checked ~ .dir_box .btn_btn_5{
            display: flex;
        }

        /* 右边第一个按钮 */
        #right_btn1:checked ~ .pic .box{
            margin-left: -100%;
        }
        #right_btn1:checked ~ .count .btn_2{
            background:white;
        }
        #right_btn1:checked ~ .dir_box .btn_btn_2{
            display: flex;
        }

        /* 左边第二个按钮 */
        #left_btn2:checked ~ .pic .box{
            margin-left: 0;
        }
        #left_btn2:checked ~ .count .btn_1{
            background:white;
        }
        #left_btn2:checked ~ .dir_box .btn_btn_1{
            display: flex;
        }

        /* 右边第二个按钮 */
        #right_btn2:checked ~ .pic .box{
            margin-left: -200%;
        }
        #right_btn2:checked ~ .count .btn_3{
            background:white;
        }
        #right_btn2:checked ~ .dir_box .btn_btn_3{
            display: flex;
        }

        /* 左边第三个按钮 */
        #left_btn3:checked ~ .pic .box{
            margin-left: -100%;
        }
        #left_btn3:checked ~ .count .btn_2{
            background:white;
        }
        #left_btn3:checked ~ .dir_box .btn_btn_2{
            display: flex;
        }

        /* 右边第三个按钮 */

        #right_btn3:checked ~ .pic .box{
            margin-left: -300%;
        }
        #right_btn3:checked ~ .count .btn_4{
            background:white;
        }
        #right_btn3:checked ~ .dir_box .btn_btn_4{
            display: flex;
        }

        /* 左边第四个按钮 */

        #left_btn4:checked ~ .pic .box{
            margin-left: -200%;
        }
        #left_btn4:checked ~ .count .btn_3{
            background:white;
        }
        #left_btn4:checked ~ .dir_box .btn_btn_3{
            display: flex;
        }

        /* 右边第四个按钮 */

        #right_btn4:checked ~ .pic .box{
            margin-left: -400%;
        }
        #right_btn4:checked ~ .count .btn_5{
            background:white;
        }
        #right_btn4:checked ~ .dir_box .btn_btn_5{
            display: flex;
        }

        /* 左边第五个按钮 */

        #left_btn5:checked ~ .pic .box{
            margin-left: -300%;
        }
        #left_btn5:checked ~ .count .btn_4{
            background:white;
        }
        #left_btn5:checked ~ .dir_box .btn_btn_4{
            display: flex;
        }

        /* 右边第五个按钮 */

        #right_btn5:checked ~ .pic .box{
            margin-left: -500%;
            transition: margin 0.8s 0s;
        }
        #right_btn5:checked ~ .pic .after_box{
            transition: left 0.8s;
            opacity:1;
            left:-100%;
        }
        #right_btn5:checked ~ .pic .box{
            margin-left: 0;
            transition: margin 0.8s 0s;
        }
        #right_btn5:checked ~ .count .btn_1{
            background:white;
        }
        #right_btn5:checked ~ .dir_box .btn_btn_1{
            display: flex;
        }

    </style>
</head>

<body>
<%
   String type1="news",type2="notice";
   request.setAttribute("type1",type1);
   request.setAttribute("type2",type2);
   request.setAttribute("user",(User)request.getAttribute("user"));
%>
<div class="navigation" style="list-style: none;z-index:9999">
    <ul class="shell">
        <li class="button" id="btn1">
            <a href="home?clientName=${user.clientName}&password=${user.password}" style="text-decoration: none"><span>首页</span></a>
        </li>
        <li class="button" id="btn2">

            <span>专业介绍</span>
            <!--    图片+描述 static -->
            <ul>
                <a href="positionIntroduction?clientName=${user.clientName}&password=${user.password}" target="_blank"><li>专业简介</li></a>
                <a href="directionIntroduction?clientName=${user.clientName}&password=${user.password}" target="_blank"><li>方向简介</li></a>
            </ul>
        </li>
        <li class="button" id="btn3">
            <!--    图片+描述 static-->
            <span>实验室</span>
            <ul>
                <a href="ICTlab?clientName=${user.clientName}&password=${user.password}"><li>ICT实验室</li></a>
                <a href="WSlab?clientName=${user.clientName}&password=${user.password}"><li>WS实验室</li></a>
                <a href="NLPlab?clientName=${user.clientName}&password=${user.password}"><li>NLP实验室</li></a>
                <a href="GXNlab?clientName=${user.clientName}&password=${user.password}"><li>高性能实验室</li></a>
            </ul>
        </li>
        <li class="button" id="btn4">
            <!--  card 展示 static -->
            <span>教师队伍</span>
            <ul>
                <a href="Professor?clientName=${user.clientName}&password=${user.password}"> <li>教授</li></a>
                <a href="ViceProfessor?clientName=${user.clientName}&password=${user.password}"> <li>副教授</li></a>
                <a href="Tutor?clientName=${user.clientName}&password=${user.password}"> <li>讲师</li></a>
            </ul>
        </li>
        <li class="button" id="btn5">
            <a href="xnsxh" style="text-decoration: none"><span>就业指南</span></a>
        </li>
        <li class="button" id="btn6">
            <a href="GenerateNewsx?types=news&option=sel1&clientName=${user.clientName}&password=${user.password}" ><span>新闻</span></a>
        </li>
        <li class="button" id="btn7"style="text-decoration: none">
            <a href="GenerateNewsx?types=notice&option=sel2?clientName=${user.clientName}&password=${user.password}"><span>公告</span></a>
        </li>
    </ul>


</div>

</body>

</html>
