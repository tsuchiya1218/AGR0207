<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="model.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>
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
<link rel="stylesheet" type="text/css" href="./css/RoomKanri/apo.css">
</head>
<%
Date date = new Date();
SimpleDateFormat hhmm = new SimpleDateFormat("HH:mm");
String s_id = (String) session.getAttribute("s_id");
String nowtime = hhmm.format(date);
%>
<%//今日の日付、曜日取得
SimpleDateFormat sdf = new SimpleDateFormat("yyyy/M/d");
String[] week_name = {"日","月","火","水","木","金","土"};
Calendar cal = Calendar.getInstance();
int week = cal.get(Calendar.DAY_OF_WEEK) - 1;
%>
<%
SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
SimpleDateFormat HHmm = new SimpleDateFormat("HHmm");
SimpleDateFormat hh = new SimpleDateFormat("HH");
SimpleDateFormat mm = new SimpleDateFormat("mm");
RoomDao rDao = new RoomDao();
MemberDao mDao = new MemberDao();
UtilizationDao uDao = new UtilizationDao();
ArrayList<Room> rlist = rDao.room();
int ent = 0;
int exit = 0;
int useTime = 0;
%>
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
						<input type="search" name="search" class="form2-input"
							placeholder="会員IDまたは会員氏名" />
					</form>
				</div>
				<div class="header-nav-item">
					<button type="button" onclick="JumpSearch()">検索</button>
					<script>
						function JumpSearch() {
							document.form2.action = "Us_search"
							document.form2.submit();
						}
					</script>
				</div>
			</div>
			<div class="header-nav1">
				最終更新
				<%=nowtime%></div>
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
		<h2>予約一覧</h2>
		<div class="button">
			<!--
			<div class="circle1">
				<div class="triangle1"></div>
			</div>
			-->
			<div class="day"><%=sdf.format(date)%> (<%=week_name[week]%>)</div>
			<!-- 			
			<div class="circle2">
				<div class="triangle2"></div>
			</div>
			-->
		<!-- <a href="">今日</a>-->
		</div>
		<div class="scroll">
			<table>
				<tr class="tr1">
					<th class="th1"></th>
					<th class="th2" colspan="2">10:00</th>
					<th class="th2" colspan="2">11:00</th>
					<th class="th2" colspan="2">12:00</th>
					<th class="th2" colspan="2">13:00</th>
					<th class="th2" colspan="2">14:00</th>
					<th class="th2" colspan="2">15:00</th>
					<th class="th2" colspan="2">16:00</th>
					<th class="th2" colspan="2">17:00</th>
					<th class="th2" colspan="2">18:00</th>
					<th class="th2" colspan="2">19:00</th>
					<th class="th2" colspan="2">20:00</th>
					<th class="th2" colspan="2">21:00</th>
				</tr>
				<%for( Room r : rlist ){%>
					<%
					Utilization u = uDao.searchTodayU(r.getR_id(),sdf.format(date));
					if( u != null ){
						ent = Integer.parseInt(HHmm.format(u.getU_enterDay()));
						//exit取得
						Calendar calExit = Calendar.getInstance();
						calExit.setTime(u.getU_enterDay());
						int hour = Integer.parseInt(hh.format(u.getU_time()));
						int min = Integer.parseInt(mm.format(u.getU_time()));
						calExit.add(calExit.HOUR,hour);
						calExit.add(calExit.MINUTE,min);
						Date dateExit = calExit.getTime();
						exit = Integer.parseInt(HHmm.format(dateExit));
						
						//利用時間取得
						useTime = Integer.parseInt(hh.format(u.getU_time())) * 60
									+ Integer.parseInt(mm.format(u.getU_time()));
					}
					%>
					<tr>
						<th class="th2"><%=r.getR_id()%></th>
						<td class="<%if(ent==1000){%>td1<%}else if(ent<1000&&1000<exit){%>td1_2<%}%>">
						<%if(ent==1000&&u!=null){%><%=mDao.findName(u.getM_id())%><br><%=u.getU_num()%>名 <%=useTime%>分<%}%></td>
						<td class="<%if(ent==1030){%>td1<%}else if(ent<1030&&1030<exit){%>td1_2<%}%>">
						<%if(ent==1030&&u!=null){%><%=mDao.findName(u.getM_id())%><br><%=u.getU_num()%>名 <%=useTime%>分<%}%></td>
						<td class="<%if(ent==1100){%>td1<%}else if(ent<1100&&1100<exit){%>td1_2<%}%>">
						<%if(ent==1100&&u!=null){%><%=mDao.findName(u.getM_id())%><br><%=u.getU_num()%>名 <%=useTime%>分<%}%></td>
						<td class="<%if(ent==1130){%>td1<%}else if(ent<1130&&1130<exit){%>td1_2<%}%>">
						<%if(ent==1130&&u!=null){%><%=mDao.findName(u.getM_id())%><br><%=u.getU_num()%>名 <%=useTime%>分<%}%></td>
						<td class="<%if(ent==1200){%>td1<%}else if(ent<1200&&1200<exit){%>td1_2<%}%>">
						<%if(ent==1200&&u!=null){%><%=mDao.findName(u.getM_id())%><br><%=u.getU_num()%>名 <%=useTime%>分<%}%></td>
						<td class="<%if(ent==1230){%>td1<%}else if(ent<1230&&1230<exit){%>td1_2<%}%>">
						<%if(ent==1230&&u!=null){%><%=mDao.findName(u.getM_id())%><br><%=u.getU_num()%>名 <%=useTime%>分<%}%></td>
						<td class="<%if(ent==1300){%>td1<%}else if(ent<1300&&1300<exit){%>td1_2<%}%>">
						<%if(ent==1300&&u!=null){%><%=mDao.findName(u.getM_id())%><br><%=u.getU_num()%>名 <%=useTime%>分<%}%></td>
						<td class="<%if(ent==1330){%>td1<%}else if(ent<1330&&1330<exit){%>td1_2<%}%>">
						<%if(ent==1330&&u!=null){%><%=mDao.findName(u.getM_id())%><br><%=u.getU_num()%>名 <%=useTime%>分<%}%></td>
						<td class="<%if(ent==1400){%>td1<%}else if(ent<1400&&1400<exit){%>td1_2<%}%>">
						<%if(ent==1400&&u!=null){%><%=mDao.findName(u.getM_id())%><br><%=u.getU_num()%>名 <%=useTime%>分<%}%></td>
						<td class="<%if(ent==1430){%>td1<%}else if(ent<1430&&1430<exit){%>td1_2<%}%>">
						<%if(ent==1430&&u!=null){%><%=mDao.findName(u.getM_id())%><br><%=u.getU_num()%>名 <%=useTime%>分<%}%></td>
						<td class="<%if(ent==1500){%>td1<%}else if(ent<1500&&1500<exit){%>td1_2<%}%>">
						<%if(ent==1500&&u!=null){%><%=mDao.findName(u.getM_id())%><br><%=u.getU_num()%>名 <%=useTime%>分<%}%></td>
						<td class="<%if(ent==1530){%>td1<%}else if(ent<1530&&1530<exit){%>td1_2<%}%>">
						<%if(ent==1530&&u!=null){%><%=mDao.findName(u.getM_id())%><br><%=u.getU_num()%>名 <%=useTime%>分<%}%></td>
						<td class="<%if(ent==1600){%>td1<%}else if(ent<1600&&1600<exit){%>td1_2<%}%>">
						<%if(ent==1600&&u!=null){%><%=mDao.findName(u.getM_id())%><br><%=u.getU_num()%>名 <%=useTime%>分<%}%></td>
						<td class="<%if(ent==1630){%>td1<%}else if(ent<1630&&1630<exit){%>td1_2<%}%>">
						<%if(ent==1630&&u!=null){%><%=mDao.findName(u.getM_id())%><br><%=u.getU_num()%>名 <%=useTime%>分<%}%></td>
						<td class="<%if(ent==1700){%>td1<%}else if(ent<1700&&1700<exit){%>td1_2<%}%>">
						<%if(ent==1700&&u!=null){%><%=mDao.findName(u.getM_id())%><br><%=u.getU_num()%>名 <%=useTime%>分<%}%></td>
						<td class="<%if(ent==1730){%>td1<%}else if(ent<1730&&1730<exit){%>td1_2<%}%>">
						<%if(ent==1730&&u!=null){%><%=mDao.findName(u.getM_id())%><br><%=u.getU_num()%>名 <%=useTime%>分<%}%></td>
						<td class="<%if(ent==1800){%>td1<%}else if(ent<1800&&1800<exit){%>td1_2<%}%>">
						<%if(ent==1800&&u!=null){%><%=mDao.findName(u.getM_id())%><br><%=u.getU_num()%>名 <%=useTime%>分<%}%></td>
						<td class="<%if(ent==1830){%>td1<%}else if(ent<1830&&1830<exit){%>td1_2<%}%>">
						<%if(ent==1830&&u!=null){%><%=mDao.findName(u.getM_id())%><br><%=u.getU_num()%>名 <%=useTime%>分<%}%></td>
						<td class="<%if(ent==1900){%>td1<%}else if(ent<1900&&1900<exit){%>td1_2<%}%>">
						<%if(ent==1900&&u!=null){%><%=mDao.findName(u.getM_id())%><br><%=u.getU_num()%>名 <%=useTime%>分<%}%></td>
						<td class="<%if(ent==1930){%>td1<%}else if(ent<1930&&1930<exit){%>td1_2<%}%>">
						<%if(ent==1930&&u!=null){%><%=mDao.findName(u.getM_id())%><br><%=u.getU_num()%>名 <%=useTime%>分<%}%></td>
						<td class="<%if(ent==2000){%>td1<%}else if(ent<2000&&2000<exit){%>td1_2<%}%>">
						<%if(ent==2000&&u!=null){%><%=mDao.findName(u.getM_id())%><br><%=u.getU_num()%>名 <%=useTime%>分<%}%></td>
						<td class="<%if(ent==2030){%>td1<%}else if(ent<2030&&2030<exit){%>td1_2<%}%>">
						<%if(ent==2030&&u!=null){%><%=mDao.findName(u.getM_id())%><br><%=u.getU_num()%>名 <%=useTime%>分<%}%></td>
						<td class="<%if(ent==2100){%>td1<%}else if(ent<2100&&2100<exit){%>td1_2<%}%>">
						<%if(ent==2100&&u!=null){%><%=mDao.findName(u.getM_id())%><br><%=u.getU_num()%>名 <%=useTime%>分<%}%></td>
						<td class="<%if(ent==2130){%>td1<%}else if(ent<2130&&2130<exit){%>td1_2<%}%>">
						<%if(ent==2130&&u!=null){%><%=mDao.findName(u.getM_id())%><br><%=u.getU_num()%>名 <%=useTime%>分<%}%></td>
					</tr>
					<%
					ent = 0;
					exit = 0;
					useTime = 0;
					%>
				<%}%>
			</table>
		</div>
	</main>
	<footer> </footer>
</body>

</html>