<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="model.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang=ja>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<title>カラオケわっしょい</title>
<link rel="stylesheet" type="text/css"
	href="./css/RoomKanri/default.css">
<link rel="stylesheet" type="text/css" href="./css/RoomKanri/header.css">
<link rel="stylesheet" type="text/css" href="./css/RoomKanri/home.css">
<%
Date date = new Date();
SimpleDateFormat hhmm = new SimpleDateFormat("HH:mm");
SimpleDateFormat HHmm = new SimpleDateFormat("HHmm");
String s_id = (String)session.getAttribute("s_id");
String nowtime = hhmm.format(date);
%>
<%
session.setAttribute("error",null);
UtilizationDao uDao = new UtilizationDao();
RoomDao rDao = new RoomDao();
ArrayList<Room> rlist = rDao.room(s_id);
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
</head>

<body>
	<header>
		<div class="h1-2">
			<h1>ルーム管理システム</h1>
		</div>
		<div class="header-inner">
			<div class="h1">
				<h1>ルーム管理システム</h1>
			</div>
			<div class="header-nav2">
				<div class="header-nav-item">
					<form method="post" name="form2" class="form2">
						<input type="search" name="search" class="form2-input" placeholder="会員IDまたは会員氏名" />
					</form>
				</div>
				<div class="header-nav-item">
					<button type="button" onclick="JumpSearch()">検索</button>
					<script>
					function JumpSearch(){
						document.form2.action = "Us_search"
						document.form2.submit();
					}
					</script>
				</div>
			</div>
			<div class="header-nav1">
				最終更新
				<%=nowtime%>
			</div>
		</div>
		<div class="box-nav">
			<ul>
				<li><a href="us01_03.jsp">ホーム</a></li>
				<li><a href="us03_02.jsp">予約</a></li>
				<li><a href="us05_02.jsp">注文</a></li>
				<li><a href="us06_02.jsp">清掃</a></li>
				<li><a href="us08_02.jsp">管理者ログイン</a></li>
			</ul>
		</div>
	</header>
	<main>
		<h2>ホーム</h2>
		<div class="items">
		<%
		String exit = "null";
		String utilization = null;
		String exitHH = "00";
		String exitmm = "00";
		int num = 0;
		%>
			<%for(Room r : rlist){%>
			<div class="<%if(r.getR_clean().equals("空き")){%>item1
			<%}else if(r.getR_clean().equals("使用中")){
				exit = uDao.findUseExitTime(r.getR_id());
				exitHH = exit.substring(0,2);
				exitmm = exit.substring(3,5);
				num = uDao.findUseNum(r.getR_id());
				%>item2
			<%}else if(r.getR_clean().equals("未清掃")){%>item3
			<%}else if(r.getR_clean().equals("予約")){%>item4
			<%}else if(r.getR_clean().equals("使用中")&&
				Integer.parseInt(HHmm.format(date))> Integer.parseInt(HHmm.format(exitHH+exitmm))){%>item6
			<%}%>">
				<table>
					<tr>
						<th><a href="us02_02.jsp?r_id=<%=r.getR_id()%>"><%=r.getR_id()%></a></th>
						<th class="<%if(r.getR_clean().equals("空き")){%>th1
						<%}else if(r.getR_clean().equals("使用中")){%>th2
						<%}else if(r.getR_clean().equals("未清掃")){%>th3
						<%}else if(r.getR_clean().equals("予約")){%>th4
						<%}else if(r.getR_clean().equals("使用中")&&
							Integer.parseInt(HHmm.format(date))> Integer.parseInt(HHmm.format(exitHH+exitmm))){%>th6
						<%}%>">
						<%=r.getR_clean()%>
						</th>
					</tr>
					<tr>
						<td>
						<%if(r.getR_clean().equals("使用中")){%>入室
						<%}else if(r.getR_clean().equals("予約")){%>入室予約
						<%}else{%><%}%>
						</td>
						<td>
						<%if(r.getR_clean().equals("使用中")){%>
							<%=uDao.findUseEnterTime(r.getR_id())%>
							
						<%}else if(r.getR_clean().equals("予約")){
							utilization = uDao.findEnterTime(r.getR_id(),sdf.format(date));
							if(utilization != null){%>
							<%=utilization%>
							<%}else{
								rDao.updateR_clean(r.getR_id(),"空き");
							}%>
						<%}else{%><%}%>
						</td>
					</tr>
					<tr>
						<td>
						<%if(r.getR_clean().equals("使用中")){%>退室予定<%}%>
						</td>
						<td>
						<%if(r.getR_clean().equals("使用中")){%><%=exit%>
						<%}%>
						</td>
					</tr>
					<tr>
						<td><%if(r.getR_clean().equals("使用中")){%><%=num%>名<%}%></td>
						<td><%if(r.getR_clean().equals("使用中")&&
								Integer.parseInt(HHmm.format(date))>Integer.parseInt(exitHH+exitmm)){%>
								<%=Integer.parseInt(HHmm.format(date))-Integer.parseInt(exitHH+exitmm)%>分超過
							<%}%>
						</td>
					</tr>
				</table>
			</div>
			<%}%>
		</div>
	</main>
	<footer> </footer>
</body>

</html>