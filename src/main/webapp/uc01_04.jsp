<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang=ja>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<title>新規会員登録</title>
	<link rel="stylesheet" type="text/css" href="./css/RoomRiyou/default.css">
	<link rel="stylesheet" type="text/css" href="./css/RoomRiyou/header.css">
	<script src="./js/uc01mail.js" charset="UTF-8"></script>
<%String mail = (String)session.getAttribute("mail");%>
</head>

<body>
	<header>
		<div class="h1">
			<h1>カラオケわっしょい</h1>
		</div>
	</header>
	<main>
		<h2>認証メール送信</h2>
		<p>認証メールを送信しました。</p>
		<a href="Touroku?mail='"+<%=mail%>+"'">リンク</a>
		<p>メール内のリンクから会員登録をしてください。</p>
		<div class="click">
			<button class="go" onclick="JumpJavaMail()">認証メールを再送信</button>
		</div>
	</main>
</body>

</html>