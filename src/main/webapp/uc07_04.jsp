<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="model.Member"%>
<%@ page import="model.Utilization"%>
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
ArrayList<String> ary = (ArrayList<String>) session.getAttribute("ArrayList");
@SuppressWarnings("unchecked")
ArrayList<String> arytime = (ArrayList<String>) session.getAttribute("nowtime");
@SuppressWarnings("unchecked")
ArrayList<Date> eTimelist = (ArrayList<Date>) session.getAttribute("eTimelist");
@SuppressWarnings("unchecked")
ArrayList<Date> uTimelist = (ArrayList<Date>) session.getAttribute("uTimelist");
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
		<h2>予約時間一覧</h2>
		<p>ご利用される開始時間を選択してください。</p>
		<p>※一週間先まで予約可能です。</p>
		<p>※✕印以外のマークのみ選択可能です。</p>
		<p>※予約の混雑状況によっては、ご希望される広さや機種のルームが空いてない場合もございます。</p>
		<p>◎･･･空きあり　△･･･残りわずか　✕･･･空き無し</p>
		<form method="post" name="form" action="">
			<p><%=ary.get(0)%>
				<%=ary.get(1)%>人
				<%=ary.get(2)%>分 の検索結果
			</p>
			<%
			int entry;
			int entryDay;
			int exit;
			int checkAll = 0;
			String uHour;
			String uMin;
			Calendar calendar;
			SimpleDateFormat dd = new SimpleDateFormat("dd");
			SimpleDateFormat hh = new SimpleDateFormat("HH");
			SimpleDateFormat mm = new SimpleDateFormat("mm");

			%>
			<table class="time">
				<tr>
					<th rowspan="2">日時</th>
					<th colspan="7"><%=arytime.get(0)%>年<%=arytime.get(1)%>月</th>
				</tr>
				<tr class="dark">
					<%
					String d = arytime.get(2);
					int today = Integer.parseInt(d);
					String w = arytime.get(3);
					int week = Integer.parseInt(w);
					String[] week_name = { "日", "月", "火", "水", "木", "金", "土" };
					for (int i = 0; i < 7; i++) {
						if (week > 6) {
							week = 0;
						}%>
						<td><%=today + i%><br><%=week_name[week]%></td>
						<%
						week++;
					}%>
				</tr>
					<%
					String zero = "00";
					String thirty = "30";
					String strI;
					String value; 
					int judge = 1;
					int check1;
					int check2;
					int plusHour;
					for (double i = 10; i <= 21; i += 0.5) {%>
					<tr>
						<%if (judge % 2 != 0) {
						%>
						<th class="dark"><%=(int)i%>:<%=zero%></th>
						<%
						strI = String.valueOf((int)i);
						value = strI + zero;
						check1 = Integer.parseInt(strI + zero);
						check2 = Integer.parseInt(strI + thirty);
						} else {
						%>
						<th class="dark"><%=(int)i%>:<%=thirty%></th>
						<%
						strI = String.valueOf((int)i);
						value = strI + thirty;
						plusHour = (int)i + 1;
						check1 = Integer.parseInt(strI + thirty);
						check2 = Integer.parseInt(plusHour + zero);
						}
						for( int j = 0 ; j < 7 ; j++ ){%>
							<td><input type="radio" name="date" value="<%=j%><%=value%>" id="<%=j%><%=value%>">
							<%
							if(eTimelist.size() == 0){%>
								<label for="<%=j%><%=value%>">◎</label>
							<%}
							calendar = Calendar.getInstance();
							for (int n = 0; n < eTimelist.size(); n++) {
								Date e = eTimelist.get(n);
								Date u = uTimelist.get(n);
								String uHourStr = hh.format(u);
								String uMinStr = mm.format(u);
								String eDay = dd.format(e);
								String eHourStr = hh.format(e);
								String eMinStr = mm.format(e);
								entryDay = Integer.parseInt(eDay);
								int hour = Integer.parseInt(uHourStr);
								int min = Integer.parseInt(uMinStr);
	
								calendar.setTime(e);
								calendar.add(Calendar.HOUR, hour);
								calendar.add(Calendar.MINUTE, min);
								Date d1 = calendar.getTime();
								uHour = hh.format(d1);
								uMin = mm.format(d1);
								
								Date date = new Date();
								int nowTime = Integer.parseInt(hh.format(date)+mm.format(date));
								int nowDay = Integer.parseInt(dd.format(date));
								
								entry = Integer.parseInt(eHourStr + eMinStr);
								exit = Integer.parseInt(uHour + uMin);
								if ( entryDay == today + j || nowTime > check1 ) {
									int useCheck = 0;
									if ( entry <= check1 && check1 <= exit || nowTime > check1) {
										useCheck++;
										if( useCheck == 29 || ( nowTime > check1 && today+j == nowDay ) ){%>
											<label for="<%=j%><%=value%>">✕</label>
											<%break;
										} else if( useCheck >= 25 ){%>
											<label for="<%=j%><%=value%>">△</label>
											<%break;
										}else{%>
											<label for="<%=j%><%=value%>">◎</label>
											<%break;
										}
									 } else {
										 checkAll++;
								 		 if (checkAll == eTimelist.size()) {
										 %><label for="<%=j%><%=value%>">◎</label>
										<%
										 }
									 }
								 } else {
									 checkAll++;
									 if (checkAll == eTimelist.size()) {
										 %><label for="<%=j%><%=value%>">◎</label>
									<%}
								 }
							 }%>
						</td>
						<%checkAll = 0;}

						 judge++; %>
					 </tr>
		 			<%}%>
			</table>
			<div class="click">
				<button type="button" class="back" onclick="location.href='uc07_02.jsp'">戻る</button>
				<button type="button" class="go" onclick="JumpJava04()">次へ</button>
			</div>
		</form>
	</main>
	<script src="./js/top.js" charset="UTF-8"></script>
	<script src="./js/apo_time.js" charset="UTF-8"></script>
	<script src="./js/uc07jump.js" charset="UTF-8"></script>

</body>

</html>