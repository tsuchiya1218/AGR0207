<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Member"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang=ja>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<title>会員情報編集</title>
<link rel="stylesheet" type="text/css"
	href="./css/RoomRiyou/default.css">
<link rel="stylesheet" type="text/css" href="./css/RoomRiyou/header.css">
<link rel="stylesheet" type="text/css"
	href="./css/RoomRiyou/register.css">
<%
Member m = (Member) session.getAttribute("member");
//session.setAttribute("member",m);
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
		<h2>会員情報編集</h2>
		<p>編集したい個所のみ入力し、更新ボタンを押してください。</p>
		<p>※入力しなかった箇所は変更されません。</p>
		<form method="post" action="" name="form">
			<table class="table1">
				<tr>
					<th rowspan="2">郵便番号</th>
					<td>
						<%
						String post = m.getM_postcode();
						String post1 = post.substring(0, 3);
						String post2 = post.substring(3, 7);
						%> 変更前：<%=post1%>&nbsp;－&nbsp;<%=post2%>
					</td>
				</tr>
				<tr>
					<td><input type="text" id="m_postcode1" name="m_postcode1" onChange="checkPost1()">
						&nbsp;－&nbsp;<input type="text" id="m_postcode2" name="m_postcode2" onChange="checkPost2()"> <br>※半角数字でご記入ください。
						<br>（例）169-0000</td>
				</tr>
				<tr>
					<th rowspan="2">住所</th>
					<td>変更前：<%=m.getM_address()%>
					</td>
				</tr>
				<tr>
					<td><input type="text" name="m_address"></td>
				</tr>
				<tr>
					<th rowspan="2">メールアドレス</th>
					<td>変更前：<%=m.getM_mail()%>
					</td>
				</tr>
				<tr>
					<td><input type="email" id="m_mail" name="m_mail"onChange="checkMail()"> <br>※半角英数字でご記入ください。
						<br>（例）karaoke@wassyoi.jp</td>
				</tr>
				<tr>
					<th rowspan="2">電話番号</th>
					<td>
						変更前：<%=m.getM_phone1()%>&nbsp;－&nbsp;<%=m.getM_phone2()%>&nbsp;－&nbsp;<%=m.getM_phone3()%>
					</td>
				</tr>
				<tr>
					<td>
					<input type="tel" id="m_phone1" name="m_phone1" onChange="checkPhone1()"> &nbsp;－&nbsp;
					<input type="tel" id="m_phone2" name="m_phone2" onChange="checkPhone2()"> &nbsp;－&nbsp;
					<input type="tel" id="m_phone3" name="m_phone3" onChange="checkPhone3()"> 
					<br>※半角数字でご記入ください。<br>（例）03-0000-0000
					</td>
				</tr>
				<tr>
					<th>パスワード</th>
					<td><input type="password" id="m_pass1" name="m_pass1" onChange="checkPass1()"> <br>※アルファベットの大文字・小文字を必ず１文字以上使用し、
						かつ数字を組み合わせて８文字以上１２文字以内でご記入ください。</td>

				</tr>
				<tr>
					<th>パスワード(確認用)</th>
					<td><input type="password" id="m_pass2" name="m_pass2" onChange="checkPass2()"> <br>※確認のため、もう一度入力してください。
					</td>
				</tr>
				<%if(m.getM_cardNum() != null){%>
				<tr>
					<th rowspan="5">カード情報
						<div class="click">
							<button type="button" class="back2" onclick="OnButtonClick()">削除</button>
						</div>
					</th>
				</tr>
				<tr>
					<td>カード番号<br>
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
				<tr>
					<td>有効期限<br> <select>
							<option selected>1</option>
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
					</select> / <select>
							<option selected>2022</option>
							<option>2023</option>
							<option>2024</option>
							<option>2025</option>
							<option>2026</option>
							<option>2027</option>
							<option>2028</option>
							<option>2029</option>
							<option>2030</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>カード名義人<br>変更前：<%=m.getM_cardName() %> <br> <input type="text">
					</td>
				</tr>
				<tr>
					<td>セキュリティコード<br> <input type="text" name="code"
						maxlength="3"></td>
				</tr>
				<%} %>
			</table>
			<div class="click">
				<button type="button" class="go"
					onclick="location.href='uc05_s1_02.jsp'">新規クレジットカード登録</button>
			</div>
			<div class="click">
				<button type="button" class="back"
					onclick="location.href='uc05_02.jsp'">戻る</button>
				<button type="button" class="go" onclick="OnButtonClick()">更新</button>
			</div>
		</form>
	</main>
	<script src="./js/top.js" charset="UTF-8"></script>
	<script src="./js/uc05.js" charset="UTF-8"></script>
</body>

</html>