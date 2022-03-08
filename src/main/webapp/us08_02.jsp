<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang=ja>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>カラオケわっしょい</title>
    <link rel="stylesheet" type="text/css" href="./css/RoomKanri/default2.css">
    <link rel="stylesheet" type="text/css" href="./css/RoomKanri/header2.css">
    <link rel="stylesheet" type="text/css" href="./css/RoomKanri/login2.css">
</head>
<%String error = (String)session.getAttribute("error");%>
<body>
    <header>
        <div class="header-inner">
            <div class="h1">
                <h1>ルーム管理システム</h1>
            </div>
        </div>
    </header>
    <main>
        <h2>管理者ログイン</h2>
        <form action="" method="post" name="form">
            <div class="login">
            	<%if(error!=null){%><p style="color:red"><%=error%></p><%}%>
                <p>従業員ＩＤ：<input type="text" name="id" required></p>
                <p>パスワード：<input type="password" name="pass" required></p>
            </div>
            <div class="button">
                <button type="button" onclick="JumpJava()">ログイン</button>
            </div>
        </form>
    </main>
    <script>
    	function JumpJava(){
    		txt = document.form.id.value;
    		if( txt != "" ){
        		document.form.action = "Us08_02";
        		document.form.submit();
    		}else{
    			alert("従業員IDを入力してください。");
    		}
    	}
    </script>
    <footer>
    </footer>
</body>

</html>