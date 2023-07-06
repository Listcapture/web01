<%@ page import="Webkit.Entity.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url var="b" value="/"></c:url>
<base href="${b}">

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
        .gohide{
            display: none;
        }
        .work-modal-content {
            background-color:linen;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 800px;
            height:800px;
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


        <!--主页~-->
        <div id="manage-home" class="m-item " style="overflow: hidden" >
            <div class="m-person-head">
                <span style="color: white;overflow: hidden" >欢迎使用软件工程网站管理系统</span>
            </div>
            <hr>

            <div class="m-person-content" style="color: white">
           <%@include file="/starspace.jsp"%>
            </div>

        </div>
        <!-- 管理个人信息-->

        <div id="user" class="m-item gohide " >
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
                            使用更新(修改)操作,直接返回门户网站!(同时清空缓存)
                        </button>
                    </div>
                </div>

            </div>

        </div>'

        <!-- 管理就业信息-->
        <div id="work" class="m-item gohide" >
            <div class="m-person-head">
                <span >就业信息管理</span>
            </div>
            <hr>

            <div class="m-person-content">
                <div class="m-item-item">
                    <button onclick="openAddWorkModal()">发布就业信息</button>
                </div>
                <div class="m-item-item">
                    <button ><a href="xnsxh" style="color:white">查看就业信息</a></button>
                </div>
                <div class="m-item-item">
                    <div class="m-item-item">
                        <button >
                            tips:查看后跳转到门户网站相应栏目
                        </button>
                    </div>
                </div>

            </div>

        </div>
        <!-- 公告 管理-->
        <div id="news" class="m-item  gohide" >
            <div class="m-person-head">
                <span >新闻公告</span>
            </div>
            <hr>
            <div class="m-person-content">
                <div class="m-item-item">
                    <button onclick="openAddNewsModal()">发布新闻</button>
                </div>
                <div class="m-item-item">
                    <button ><a href="GenerateNewsx?types=news&option=sel1" style="color:white">查看新闻</a></button>
                </div>
                <div class="m-item-item">
                    <div class="m-item-item">
                        <button >
                            tips:查看后跳转到门户网站相应栏目
                        </button>
                    </div>
                </div>

            </div>

        </div>

        <!-- 新闻 管理-->
        <div id="notice" class="m-item gohide" >
            <div class="m-person-head">
                <span >公告管理 ? No 摸鱼? Yes</span>
            </div>
            <hr>
            <div class="m-person-content">
                <img style="width: 100%;height:100%" src="resources/imgs/摸鱼.jpg" alt="">
            </div>
        </div>
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
                <div class="modal-item-desc">要查找的用户名:</div>
                <div class="modal-item-input"><input type="text" name="clientName"></div>
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
<div id="addWork" class="modal">
    <div class="modal-content work-modal-content">
        <span class="close" onclick="closeAddWorkModal()">&times;</span>
        <br>
        <h2>添加就业信息</h2>
        <br>
        <form action="addWork" method="post">
            <div class="modal-item">
                <div class="modal-item-desc">输入招聘会日期mm-dd</div>
                <div class="modal-item-input"><input type="text" name="date"></div>
            </div>
            <br>
            <div class="modal-item">
                <div class="modal-item-desc">输入招聘会事件hh-mm</div>
                <div class="modal-item-input"><input type="text" name="time"></div>
            </div>
            <br>
            <div class="modal-item">
                <div class="modal-item-desc">起个标题</div>
                <div class="modal-item-input"><input type="text" name="head"></div>
            </div>
            <br>
            <div class="modal-item">
                <div class="modal-item-desc">输入详细内容</div>
                <div class="modal-item-input"><textarea placeholder="招聘企业描述:" name="content" cols="21" rows="30"></textarea></div>
            </div>
            <br>
            <div class="flex-center">
                <button type="submit" class="btncss1">提交</button>
            </div>
        </form>
    </div>
</div>
<div id="addNews" class="modal">
    <div class="modal-content work-modal-content">
        <span class="close" onclick="closeAddNewsModal()">&times;</span>
        <br>
        <h2>添加新闻</h2>
        <br>
        <form action="addNews" method="post">
            <div class="modal-item">
                <div class="modal-item-desc">输入新闻日期yyyy-mm-dd</div>
                <div class="modal-item-input"><input type="text" name="date"></div>
            </div>
            <br>
            <div class="modal-item">
                <div class="modal-item-desc">输入新闻标题</div>
                <div class="modal-item-input"><input type="text" name="head"></div>
            </div>
            <br>
            <div class="modal-item">
                <div class="modal-item-desc">输入详细内容</div>
                <div class="modal-item-input"><textarea placeholder="新闻详情:" name="content" cols="21" rows="30"></textarea></div>
            </div>
            <br>
            <div class="flex-center">
                <button type="submit" class="btncss1">提交</button>
            </div>
        </form>
    </div>
</div>


<%
    String message=String.valueOf(session.getAttribute("message"));
%>
<c:if test="${message!=null}">
    <script>
        alert("${message}");
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
    function openAddWorkModal(){
        $("#addWork").show();
    }
    function closeAddWorkModal(){
        $('#addWork').hide();
    }
    function openAddNewsModal(){
        $('#addNews').show();
    }
    function closeAddNewsModal(){
        $('#addNews').hide();
    }
    let sons=$('.container').children(".m-item");
    let func =function (e){
        let siblings=e.parentNode.children;

        // sons 0 1 2 3
        // siblings 1 2 3 4
        for(let i=1;i<siblings.length-2;i++)
        {
            if(siblings[i]==e) {
                $(siblings[i]).css("background-color"," linear-gradient(2000deg,#517fa4,#243949)")
                $(sons[i]).show();
            } else {
                $(siblings[i]).hide();
                $(sons[i]).hide();
            }
        }
        $('#manage-home').hide();
    }
    let func_show=function(e)
    {
        let siblings=e.parentNode.children;
        for(let i=1;i<siblings.length-2;i++)
        {
            $(siblings[i]).show();
        }
        //同时把首页锁定
        $('#manage-home').show();
        for(let i=1;i<sons.length;i++)
        {
            $(sons[i]).hide();
        }

    }
</script>

</body>
</html>
