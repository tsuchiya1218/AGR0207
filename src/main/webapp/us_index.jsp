<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Worker,java.util.ArrayList" %>

<!DOCTYPE html>
<html lang=ja>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>カラオケわっしょい</title>
    <link rel="stylesheet" type="text/css" href="./css/RoomKanri/default.css">
    <link rel="stylesheet" type="text/css" href="./css/RoomKanri/header.css">
    <link rel="stylesheet" type="text/css" href="./css/RoomKanri/login.css">
</head>
<%
String error = (String)session.getAttribute("error");
@SuppressWarnings("unchecked")
ArrayList<Worker> w = (ArrayList<Worker>)session.getAttribute("Workerlist");
%>

<body>
    <header>
        <div class="h1-2">
            <h1>ルーム管理システム</h1>
        </div>
        <div class="header-inner">
            <div class="h1">
                <h1>ルーム管理システム</h1>
            </div>
        </div>
    </header>
    <main>
        <h2>従業員ログイン</h2>
        <form method="post" name="form">
            <div class="login">
            <p style="color:red"><%if(error != null){%><%=error%><%}%></p>
                <p>店舗ＩＤ　：<input type="text" name="id" required></p>
                <p>パスワード：<input type="password" name="pass" required></p>
            </div>
            <div class="button">
                <button type="button" onclick="JumpJavaIndex()">ログイン</button>
            </div>
        </form>   
    </main>
            <script>
            function JumpJavaIndex(){
        		document.form.action = "Us_index";
        		document.form.submit();
            }
            </script>
</body>

</html>