<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.*"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang=ja>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<title>入室</title>
<link rel="stylesheet" type="text/css"
	href="./css/RoomRiyou/default.css">
<link rel="stylesheet" type="text/css" href="./css/RoomRiyou/header.css">
<link rel="stylesheet" type="text/css" href="./css/RoomRiyou/in.css">

<%
Member m = (Member) session.getAttribute("member");
@SuppressWarnings("unchecked")
ArrayList<Goods> order = (ArrayList<Goods>) session.getAttribute("orderlist");
@SuppressWarnings("unchecked")
ArrayList<Integer> quantity = (ArrayList<Integer>) session.getAttribute("quantity");
%>
<%
ArrayList<String> menu = (ArrayList<String>)session.getAttribute("menu");
String classStr = "null";
if((String)session.getAttribute("class") != null){
	classStr = (String)session.getAttribute("class");
}
String ato = (String)session.getAttribute("ato");
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
	<form method="post" name="form" action="">
		<div class="idnum">
			ようこそ、 <a href="uc05_02.jsp"><%=m.getM_sei() + m.getM_mei()%></a> さん
			<button type="button" class="back" onclick="OnButtonClick()">ログアウト</button>
		</div>
		<h2>入室時注文確認</h2>
		<p>お間違いないかご確認ください。</p>
		<table class="order">
			<%
			int i = 0;
			if(ato!=null){%>
				<tr>
					<td>あとで注文</td>
					<td><%=ato%>点</td>
				</tr>
			<%}%>
			<%for (Goods g : order) {%>
				<tr>
					<td><%=g.getG_name()%></td>
					<td><%=quantity.get(i)%>点</td>
				</tr>
			<%i++;}%>

		</table>
			<script>
			function JumpJava08() {
				document.form.action = "Uc10_08";
				document.form.submit();
			}
			</script>
		<div class="click">
			<button type="button" class="back" onclick="location.href='uc10_06.jsp'">戻る</button>
			<button type="button" class="go" onclick="JumpJava08()">注文</button>
		</div>
	</form>
	</main>
	<script src="./js/top.js" charset="UTF-8"></script>
	<script src="./js/uc12jump.js" charset="UTF-8"></script>
</body>

</html>