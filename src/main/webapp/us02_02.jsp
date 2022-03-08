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
<link rel="stylesheet" type="text/css" href="./css/RoomKanri/room.css">
<%
Date date = new Date();
SimpleDateFormat hhmm = new SimpleDateFormat("HH:mm");
String s_id = (String)session.getAttribute("s_id");
String nowtime = hhmm.format(date);
%>
<%
Calendar cal1 = Calendar.getInstance();
Calendar cal2 = Calendar.getInstance();
SimpleDateFormat hh = new SimpleDateFormat("HH");
SimpleDateFormat mm = new SimpleDateFormat("mm");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String r_id = request.getParameter("r_id");
RoomDao rDao = new RoomDao();
MemberDao mDao = new MemberDao();
UtilizationDao uDao = new UtilizationDao();
ArrayList<Utilization> ulist = uDao.findRoom(r_id,sdf.format(date));
try{
	ulist.get(0);
}catch(Exception e){
	ulist = null;
}
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
	<form method="post" name="form">
		<h2>ルーム使用状況</h2>
		<div class="tables">
			<div class="table1">
				<table class="table1-inner">
					<caption><%=r_id%>
					<%if(rDao.findR_clean(r_id).equals("使用中")){%><span>使用中</span><%}%>
					</caption>
				<%if(ulist!=null){
                	for(Utilization u : ulist){%>
						<tr>
							<th><%=hhmm.format(u.getU_enterDay())%></th>
							<th>入室予定</th>
							<%--年齢取得--%>
							<%
							cal1.setTime(date);
							cal2.setTime(mDao.findBirthday(u.getM_id()));
							int age = cal1.get(Calendar.YEAR) - cal2.get(Calendar.YEAR);
							%>
							<%--利用TIME分変換--%>
							<%
							int useTime = Integer.parseInt(hh.format(u.getU_time())) * 60 
								+ Integer.parseInt(mm.format(u.getU_time()));
							%>
							<td rowspan="2">会員ID：<%=u.getM_id()%> <%=age%>歳 <%=u.getU_num()%>名 <%=useTime%>分
							</td>
						</tr>
						<tr>
							<th><%if(u.getU_enterTime()!=null){%><%=hhmm.format(u.getU_enterTime())%><%}%></th>
							<th><%if(u.getU_enterTime()!=null){%>入室<%}%></th>
						</tr>
						<tr>
							<th></th>
							<th></th>
							<td></td>
						</tr>
						<tr>
							<%--退室時間取得--%>
							<%
							Date d1 = new Date(u.getU_enterDay().getTime());
							Date d2 = new Date(u.getU_time().getTime());
							cal1.setTime(d1);
							cal2.setTime(d2);
							String s = hh.format(d2);
							cal1.add(Calendar.HOUR,Integer.parseInt(hh.format(d2)));
							cal1.add(Calendar.MINUTE,Integer.parseInt(mm.format(d2)));
							d1 = cal1.getTime();
							%>
							<th><%=hhmm.format(d1)%></th>
							<th>退室予定</th>
							<td></td>
						</tr>
						<tr>
							<th><%if(u.getU_enterJudge().equals("退室済")){%><%=hhmm.format(u.getU_exitTime())%><%}%></th>
							<th><%if(u.getU_enterJudge().equals("退室済")){%>退室<%}%></th>
							<td><%if( sdf.format(u.getU_Etime())==null ){%>延長なし<%}%></td>
						</tr>
					<%}%>
				<%}%>
				</table>
			</div>
				<%if(rDao.findR_clean(r_id).equals("予約")){%>
					<div class="table2">
	                	<caption>入室処理</caption>
	                		<tr>
	                			<input type="hidden" name="button" value="入室">
	                			<td><input type="text" name="u_id" placeholder="予約IDを入力"></td>
	                    		<td><button type="button" onclick="JumpJava()">入室</button></td>
	                		</tr>
	        		</div>
        		<%}else if(rDao.findR_clean(r_id).equals("使用中")){%>
					<div class="table2">
	                	<caption>退室処理</caption>
	                		<tr>
	                			<input type="hidden" name="button" value="退室">
	                			<td><input type="text" name="u_id" placeholder="予約IDを入力"></td>
	                    		<td><button type="button" onclick="JumpJava()">退室</button></td>
	                		</tr>
	        		</div>
	        	<%}%>
		</div>
	</form>
	</main>
	<script>
	function JumpJava(){
		document.form.action = "Us02?r_id=<%=r_id%>";
		document.form.submit();
	}
	</script>
	<footer> </footer>
</body>

</html>