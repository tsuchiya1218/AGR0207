<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang=ja>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<title>新規会員登録</title>
<link rel="stylesheet" type="text/css" href="./css/RoomRiyou/default.css">
<link rel="stylesheet" type="text/css" href="./css/RoomRiyou/header.css">
<link rel="stylesheet" type="text/css" href="./css/RoomRiyou/register.css">
<script src="./js/uc01.js" charset="UTF-8"></script>
<%
@SuppressWarnings("unchecked")
ArrayList<String> ary = (ArrayList<String>)session.getAttribute("arraylist");
request.getSession().setAttribute("arraylist",ary);
%>
</head>

<body>
	<header>
		<div class="h1">
			<h1>カラオケわっしょい</h1>
		</div>
	</header>
	<main>
		<h2>登録内容確認</h2>
		<div class="item1">
			<p>お間違えがなければ、画面下部の登録ボタンを押してください。</p>
			<form method="post" name="member" action="">
				<table class="table1">
					<tr>
						<th>氏名</th>
						<td><%=ary.get(0)%>&nbsp;<%=ary.get(1)%></td>
					</tr>
					<tr>
						<th>生年月日</th>
						<td><%=ary.get(2)%>年<%=ary.get(3)%>月<%=ary.get(4)%>日</td>
					</tr>
					<tr>
						<th>郵便番号</th>
						<td><%=ary.get(5)%>&nbsp;－&nbsp;<%=ary.get(6)%></td>
					</tr>
					<tr>
						<th>住所</th>
						<td><%=ary.get(7)%></td>
					</tr>
					<tr>
						<th>メールアドレス</th>
						<td><%=ary.get(8)%></td>
					</tr>
					<tr>
						<th>電話番号</th>
						<td><%=ary.get(9)%>&nbsp;－&nbsp;<%=ary.get(10)%>&nbsp;－&nbsp;<%=ary.get(11)%></td>
					</tr>
					<tr>
						<th>パスワード</th>
						<td><%=ary.get(12)%></td>

					</tr>
				</table>
				<div class="click">
					<button type="button" class="back"
						onclick="location.href='uc01_06.jsp'">修正する</button>
					<button type="button" class="go"
						onclick="JumpJava08()">登録</button>
				</div>
			</form>
		</div>
	</main>
</body>

</html>