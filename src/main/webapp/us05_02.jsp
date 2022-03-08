<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="model.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Date"%>
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
<link rel="stylesheet" type="text/css" href="./css/RoomKanri/order.css">
</head>
<%
Date date = new Date();
SimpleDateFormat hhmm = new SimpleDateFormat("HH:mm");
String s_id = (String)session.getAttribute("s_id");
String nowtime = hhmm.format(date);
%>
<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
RoomDao rDao = new RoomDao();
GoodsDao gDao = new GoodsDao();
WorkerDao wDao = new WorkerDao();
OrdersDao oDao = new OrdersDao();
UtilizationDao uDao = new UtilizationDao();
ArrayList<Orders> olist = oDao.findTodayOrder(sdf.format(date));
try{
	olist.get(0);
}catch(Exception e){
	olist = null;
}
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
			<div class="header-nav1">最終更新 <%=nowtime%></div>
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
			<h2>注文一覧</h2>
			<div class="scroll">
				<table class="order">
					<caption>
						<h3>待ち状態</h3>
					</caption>
					<tr class="tr1">
						<th class="size2">注文状況</th>
						<th class="size2">注文時刻</th>
						<th class="size2">ルーム番号</th>
						<th>注文内容</th>
						<th class="size1">数量</th>
						<th class="size3">調理開始時刻</th>
						<th class="size2">提供時刻</th>
						<th class="size4">従業員番号入力欄</th>
					</tr>
					<tr class="tr2">
						<th class="size1">注文<br>状況
						</th>
						<th class="size1">注文<br>時刻
						</th>
						<th class="size2">ルーム<br>番号
						</th>
						<th class="size3">注文内容</th>
						<th class="size1">数量</th>
						<th class="size1">調理<br>時刻
						</th>
						<th class="size1">提供<br>時刻
						</th>
						<th class="size4">従業員番号<br>入力欄
						</th>
					</tr>
					<%if(olist != null){%>
						<%for(Orders o : olist){%>
							<%if(o.getO_situation().equals("注文中")){%>
								<tr>
									<td>待ち</td>
									<td><%=hhmm.format(o.getO_time())%></td>
									<td><%=uDao.findR_id(o.getU_id())%></td>
									<td><%=gDao.findName(o.getG_id())%></td>
									<td><%=o.getO_quantity()%></td>
									<td>
										<%if(o.getO_makeTime()!=null){%>
											<%=hhmm.format(o.getO_makeTime())%>
										<%}%>
									</td>
									<td>
										<%if(o.getO_makeTime()!=null){%>
											<button type="submit" name="fin" onClick="JumpJava()" value="<%=o.getO_id()%>">完了</button>
										<%}%>
									</td>
									<td>
										<%if(o.getO_makeTime()!=null){%>
											<%=wDao.findName(o.getW_id())%>
										<%}else{%>
											<input type="text" name="w_id">
											<button type="submit" name="o_id" onClick="JumpJava()" value="<%=o.getO_id()%>">確定</button>
										<%}%>
									</td>
								</tr>
							<%}%>
						<%}%>
					<%}%>
				</table>
			</div>
			<div class="scroll">
				<table class="order">
					<caption>
						<h3>届け済</h3>
					</caption>
					<tr class="tr1">
						<th class="size2">注文状況</th>
						<th class="size2">注文時刻</th>
						<th class="size2">ルーム番号</th>
						<th>注文内容</th>
						<th class="size1">数量</th>
						<th class="size3">調理開始時刻</th>
						<th class="size2">提供時刻</th>
						<th class="size4">従業員番号入力欄</th>
					</tr>
					<tr class="tr2">
						<th class="size1">注文<br>状況
						</th>
						<th class="size1">注文<br>時刻
						</th>
						<th class="size2">ルーム<br>番号
						</th>
						<th class="size3">注文内容</th>
						<th class="size1">数量</th>
						<th class="size1">調理<br>時刻
						</th>
						<th class="size1">提供<br>時刻
						</th>
						<th class="size4">従業員番号<br>入力欄
						</th>
					</tr>
					<%if(olist != null){%>
						<%for(Orders o : olist){%>
							<%if(o.getO_situation().equals("届け済")){%>
								<tr>
									<td><%=o.getO_situation()%></td>
									<td><%=hhmm.format(o.getO_time())%></td>
									<td><%=uDao.findR_id(o.getU_id())%></td>
									<td><%=gDao.findName(o.getG_id())%></td>
									<td><%=o.getO_quantity()%></td>
									<td><%=hhmm.format(o.getO_makeTime())%></td>
									<td><%=hhmm.format(o.getO_offerTime())%></td>
									<td><%=wDao.findName(o.getW_id())%></td>
								</tr>
							<%}%>
						<%}%>
					<%}%>
				</table>
			</div>
		</form>
	</main>
	<script>
	function JumpJava(){
		document.form.action = "Us05";
		document.form.submit();
	}
	</script>
	<footer> </footer>
</body>

</html>