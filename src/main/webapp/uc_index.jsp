<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang=ja>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<title>ログイン</title>
	<link rel="stylesheet" type="text/css" href="./css/RoomRiyou/default.css">
	<link rel="stylesheet" type="text/css" href="./css/RoomRiyou/header.css">
	<link rel="stylesheet" type="text/css" href="./css/RoomRiyou/login.css">
	<%String state ="";%>
	<%
	if(request.getParameter("state") != null){
		state = "メールアドレスまたはパスワードが間違っています。";
	}
	%>
	<script src="./js/uc_index.js" charset="UTF-8"></script>	
</head>

<body>
	<header>
		<div class="h1">
			<h1>カラオケわっしょい</h1>
		</div>
	</header>
	<main>
		<h2>ログイン</h2>
		<div class="login">
			<form method="post" name="login" action="">
				<p>メールアドレス：　<input type="email" name="m_mail" placeholder="例：karaoke@wassyoi.jp"></p>
				<p>パスワード　　：　<input type="password" name="m_pass"></p>
				<p style="color:red"><%=state%></p>
				<div class="click">
					<input type="button"class="go" value="ログイン"onclick="OnButtonLogin()">
				</div>
			</form>
			<a href="uc04_02.jsp">パスワードをお忘れの方はこちら</a>
		</div>
		<h2>初めての方</h2>
		<p>
			はじめてご利用されるお客様は、下記より会員登録をおこなってください。
			登録は無料です。
		</p>
		<div class="click">
			<button type="button" class="go" onclick="location.href='uc01_02.jsp'">新規会員登録</button>
		</div>
	</main>
</body>

</html>