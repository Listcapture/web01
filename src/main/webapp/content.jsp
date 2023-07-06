<%--
  Created by IntelliJ IDEA.
  User: 李田
  Date: 2023/7/4
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@include file="nav.jsp"%>
<c:url var="b" value="/"></c:url>
<base href="${b}">
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="resources/CSS/lbt.css">

    <title>css轮播</title>
</head>
<body>

<!--主容器-->
<div class="container" style="width:100%">
    <!--控制转到第几张按钮-->
    <input id="btn1"  name="dir" type="radio"  />
    <input id="btn2"  name="dir" type="radio"  />
    <input id="btn3" name="dir" type="radio"  />
    <input id="btn4" name="dir" type="radio"  />
    <input id="btn5" name="dir" type="radio"  />

    <!--控制往左边轮播-->
    <input id="left_btn1" class="dir_btn" name="dir" type="radio"  />
    <input id="left_btn2" class="dir_btn" name="dir" type="radio"  />
    <input id="left_btn3" class="dir_btn" name="dir" type="radio"  />
    <input id="left_btn4" class="dir_btn" name="dir" type="radio"  />
    <input id="left_btn5" class="dir_btn" name="dir" type="radio"  />

    <!--控制往右边轮播-->
    <input id="right_btn1" class="dir_btn"  name="dir" type="radio"  />
    <input id="right_btn2"  class="dir_btn" name="dir" type="radio"  />
    <input id="right_btn3" class="dir_btn" name="dir" type="radio"  />
    <input id="right_btn4" class="dir_btn" name="dir" type="radio"  />
    <input id="right_btn5" class="dir_btn" name="dir" type="radio"  />

    <!--存放图片-->
    <div class="pic">

        <!--给所有图片套一个盒子 通过左边距进行轮播-->
        <div class="box">
            <img src="resources/imgs/northern-lights.jpg">
            <img src="resources/imgs/background.png">
            <img src="resources/imgs/northern-lights.jpg">
            <img src="resources/imgs/github.png">
            <img src="resources/imgs/NEFU.png">
        </div>

        <!--给图片前面加一层图片层 用于实现无缝轮播-->
        <div class="before_box">
            <img src="resources/imgs/northern-lights-3273425_1280.jpg">
            <img src="resources/imgs/northern-lights.jpg">
        </div>

        <!--给图片后面加一层图片层 用于实现无缝轮播-->
        <div class="after_box">
            <img src="resources/imgs/northern-lights.jpg">
            <img src="resources/imgs/northern-lights-3273425_1280.jpg">
        </div>
    </div>

    <!--左边的按钮 每次点击都会根据当前是第几张决定显示的按钮-->
    <div class="left_box dir_box">
        <label class="left_btn_1 btn_btn_1" for="left_btn1"></label>
        <label class="left_btn_2 btn_btn_2" for="left_btn2"></label>
        <label class="left_btn_3 btn_btn_3" for="left_btn3"></label>
        <label class="left_btn_4 btn_btn_4" for="left_btn4"></label>
        <label class="left_btn_5 btn_btn_5" for="left_btn5"></label>
    </div>

    <!--右边的按钮 每次点击都会根据当前是第几张决定显示的按钮-->
    <div class="right_box dir_box">
        <label class="right_btn_1 btn_btn_1" for="right_btn1"></label>
        <label class="right_btn_2 btn_btn_2" for="right_btn2"></label>
        <label class="right_btn_3 btn_btn_3" for="right_btn3"></label>
        <label class="right_btn_4 btn_btn_4" for="right_btn4"></label>
        <label class="right_btn_5 btn_btn_5" for="right_btn5"></label>
    </div>

    <!--下方按钮 点击各个按钮 决定跳转到第几张-->
    <div class="count">
        <ul>
            <li id="c-0" class="current">
                <label class="btn_1" for="btn1"></label>
            </li>
            <li id="c-1">
                <label class="btn_2" for="btn2"></label>
            </li>
            <li id="c-2">
                <label class="btn_3" for="btn3"></label>
            </li>
            <li id="c-3">
                <label class="btn_4" for="btn4"></label>
            </li >
            <li id="c-4">
                <label class="btn_5" for="btn5"></label>
            </li>
        </ul>
    </div>

</div>

</body>
</html>
