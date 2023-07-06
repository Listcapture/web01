<%--
  Created by IntelliJ IDEA.
  User: 李田
  Date: 2023/6/29
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" language="java" %>
<c:url var="b" value="/"></c:url>
<base href="${b}">
<html>
<head>
    <title>Title</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <link rel="stylesheet" href="resources/CSS/bgm.css">
    <style>
        .footer{
            padding:5px;
            height:72px;
            display: flex;
            color:white;
            background-color: #002147;
        }
        #content{
            margin: 10px;

        }
        #bgm-control{
            display: flex;
            position: relative;
            height:58px;
            width: 58px;
            border-radius: 50%;
            flex:10%;
        }
        #img1{
            position: relative;
            top:7px;
            left:7px;
        }
        #img2{
            position: relative;
            top:7px;
            left:7px;
        }
        .space{
            width: 72px;
        }
        #content{
            position: relative;
            top:11px;
            flex:60%;
        }
        .link{
            width: 48px;
            height:48px;
            position: relative;
            bottom: 13px;
            border-radius: 50%;
            flex:30%;
        }
        #link2-img{
            height:64px;
            width:64px;
            border-radius: 50%;
            position: relative;
            top:20px;
        }

    </style>
</head>
<body>
<audio id="bgm" src="resources/music/AsItWas.mp3" controls="controls" loop></audio>

<div class="footer">
    <div id="bgm-control">
        <img id="img1" src="resources/imgs/bgm.png" alt="">
        <img id='img2' src="resources/imgs/rejectbgm.png" alt="">
    </div>
    <div class="space">
    </div>
    <div class="space"></div>
    <div id="content">
        <div style="text-align: center">&copy;NEFU</div>
        <div style="text-align: center">Software Engineering</div>
    </div>
    <div class="space"></div>
    <div class="link">
        <a id="link1" href=""> <img id="link1-img " src="resources/imgs/github.png" alt=""></a>
    </div>
    <div class="space"></div>

    <div class="link">
        <a id="link2" href="https://www.nefu.edu.cn/"> <img id="link2-img" src="resources/imgs/NEFU.png" alt=""></a>
    </div>
</div>

<script type="module">
    let func=function()
    {
        $("#img2").css('display','none');
        $('#img1').click(function()
        {
            $('#img1').css('display','none');
            $('#img2').css('display','');
            $("#bgm")[0].play();
        })
        $('#img2').click(function()
        {
            $('#img1').css('display','');
            $('#img2').css('display','none');
            $("#bgm")[0].pause();
        })
        $('#bgm-control').mouseenter(function (){
            $(this).css('cursor','pointer');
        })

    }
    func();
</script>

<%
    String uri=request.getRequestURI();
    request.setAttribute("uri",uri);
%>

<c:if test="${uri.contains('home.jsp')}">
    <script>
        $('#btn1').css('background-color','#d15a39');
    </script>
</c:if>
<c:if test="${uri.contains('Introduction')}">
    <script>
        $('#btn2').css('background-color','#d15a39');
    </script>
</c:if>
<c:if test="${uri.contains('lab')}">
    <script>
        $('#btn3').css('background-color','#d15a39');
    </script>
</c:if>
<c:if test="${uri.contains('Professor')||uri.contains('Tutor')}">
    <script>
        $('#btn4').css('background-color','#d15a39');
    </script>
</c:if>
<c:if test="${uri.contains('xnsxh')}">
    <script>
        $('#btn5').css('background-color','#d15a39');
    </script>
</c:if>
<c:if test="${stype=='news'}">
    <script>
        $('#btn6').css('background-color','#d15a39');
    </script>
</c:if>
<c:if test="${stype=='notice'}">
    <script>
        $('#btn7').css('background-color','#d15a39');
    </script>
</c:if>

</body>
</html>
