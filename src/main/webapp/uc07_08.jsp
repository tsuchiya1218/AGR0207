<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang=ja>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<title>予約</title>
<link rel="stylesheet" type="text/css"
	href="./css/RoomRiyou/default.css">
<link rel="stylesheet" type="text/css" href="./css/RoomRiyou/header.css">
<link rel="stylesheet" type="text/css"
	href="./css/RoomRiyou/register.css">
<%@ page import="model.Member"%>
<%
Member m = (Member) session.getAttribute("member");
@SuppressWarnings("unchecked")
ArrayList<String> ary = (ArrayList<String>) session.getAttribute("utilizationAll");
%>
<%
ArrayList<String> menu = (ArrayList<String>)session.getAttribute("menu");
String classStr = "null";
if((String)session.getAttribute("class") != null){
	classStr = (String)session.getAttribute("class");
}
%>
</head>

<body>
	<header>
		<div class="h1">
			<h1>
				<a href="uc02_03.jsp">カラオケわっしょい</a>
			</h1>
		</div>
		<div>
			<input type="checkbox" id="menu-btn-check"> <label
				for="menu-btn-check" class="menu-btn"><span></span></label>
			<div class="menu-content">
				<ul>
					<li><a href="uc07_02.jsp">予約</a></li>
					<li><a href="uc08_02.jsp">予約確認</a></li>
					<li
						class="<%if (classStr.equals("cannot") || menu.get(1).equals("入室中")) {%>li_cannot<%}%>">
						<a
						href="<%if (classStr.equals("cannot") || menu.get(1).equals("入室中")) {%>#<%}else{%>javascript:JumpJava1002()<%}%>">入室QRコード</a>
					</li>
					<li class="<%if(!menu.get(1).equals("入室中")){%>li_cannot<%}%>">
						<a href="<%if(menu.get(1).equals("入室中")){%>uc12_02.jsp<%}else{%>#<%}%>">メニュー</a>
					</li>
					<li class="<%if(!menu.get(1).equals("入室中")){%>li_cannot<%}%>">
						<a href="<%if(menu.get(1).equals("入室中")){%>uc13_02.jsp<%}else{%>#<%}%>">注文履歴</a>
					</li>
					<li class="<%if(!menu.get(1).equals("入室中")){%>li_cannot<%}%>">
						<a href="<%if(menu.get(1).equals("入室中")){%>javascript:JumpJava1102()<%}else{%>#<%}%>">退室する</a>
					</li>
				</ul>
			</div>
		</div>
	</header>
	<main>
		<div class="idnum">
			ようこそ、 <a href="uc05_02.jsp"><%=m.getM_sei() + m.getM_mei()%></a> さん
			<button type="button" class="back" onclick="OnButtonClick()">ログアウト</button>
		</div>
		<h2>予約確認</h2>
		<p>予約内容について、お間違いないかご確認ください。</p>
		<p>※予約時にルーム代金の一部を頂いております。 予約確定後のキャンセルに伴うご返金は出来かねますのでご了承ください。</p>
		<form method="post" name="form" action="">
			<table class="table2">
				<tr>
					<th>入室日時</th>
					<td><%=ary.get(0)%></td>
				</tr>
				<tr>
					<th>店舗</th>
					<td><%=ary.get(1)%></td>
				</tr>
				<tr>
					<th>人数</th>
					<td><%=ary.get(2)%></td>
				</tr>
				<tr>
					<th>時間</th>
					<td><%=ary.get(3)%>分</td>
				</tr>
				<tr>
					<th>ルーム番号</th>
					<td><%=ary.get(4)%></td>
				</tr>
				<tr>
					<th>機種</th>
					<td><%=ary.get(5)%></td>
				</tr>
				<tr>
					<th>ルーム代金</th>
					<td><%=ary.get(6)%>円</td>
				</tr>
				<tr>
					<th>予約時決済金額</th>
					<td><span><%=ary.get(7)%>円</span></td>
				</tr>
			</table>
		</form>
		<div class="click">
			<button type="button" class="back" onclick="location.href='uc07_06.jsp'">戻る</button>
			<button type="button" class="go" onclick="location.href='uc07_10.jsp'">決済に進む</button>
		</div>
	</main>
	<script src="./js/top.js" charset="UTF-8"></script>
</body>

</html>