<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 李田
  Date: 2023/7/4
  Time: 6:49
  To change this template use File | Settings | File Templates.
--%>

<c:url var="b" value="/"></c:url>
<base href="${b}">


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Login</title>
    <style>
        *{
            padding: 0;
            margin: 0;
            text-decoration: none;
        }
        body{
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url('resources/imgs/northern-lights-3273425_1280.jpg');
            background-size: cover;
        }
        .login{
            width: 550px;
            height: 400px;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(
                    to right bottom,
                    rgba(255,255,255,.7),
                    rgba(255,255,255,.5),
                    rgba(255,255,255,.4)
            );
            /* 使背景模糊化 */
            backdrop-filter: blur(10px);
            box-shadow: 0 0 20px #a29bfe;
            border-radius: 15px;
        }

        .table{
            font: 900 40px '';
            text-align: center;
            letter-spacing: 5px;
            color: #3d3d3d;
        }

        .box{
            overflow: hidden;
            display: flex;
            flex-direction: column;
        }

        .box input{
            width: 400px;
            height: 100%;
            margin-bottom: 20px;
            outline: none;
            border: 0;
            padding: 10px;
            background-color: transparent;
            border-bottom: 3px solid rgb(150, 150, 240);
            font: 900 16px '';
            border-radius: 3px;
        }

        button{
            text-align: center;
            display: block;
            height: 51px;
            padding: 12px;
            font: 900 20px '';
            border-radius: 10px;
            margin-top: 20px;
            color: #fff;
            letter-spacing: 3px;
            background-image: linear-gradient(to left,
            #fd79a8,#a29bf6);
        }

    </style>
</head>
<body>

    <div class="login">

        <form action="login" method="post" class="box">
            <p class="table">Login</p>
            <br>
            <input id="account" type="text" placeholder="账号" name="account">
            <input id="password" type="password" placeholder="密码" name="password">
            <br>
            <button type="submit">GO</button>
        </form>
    </div>
    <c:if test="${msg!=null}">
        <script type="module">
            let func=function (){
                alert("用户名/密码错误！")
            }
            func();
        </script>


    </c:if>

</body>
</html>