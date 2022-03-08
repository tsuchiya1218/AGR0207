<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang=ja>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<title>新規会員登録</title>
<link rel="stylesheet" type="text/css"
	href="./css/RoomRiyou/default.css">
<link rel="stylesheet" type="text/css" href="./css/RoomRiyou/header.css">
<link rel="stylesheet" type="text/css"
	href="./css/RoomRiyou/register.css">
<script src="./js/uc01.js" charset="UTF-8"></script>
<%String error = (String)session.getAttribute("error");%>
</head>

<body>
	<header>
		<div class="h1">
			<h1>カラオケわっしょい</h1>
		</div>
	</header>
	<main>
		<form method="post" name="member" action="">
			<h2>新規会員登録</h2>
			<p>登録するメールアドレスを入力してください。</p>
			<p style="color:red"><%if(error != null){%><%=error%><%}%></p>
			<input type="email" name="mail" class="register" onChange="CheckMail()">
			<div class="click">
				<button type="button" class="go" onclick="Jump01_04()">認証メールを送信</button>
			</div>
			<div class="click">
				<button type="button" class="back"
					onclick="location.href='uc_index.jsp'">ログイン画面に戻る</button>
			</div>
		</form>
	</main>
</body>

</html>