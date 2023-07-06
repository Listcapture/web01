<%@ page import="java.sql.Connection" %>
<%@ page import="Webkit.DataBaseUtils" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.io.Writer" %>
<%@ page import="java.io.PrintWriter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 李田
  Date: 2023/7/4
  Time: 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page  language="java" pageEncoding="UTF-8" %>
<c:url var="b" value="/"></c:url>
<base href="${b}">
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0" >
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <title>星空特效</title>
    <style>
        body{
            margin: 0;
            padding: 0;
        }
        .space{
            overflow: hidden;
            background-color: #000;

        }
        h1{
            position: absolute;
            line-height: 50px;
            letter-spacing: 5px;
            color: #fff;
            width: 300px;
            top: 40%;
            left: 50%;
            margin-left: -200px;
            font-size: 30px;
        }

    </style>
</head>
<body class="space">
<audio id="bgm" src="resources/music/最终幻想.mp3" autoplay="autoplay"  hidden="until-found" ></audio>
<h1>

</h1>
<div class="space">
    <canvas></canvas>
</div>

<script>
    var canvas=document.querySelector("canvas");
    ctx=canvas.getContext("2d");
    w=canvas.width=window.innerWidth;
    h=canvas.height=window.innerHeight;
    var canvas2=document.createElement("canvas");
    ctx2=canvas2.getContext("2d");
    canvas2.width=100;
    canvas2.height=100;
    var a=canvas2.width/2;
    var grandient=ctx.createRadialGradient(a,a,0,a,a,a);
    grandient.addColorStop(0.025,'#fff');
    grandient.addColorStop(0.1, 'hsl(220,59%,18%)');
    grandient.addColorStop(0.025, 'hsl(220,60%,33%)');
    grandient.addColorStop(1,"transparent");
    ctx2.fillStyle=grandient;
    ctx2.beginPath();
    ctx2.arc(a,a,a,0,Math.PI*2);
    ctx2.fill();
    ctx2.closePath();
    var stars=[];
    var count=0;
    function Star(){
        this.pos=Math.floor(Math.random()* w/2-100);
        this.r=Math.floor(Math.random()*100);
        this.dx=w/2;
        this.dy=h/2;
        this.rand=Math.floor(Math.random()*360);
        this.speed=this.pos/100000;
        stars[count]=this;
        count ++;
    }
    Star.prototype.draw=function(){
        var x=Math.sin(this.rand+1)* this.pos+this.dx;
        y=Math.cos(this.rand)*this.pos/2+this.dy;
        ctx.drawImage(canvas2,x-this.r/2,y-this.r/2,this.r,this.r);
        this.rand=this.rand+this.speed;
    }
    for(var i=0;i<1000;i++){
        new Star();
    }
    function anmit(){
        ctx.clearRect(0,0,w,h);
        for(var i=0;i<stars.length;i++){
            stars[i].draw();
        }
        requestAnimationFrame(anmit);
    }
    anmit();
    var oH=document.getElementsByTagName("h1")[0];
    var arr=["学参天地,"+
        "德和自然"],
        index=0,
        arrLen=arr.length,
        strLen=arr[0].length;
    pos=0,
        row=0,
        str="",
        timer=null;
    function print() {
        while(row<index){
            str=str+arr[row]+"<br>";
            row++;
        }
        oH.innerHTML=str+arr[index].substring(0,pos);
        if(pos==strLen){
            index++;
            pos =0;
            if(index<arr.length){
                strLen=arr[index].length;
                timer=setTimeout(print,250);
            }
        }else{
            pos++;
            timer=setTimeout(print,250);
        }
    }
    setTimeout(print,250);



</script>


</body>
</html>
