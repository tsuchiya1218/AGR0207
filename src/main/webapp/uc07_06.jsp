<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dao.ModelDao" %>
<%@ page import="model.Member"%>
<%@ page import="model.Room" %>
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
<link rel="stylesheet" type="text/css" href="./css/RoomRiyou/apo.css">
<%
Member m = (Member) session.getAttribute("member");
@SuppressWarnings("unchecked")
ArrayList<String> ary1 = (ArrayList<String>) session.getAttribute("ArrayList");
@SuppressWarnings("unchecked")
ArrayList<String> ary2 = (ArrayList<String>) session.getAttribute("utilization");
@SuppressWarnings("unchecked")
ArrayList<Room> rlist = (ArrayList<Room>) session.getAttribute("roomlist");
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
		<h2>ルーム一覧</h2>
		<p>ご利用されるルームを選択してください。</p>
		<form method="post" name="form" action="">
			<div class="apo">
				<p><%=ary1.get(0)%>
					<%=ary1.get(1)%>人
					<%=ary1.get(2)%>分 <%=ary2.get(0)%>月<%=ary2.get(1)%>日 <%=ary2.get(2)%>:<%=ary2.get(3)%>入室 <br>の検索結果
				</p>
				<table class="room">
					<tr>
						<th></th>
						<th>ルーム番号</th>
						<th>機種</th>
						<th>目安人数</th>
					</tr>
					<%
					ModelDao mDao = new ModelDao();
					String model_name;
					for( Room r : rlist ){
						model_name = mDao.findModelName(r.getModel_id());
					%>
						<tr>
						<td><input type="radio" name="room" id="<%=r.getR_id()%>" value="<%=r.getR_id()%>" ></td>
						<td><label for="<%=r.getR_id()%>"><%=r.getR_id()%></label></td>
						<td><label for="<%=r.getR_id()%>"><%=model_name%></label></td>
						<td>
							<label for="<%=r.getR_id()%>">
								<%if( r.getR_number() == 2 ){%>
									2～3人
								<%}else if( r.getR_number() == 4 ){%>
									4～6人
								<%}else if( r.getR_number() == 7 ){%>
									7人以上
								<%}%>
							</label>
						</td>
					</tr>
					<%}mDao.connectionClose();%>
				</table>
			</div>
			<div class="click">
				<button type="button" class="back" onclick="location.href='uc07_04.jsp'">戻る</button>
				<button type="button" class="go" onclick="JumpJava06()">次へ</button>
			</div>
		</form>
	</main>
	<script src="./js/top.js" charset="UTF-8"></script>
	<script src="./js/uc07jump.js" charset="UTF-8"></script>
</body>

</html>