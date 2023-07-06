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
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url var="b" value="/"></c:url>
<base href="${b}">
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
<a href="xnsxh">link</a>
<%
    try (Connection conn = DataBaseUtils.getConnection(); Statement stmt = conn.createStatement())
    {
        ResultSet rs= stmt.executeQuery("select * from xnsxh");

        while(rs.next())
        {
        String date=rs.getString("date"),time=rs.getString("time"),head=rs.getString("head");
        String content=rs.getString("content");
        response.setContentType("text/html");
        PrintWriter Pout= response.getWriter();
        Pout.write("<div>"+date+"</div>");
        Pout.write("<div>"+time+"</div>");
        Pout.write("<div>"+head+"</div>");
        Pout.write("<div>"+content+"</div>");



%>

<%

        }

    }catch (Exception e){
        e.printStackTrace();
    }

%>
</body>
</html>
