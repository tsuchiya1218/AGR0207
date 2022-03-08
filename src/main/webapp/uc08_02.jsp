<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Member"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dao.*"%>
<%@ page import="model.Utilization"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html lang=ja>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<title>予約確認</title>
<link rel="stylesheet" type="text/css"
	href="./css/RoomRiyou/default.css">
<link rel="stylesheet" type="text/css" href="./css/RoomRiyou/header.css">
<link rel="stylesheet" type="text/css"
	href="./css/RoomRiyou/register.css">
<%
Member m = (Member) session.getAttribute("member");
UtilizationDao uDao = new UtilizationDao();
StoreDao sDao = new StoreDao();
RoomDao rDao = new RoomDao();
ModelDao mDao = new ModelDao();
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
		<form method="post" name="form" action="">
			<div class="idnum">
				ようこそ、 <a href="uc05_02.jsp"><%=m.getM_sei() + m.getM_mei()%></a> さん
				<button type="button" class="back" onclick="OnButtonClick()">ログアウト</button>
			</div>
			<h2>予約確認</h2>
			<%
			SimpleDateFormat yyyy = new SimpleDateFormat("yyyy");
			SimpleDateFormat MM = new SimpleDateFormat("MM");
			SimpleDateFormat dd = new SimpleDateFormat("dd");
			SimpleDateFormat HH = new SimpleDateFormat("HH");
			SimpleDateFormat mm = new SimpleDateFormat("mm");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String[] week_name = { "日", "月", "火", "水", "木", "金", "土" };
			Calendar cal = Calendar.getInstance();
			Date date = new Date();
			String dayStr = sdf.format(date);
			ArrayList<Utilization> ulist = uDao.findAllUtilization(m.getM_id(),dayStr);
			int count = 0;
			for (Utilization u : ulist) {
				count++;
			%>
			<script>
				var txt<%=count%> = "<%=u.getU_id()%>";
				function SetValue<%=count%>() {
					document.getElementById("u_id").value = txt<%=count%>;
					document.form.action = "Uc08_s1_02";
					document.form.submit();
				}
				function Set2Value<%=count%>() {
					document.getElementById("u_id").value = txt<%=count%>;
					document.form.action = "Uc08_s2_02";
					document.form.submit();
				}
			</script>
			<table class="table2">
				<tr>
					<th colspan="2">予約<%=count%> <input type="hidden" id="u_id"
						name="u_id" value="">
						<button type="button" class="go" onclick="SetValue<%=count%>()">変更する</button>
						<button type="button" class="go" onclick="Set2Value<%=count%>()">キャンセル</button>
					</th>
				</tr>
				<tr>
					<%
					Timestamp e = u.getU_enterDay();
					Timestamp uTime = u.getU_time();
					int y = Integer.parseInt(yyyy.format(e));
					int mStr = Integer.parseInt(MM.format(e));
					int d = Integer.parseInt(dd.format(e));
					int useTime = Integer.parseInt(HH.format(uTime));
					useTime = useTime * 60;
					useTime = useTime + Integer.parseInt(mm.format(uTime));
					cal.set(y, mStr, d);
					String week = week_name[cal.get(Calendar.DAY_OF_WEEK) - 1];
					%>
					<th>入室日時</th>
					<td><%=mStr%>月<%=d%>日（<%=week%>） <%=HH.format(e)%>:<%=mm.format(e)%></td>
				</tr>
				<tr>
					<th>店舗</th>
					<td><%=sDao.findStoreName(u.getS_id())%></td>
				</tr>
				<tr>
					<th>人数</th>
					<td><%=u.getU_num()%></td>
				</tr>
				<tr>
					<th>時間</th>
					<td><%=useTime%>分</td>
				</tr>
				<tr>
					<th>ルーム番号</th>
					<td><%=u.getR_id()%></td>
				</tr>
				<tr>
					<th>機種</th>
					<td><%=mDao.findModelName(rDao.findModelId(u.getR_id()))%></td>
				</tr>
			</table>
			<%
			}
			%>
		</form>

	</main>
	<script src="./js/top.js" charset="UTF-8"></script>
	<script src="./js/uc08jump.js" charset="UTF-8"></script>
</body>

</html>