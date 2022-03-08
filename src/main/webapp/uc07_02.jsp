<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.Member"%>
<%@ page import="model.Store"%>
<%@ page import="dao.*"%>


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
StoreDao sDao = new StoreDao();
Member m = (Member) session.getAttribute("member");
@SuppressWarnings("unchecked")
ArrayList<Store> sArealist = sDao.findArea();
@SuppressWarnings("unchecked")
ArrayList<Store> sADlist = (ArrayList<Store>) session.getAttribute("storeADlist");
@SuppressWarnings("unchecked")
ArrayList<Store> sCClist = (ArrayList<Store>) session.getAttribute("storeCClist");
@SuppressWarnings("unchecked")
ArrayList<Store> sKAlist = (ArrayList<Store>) session.getAttribute("storeKAlist");
@SuppressWarnings("unchecked")
ArrayList<Store> sKElist = (ArrayList<Store>) session.getAttribute("storeKElist");
@SuppressWarnings("unchecked")
ArrayList<Store> sMIlist = (ArrayList<Store>) session.getAttribute("storeMIlist");
@SuppressWarnings("unchecked")
ArrayList<Store> sOUlist = (ArrayList<Store>) session.getAttribute("storeOUlist");
@SuppressWarnings("unchecked")
ArrayList<Store> sSAlist = (ArrayList<Store>) session.getAttribute("storeSAlist");
@SuppressWarnings("unchecked")
ArrayList<Store> sSMlist = (ArrayList<Store>) session.getAttribute("storeSMlist");
@SuppressWarnings("unchecked")
ArrayList<Store> sSOlist = (ArrayList<Store>) session.getAttribute("storeSOlist");
@SuppressWarnings("unchecked")
ArrayList<Store> sSSlist = (ArrayList<Store>) session.getAttribute("storeSSlist");
@SuppressWarnings("unchecked")
ArrayList<Store> sTNlist = (ArrayList<Store>) session.getAttribute("storeTNlist");
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
			ようこそ、 <a href="uc05_02.jsp"><%=m.getM_sei() + m.getM_mei() %></a> さん
			<button type="button" class="back" onclick="OnButtonClick()">ログアウト</button>
		</div>
		<h2>店舗・人数・時間選択</h2>
		<p>ご利用する店舗、人数、時間を選択してください。</p>
		<p>※3時間（180分）以上ご利用の場合、同一料金となります。最大5時間（300分）まで選択可能です。</p>
		<form method="post" name="form" action="" class="pulldownset">
			<div class="apo">
				<div>店舗</div>
				<div>
					<select name="area" id="area">
						<option value="">エリアを選択</option>
						<%
						int num = 0;
						for (Store s : sArealist) {
							String s_area = s.getS_area();
							num++;
							switch (num) {
								case 1 :
						%>
						<option value="adachi"><%=s_area%></option>
						<%
						break;
						case 2 :
						%>
						<option value="chiyoda"><%=s_area%></option>
						<%
						break;
						case 3 :
						%>
						<option value="kanagawa"><%=s_area%></option>
						<%
						break;
						case 4 :
						%>
						<option value="katsushika"><%=s_area%></option>
						<%
						break;
						case 5 :
						%>
						<option value="minato"><%=s_area%></option>
						<%
						break;
						case 6 :
						%>
						<option value="kugai"><%=s_area%></option>
						<%
						break;
						case 7 :
						%>
						<option value="saitama"><%=s_area%></option>
						<%
						break;
						case 8 :
						%>
						<option value="shibuya"><%=s_area%></option>
						<%
						break;
						case 9 :
						%>
						<option value="setagaya"><%=s_area%></option>
						<%
						break;
						case 10 :
						%>
						<option value="shinjyuku"><%=s_area%></option>
						<%
						break;
						case 11 :
						%>
						<option value="toshima"><%=s_area%></option>
						<%
						break;

						}
						}
						%>
					</select>
				</div>
				<div>
					<select name="subbox" id="subbox">
						<option value="">店舗を選択</option>
					</select>
				</div>
			</div>
			<div class="apo">
				<div>利用人数</div>
				<select name="num" id="num">
					<option value="">人数を選択</option>
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
			</div>
			<div class="apo">
				<div>利用時間</div>
				<select name="min" id="min">
					<option value="">時間を選択</option>
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
			</div>
			<div class="click">
				<button type="button"class="go" onclick="JumpJava02()">次へ</button>
			</div>
		</form>
	</main>
	<script type="text/javascript">
		var sADlist = new Array();
		sADlist[0] = "店舗を選択";
		<%for (Store s : sADlist) {
	String s_store = s.getS_store();%>
			sADlist.push("<%=s_store%>");
		<%}%>
		var sCClist = new Array();
		sCClist[0] = "店舗を選択";
		<%for (Store s : sCClist) {
	String s_store = s.getS_store();%>
			sCClist.push("<%=s_store%>");
		<%}%>
		var sKAlist = new Array();
		sKAlist[0] = "店舗を選択";
		<%for (Store s : sKAlist) {
	String s_store = s.getS_store();%>
			sKAlist.push("<%=s_store%>");
		<%}%>
		var sKElist = new Array();
		sKElist[0] = "店舗を選択";
		<%for (Store s : sKElist) {
	String s_store = s.getS_store();%>
			sKElist.push("<%=s_store%>");
		<%}%>
		var sMIlist = new Array();
		sMIlist[0] = "店舗を選択";
		<%for (Store s : sMIlist) {
	String s_store = s.getS_store();%>
			sMIlist.push("<%=s_store%>");
		<%}%>
		var sOUlist = new Array();
		sOUlist[0] = "店舗を選択";
		<%for (Store s : sOUlist) {
	String s_store = s.getS_store();%>
			sOUlist.push("<%=s_store%>");
		<%}%>
		var sSAlist = new Array();
		sSAlist[0] = "店舗を選択";
		<%for (Store s : sSAlist) {
	String s_store = s.getS_store();%>
			sSAlist.push("<%=s_store%>");
		<%}%>
		var sSMlist = new Array();
		sSMlist[0] = "店舗を選択";
		<%for (Store s : sSMlist) {
	String s_store = s.getS_store();%>
			sSMlist.push("<%=s_store%>");
		<%}%>
		var sSOlist = new Array();
		sSOlist[0] = "店舗を選択";
		<%for (Store s : sSOlist) {
	String s_store = s.getS_store();%>
			sSOlist.push("<%=s_store%>");
		<%}%>
		var sSSlist = new Array();
		sSSlist[0] = "店舗を選択";
		<%for (Store s : sSSlist) {
	String s_store = s.getS_store();%>
			sSSlist.push("<%=s_store%>");
		<%}%>
		var sTNlist = new Array();
		sTNlist[0] = "店舗を選択";
		<%for (Store s : sTNlist) {
	String s_store = s.getS_store();%>
			sTNlist.push("<%=s_store%>");
	<%}%>
		
	</script>
	<script src="./js/top.js" charset="UTF-8"></script>
	<script src="./js/uc07_02.js" charset="UTF-8"></script>
</body>

</html>