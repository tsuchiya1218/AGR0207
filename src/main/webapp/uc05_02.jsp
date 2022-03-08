<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.*"%>
<%@ page import="dao.*"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang=ja>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<title>会員情報確認</title>
<link rel="stylesheet" type="text/css"
	href="./css/RoomRiyou/default.css">
<link rel="stylesheet" type="text/css" href="./css/RoomRiyou/header.css">
<link rel="stylesheet" type="text/css"
	href="./css/RoomRiyou/register.css">
<%Member m = (Member) session.getAttribute("member");%>

<%
ArrayList<String> menu = (ArrayList<String>)session.getAttribute("menu");
String classStr = "null";
if((String)session.getAttribute("class") != null){
	classStr = (String)session.getAttribute("class");
}
%>
<%
MemberDao mDao = new MemberDao();
m = mDao.findMember(m.getM_id());
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
	<form method="post" name="form">
			<div class="idnum">
			ようこそ、 <a href="uc05_02.jsp"><%=m.getM_sei() + m.getM_mei()%></a> さん
			<button type="button" class="back" onclick="OnButtonClick()">ログアウト</button>
		</div>
		<h2>会員情報</h2>
		<table class="table1">
			<tr>
				<th>氏名</th>
				<td><%=m.getM_sei()%>&nbsp;<%=m.getM_mei()%></td>
			</tr>
			<tr>
				<th>生年月日</th>
				<td><%=m.getM_birthday()%></td>
			</tr>
			<tr>
				<th>郵便番号</th>
				<td>
					<%
					String post = m.getM_postcode();
					String post1 = post.substring(0, 3);
					String post2 = post.substring(3, 7);
					%> <%=post1%>&nbsp;－&nbsp;<%=post2%>
				</td>
			</tr>
			<tr>
				<th>住所</th>
				<td><%=m.getM_address()%></td>
			</tr>
			<tr>
				<th>メールアドレス</th>
				<td><%=m.getM_mail()%></td>
			</tr>
			<tr>
				<th>電話番号</th>
				<td>
					<%=m.getM_phone1() %>&nbsp;－&nbsp;<%=m.getM_phone2() %>&nbsp;－&nbsp;<%=m.getM_phone3() %>
				</td>
			</tr>
			<tr>
				<th>パスワード</th>
				<td>
					<%String pass = m.getM_pass();
					for(int i = 0 ; i < pass.length() ; i++ ){%>
					*
					<%}%>
				</td>
			</tr>
			<%if( m.getM_cardNum() != null && m.getM_cardNum()!=""){%>
			<tr>
				<!-- 登録している支払情報を表示する -->
				<th>クレジットカード</th>
				<td>
					<%String card = m.getM_cardNum();
					String cardEnd = card.substring(12,16);
					int pay = m.getM_pay();
					if( pay == 1 ){
						for(int i = 0 ; i < card.length()-4 ; i++ ){%>
							*
						<%}%>
						<%=cardEnd %>
					<%} %>
				</td>
			</tr>
			<%}%>
		</table>
		<div class="click">
			<button type="button" class="go"
				onclick="location.href='uc05_04.jsp'">編集</button>
		</div>
		<div class="click">
			<button type="button" class="go"
				onclick="location.href='uc06_04.jsp'">退会</button>
		</div>
	</form>
	</main>
	<script src="./js/top.js" charset="UTF-8"></script>
</body>

</html>