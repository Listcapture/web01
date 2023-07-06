<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url var="b" value="/"></c:url>
<base href="${b}">
<%
    HttpSession session2= request.getSession();
  String message=(String) session2.getAttribute("message");
  request.setAttribute("message",message);
%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="resources/CSS/userInfo.css">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <title>Document</title>
    <style>
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .modal-content {
            background-color:linen;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 400px;
            height:400px;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        .modal-item
        {
            display: flex;
            align-items: center;
            justify-content: center;
            margin:10px;
        }
        .modal-item-desc
        {
            flex: 30%;
            display: flex;
            align-items: center;
            justify-content: center;

        }
        .modal-item-input {
            flex: 70%;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .flex-center{
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .btncss1{
            width:50px;
            height:30px;
            padding:5px;
            border-radius: 5px;
            color:lightcoral;
        }
    </style>
</head>
<body>
<div class="manager">
    <div class="sidebar">
        <div class="photo">
            <img src="resources/imgs/managehead.png" alt="">
        </div>
        <div class="item sidebar-desp item-1"  onclick="func(this)">个人信息管理</div>
        <div class="item sidebar-desp item-2" onclick="func(this)">就业信息管理</div>
        <div class="item sidebar-desp item-3"  onclick="func(this)">新闻管理</div>
        <div class="item sidebar-desp item-4" onclick="func(this)">公告管理</div>
        <div class="item" style="color:navajowhite" onclick="func_show(this)">返回上一级</div>
        <a href="index" class="item" style="color:navajowhite"><div  >返回门户网站</div></a>

    </div>
    <div class="container">

        <!-- 管理个人信息-->

        <div class="m-item" >
            <div class="m-person-head">
                <span >我的信息</span>
            </div>

            <hr>
            <div class="user-info">
                <div class="user-info-item">
                    <div class="user-info-item-name">用户名</div>
                    <div class="user-info-item-desc">${user.clientName}</div>
                </div>
                <div class="user-info-item">
                    <div class="user-info-item-name">密码</div>
                    <div class="user-info-item-desc">${user.password}</div>
                </div>
            </div>
            <div class="m-person-content">
                <div class="m-item-item">
                    <button onclick="openAddUserModal()">添加新用户</button>
                </div>
                <div class="m-item-item">
                    <button onclick="openDeleteUserModal()">删除用户</button>
                </div>
                <div class="m-item-item">
                    <button onclick="openModifyUserModal()" >修改用户名/密码</button>
                </div>
                <div class="m-item-item" >
                    <button onclick="openFindUserModal()" >查找用户</button>
                </div>
                <div class="m-item-item">
                    <div class="m-item-item">
                        <button >
                            注意:只要能够登入该网页,就成为了管理员!
                        </button>
                    </div>
                </div>

            </div>

        </div>
        <!-- 管理就业信息-->
    </div>

</div>

<div id="addUser" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeAddUserModal()">&times;</span>
        <br>
        <h2>添加用户</h2>
        <br>
        <form action="addUser" method="post">
            <div class="modal-item">
                <div class="modal-item-desc">用户名:</div>
                <div class="modal-item-input"><input type="text" name="clientName"></div>
            </div>
            <br>
            <div class="modal-item">
                <div class="modal-item-desc">密码:</div>
                <div class="modal-item-input"><input type="text" name="password"></div>
            </div>
            <br>
            <div class="flex-center">
                <button type="submit" class="btncss1">提交</button>
            </div>

        </form>
    </div>
</div>

<div id="deleteUser" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeDeleteUserModal()">&times;</span>
        <br>
        <h2>删除用户</h2>
        <br>
        <form action="deleteUser" method="post">
            <div class="modal-item">
                <div class="modal-item-desc">输入删除ID值:</div>
                <div class="modal-item-input"><input type="text" name="id"></div>
            </div>
            <br>
            <div class="flex-center">
                <button type="submit" class="btncss1">提交</button>
            </div>

        </form>
    </div>
</div>

<div id="modifyUser" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModifyUserModal()">&times;</span>
        <br>
        <h2>更新用户信息</h2>
        <br>
        <form action="modifyUser" method="post">
            <div class="modal-item">
                <div class="modal-item-desc">修改前用户名:</div>
                <div class="modal-item-input"><input type="text" name="FclientName"></div>
            </div>
            <br>
            <div class="modal-item">
                <div class="modal-item-desc">修改前密码:</div>
                <div class="modal-item-input"><input type="text" name="Fpassword"></div>
            </div>
            <br>
            <div class="modal-item">
                <div class="modal-item-desc">修改后用户名:</div>
                <div class="modal-item-input"><input type="text" name="LclientName"></div>
            </div>
            <br>
            <div class="modal-item">
                <div class="modal-item-desc">修改后密码:</div>
                <div class="modal-item-input"><input type="text" name="Lpassword"></div>
            </div>
            <div class="flex-center">
                <button type="submit" class="btncss1">提交</button>
            </div>

        </form>
    </div>
</div>
<div id="findUser" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeFindUserModal()">&times;</span>
        <br>
        <h2>查找用户</h2>
        <br>
        <form action="findUser" method="post">
            <div class="modal-item">
                <div class="modal-item-desc">修改前用户名:</div>
                <div class="modal-item-input"><input type="text" name="FclientName"></div>
            </div>
            <br>
            <div class="modal-item">
                <div class="modal-item-desc">tips:输入用户名,返回用户唯一ID</div>
            </div>
            <br>
            <div class="flex-center">
                <button type="submit" class="btncss1">提交</button>
            </div>

        </form>
    </div>
</div>
<c:if test="${message!=null}">
    <script>
        alert(${message});
    </script>
</c:if>
<c:if test="${message==null}">
    <script>
        alert("null");
    </script>
</c:if>





<script>
    function openAddUserModal() {
        let modal=$('#addUser');
        modal.show();
    }
    function closeAddUserModal() {
        let modal=$('#addUser');
        modal.hide();
    }
    function openDeleteUserModal() {
        let modal=$('#deleteUser');
        modal.show();
    }
    function closeDeleteUserModal() {
        let modal=$('#deleteUser');
        modal.hide();
    }
    function openModifyUserModal(){
        $('#modifyUser').show();
    }
    function closeModifyUserModal(){
        $('#modifyUser').hide();
    }
    function openFindUserModal(){
        $('#findUser').show();
    }
    function closeFindUserModal(){
        $('#findUser').hide();
    }
    let func =function (e){
        let siblings=e.parentNode.children;
        for(let i=1;i<siblings.length-2;i++)
        {
            if(siblings[i]==e) {
                $(siblings[i]).css("background-color"," linear-gradient(2000deg,#517fa4,#243949)")
            } else {
                $(siblings[i]).hide();
            }
        }



    }
    let func_show=function(e)
    {
        let siblings=e.parentNode.children;
        for(let i=1;i<siblings.length-2;i++)
        {
            $(siblings[i]).show();
        }

    }
</script>

</body>
</html>