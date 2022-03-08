<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
<%@ page import="model.Member"%>
<%@ page import="dao.*"%>
<!DOCTYPE html>
<html lang=ja>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<title>トップ画面</title>
<link rel="stylesheet" type="text/css"
	href="./css/RoomRiyou/default.css">
<link rel="stylesheet" type="text/css" href="./css/RoomRiyou/header.css">
<link rel="stylesheet" type="text/css" href="./css/RoomRiyou/top.css">
<%
Member m = (Member) session.getAttribute("member");
String u_id = (String)session.getAttribute("u_id");
ArrayList<String> menu = (ArrayList<String>)session.getAttribute("menu");
UtilizationDao uDao = new UtilizationDao();
StoreDao sDao = new StoreDao();
RoomDao rDao = new RoomDao();
%>
</head>
<%
String classStr = "cannot";
session.setAttribute("class",classStr);
Date now = new Date();
SimpleDateFormat dd = new SimpleDateFormat("dd");
SimpleDateFormat HHmm = new SimpleDateFormat("HHmm");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
String today = dd.format(now);
String d = sdf.format(now);
ArrayList<String> ary = uDao.findUtilization(m.getM_id(), sdf.format(now));
String[] week_name = { "日", "月", "火", "水", "木", "金", "土" };
String s_store = null;
String week = null;
String hh = null;
String mm = "";
int yInt = 0;
int mInt = 0;
int dInt = 0;
boolean b = false;
Calendar cal = null;
Calendar cal2 = null;
String hhmm = "0";
String day = ary.get(0);
if ( ary != null ) {
	if(ary.get(0) != null){
		session.setAttribute("ary", ary);
		yInt = Integer.parseInt(day.substring(0, 4));
		mInt = Integer.parseInt(day.substring(5, 7));
		dInt = Integer.parseInt(day.substring(8, 10));
		hh = day.substring(11, 13);
		mm = day.substring(14, 16);
		hhmm = hh+mm;
		cal = Calendar.getInstance();
		cal.set(yInt,3, dInt,Integer.parseInt(hh),Integer.parseInt(mm));
		cal2 = Calendar.getInstance();
		b = cal.before(cal2);
		week = week_name[cal.get(Calendar.DAY_OF_WEEK) - 1];
		s_store = sDao.findStoreName(ary.get(1));
		sDao.connectionClose();
	}
}
int nowTime = Integer.parseInt(HHmm.format(now));
int t1 = 0;
int t2 = 0;
int hour = 0;
String tt = "";
if (mm.equals("00")) {
	hour = Integer.parseInt(hh) - 1;
	tt = String.valueOf(hour) + "30";
	t1 = Integer.parseInt(tt);
	t2 = Integer.parseInt(hh + "15");
} else if (mm.equals("30")) {
	t1 = Integer.parseInt(hh + "00");
	t2 = Integer.parseInt(hh + "45");
}
if (Integer.parseInt(today) == dInt && (t1 <= nowTime && nowTime <= t2) ) {
	classStr = "go";
	session.setAttribute("class",classStr);
}
if(Integer.parseInt(today) == dInt && u_id != null){
	rDao.updateR_clean(u_id,"予約");
}
%>
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
			<%
			if ( ary.get(0) != null ) {
			%>
			<div class="next">
				<p>次回予約</p>
				<p class="bold"><%=mInt%>月<%=dInt%>日（<%=week%>）<%=hh%>:<%=mm%>
					<%=s_store%></p>
				<p class="list">
					<a href="uc08_02.jsp">予約確認・変更・キャンセル</a>
				</p>
			</div>
			<%
			}
			%>
			<div class="menu">
				<div class="topmenu">
					<button type="button" class="go"
						onclick="location.href='uc07_02.jsp'">予約</button>
					<p>▲こちらから予約できます▲</p>
				</div>
				<div class="topmenu">
					<button type="button" class="go"
						onclick="location.href='uc08_02.jsp'">予約確認</button>
				</div>
				<div class="topmenu">
					<button type="button"
						class="<%if(classStr.equals("cannot") || menu.get(1).equals("入室中")){%>cannot<%}else{%>go<%}%>"
						<%if (classStr.equals("cannot") || menu.get(1).equals("入室中") ) {%>
						disabled <%}%> onclick="JumpJava1002()">入室する</button>
					<p>▲入室時はこちらをタップ▲</p>
				</div>
				<div class="topmenu">
					<button type="button"
						class="<%if(!menu.get(1).equals("入室中")){%>cannot<%}else{%>go<%}%>"
						<%if(!menu.get(1).equals("入室中")){%> disabled <%}%>
						onclick="location.href='uc12_02.jsp'">メニュー</button>
					<p>▲こちらから注文できます▲</p>
				</div>
				<div class="topmenu">
					<button type="button"
						class="<%if(!menu.get(1).equals("入室中")){%>cannot<%}else{%>go<%}%>"
						<%if(!menu.get(1).equals("入室中")){%> disabled <%}%>
						onclick="location.href='uc13_02.jsp'">注文履歴</button>
				</div>
				<div class="topmenu_last">
					<button type="button"
						class="<%if(!menu.get(1).equals("入室中")){%>cannot<%}else{%>go<%}%>"
						<%if(!menu.get(1).equals("入室中")){%> disabled <%}%>
						onclick="JumpJava1102()">退室する</button>
					<p>▲退室時はこちらをタップ▲</p>
				</div>
			</div>
		</form>
	</main>
	<script src="./js/top.js" charset="UTF-8"></script>
</body>

</html>