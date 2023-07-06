<%--
  Created by IntelliJ IDEA.
  User: 李田
  Date: 2023/6/29
  Time: 13:54
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<c:url var="b" value="/"></c:url>
<base href="${b}">
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link type="text/css" href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <link rel="stylesheet" href="resources/CSS/bgm.css">
    <link rel="stylesheet" href="resources/CSS/Header.css">
</head>
<body>
<audio id="bgm" src="resources/music/AsItWas.mp3" controls="controls"  ></audio>
<c:if test="${user==null}">
    <div style="background-color: #002147;color: white;width:100%;text-align: right">账号：admin，密码：admin123</div>
</c:if>

<div class="header">
    <div class="title">
        <img src="resources/imgs/logo.jpg" alt="">
        <div class="header-content">
            <span class="header-titile">软件工程专业网站</span>
            <div class="header-titile-En"><span>Website of SoftWare Engineering</span></div>
        </div>
    </div>

    <div class="Admin">
        <c:if test="${user!=null}">
        </c:if>
        <c:if test="${user==null}">
            <i class="material-icons" >person_pin</i>
        </c:if>

        <div class="choice">
            <c:if test="${user!=null}">
                <form action="manage" method="post">
                    <input style="display: none" type="text" name="clientName" value="${user.clientName}">
                    <input style="display: none" type="password" name="password" value="${user.password}">
                    <button type="submit" style="color:white;background-image: -webkit-linear-gradient(right,aliceblue,lightcoral,lightskyblue,antiquewhite);border-radius:3px;background-color: #447fff;color: white">管理网站</button>
                </form>

            </c:if>
            <c:if test="${user==null}">
                <button type="button" style="color:white;background-image:-webkit-linear-gradient(right,aliceblue,lightcoral,lightskyblue,antiquewhite) ;border-radius:3px;background-color: #447fff;color: white;padding: 3px"><a href="login.jsp" style="text-decoration: none;color: white">登录</a></button>
            </c:if>

        </div>
    </div>
</div>




</body>
</html>