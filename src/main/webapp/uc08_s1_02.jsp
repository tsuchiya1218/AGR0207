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
<title>予約変更</title>
<link rel="stylesheet" type="text/css"
	href="./css/RoomRiyou/default.css">
<link rel="stylesheet" type="text/css" href="./css/RoomRiyou/header.css">
<link rel="stylesheet" type="text/css" href="./css/RoomRiyou/apo.css">
<%
Member m = (Member) session.getAttribute("member");
@SuppressWarnings("unchecked")
ArrayList<String> ary = (ArrayList<String>) session.getAttribute("ArrayList");
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
	<form method="post" name="form" action=""class="pulldownset">
		<div class="idnum">
			ようこそ、 <a href="uc05_02.jsp"><%=m.getM_sei() + m.getM_mei()%></a> さん
			<button type="button" class="back" onclick="OnButtonClick()">ログアウト</button>
		</div>
		<h2>人数・時間変更</h2>
		<p>変更する人数、時間を選択してください。</p>
			<div class="apo">
				<div>店舗</div>
				<div>
					<input type="text" value="<%=ary.get(0)%>" readonly>
				</div>
				<div>
					<input type="text" value="<%=ary.get(1)%>" readonly>
				</div>
			</div>
			<div class="apo">
				<div>利用人数</div>
				<select name="num" id="num">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
					<option>6</option>
					<option>7</option>
					<option>8</option>
					<option>9</option>
					<option>10</option>
					<option>11</option>
					<option>12</option>
				</select> 人
				<script>
					var num =<%=ary.get(2)%>;
					for (var i = 0; i < 12; i++) {
						if (num == document.getElementById('num').options[i].value) {
							document.getElementById('num').options[i].selected = true;
						}
					}
				</script>
			</div>
			<div class="apo">
				<div>利用時間</div>
				<select name="min" id="min">
					<option>30</option>
					<option>60</option>
					<option>90</option>
					<option>120</option>
					<option>150</option>
					<option>180</option>
					<option>210</option>
					<option>240</option>
					<option>270</option>
					<option>300</option>
				</select> 分
				<script>
					var min = <%=ary.get(3)%>;
					for (var i = 0; i < 12; i++) {
						if (min == document.getElementById('min').options[i].value) {
							document.getElementById('min').options[i].selected = true;
						}
					}
				</script>
			</div>
		<div class="click">
			<button type="button" class="back" onclick="location.href='uc08_02.jsp'">戻る</button>
			<button type="button" class="go" onclick="JumpJava04()">次へ</button>
		</div>
	</form>
	</main>
	<script src="./js/top.js" charset="UTF-8"></script>
	<script src="./js/uc08jump.js" charset="UTF-8"></script>
</body>

</html>