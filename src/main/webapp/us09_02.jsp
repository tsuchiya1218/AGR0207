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
	href="./css/RoomKanri/default2.css">
<link rel="stylesheet" type="text/css"
	href="./css/RoomKanri/header2.css">
<link rel="stylesheet" type="text/css" href="./css/RoomKanri/num.css">
</head>
<%
Date date = new Date();
SimpleDateFormat hhmm = new SimpleDateFormat("HH:mm");
String s_id = (String)session.getAttribute("s_id");
String nowtime = hhmm.format(date);
%>
<%
String error = (String)session.getAttribute("error");
WorkerDao wDao = new WorkerDao();
ArrayList<Worker> wlist = wDao.findAll();
try{
	wlist.get(0);
}catch(Exception e){
	wlist = null;
}
%>
<body>
	<header>
		<div class="header-inner">
			<div class="h1">
				<h1>ルーム管理システム</h1>
			</div>
			<div class="header-nav1">最終更新 <%=nowtime%></div>
		</div>
		<div class="box-nav">
			<ul>
				<li><a href="us01_03.jsp">＜＜ 従業員ホームへ</a></li>
				<li><a href="us08_04.jsp">売上情報</a></li>
				<li><a href="us09_02.jsp">従業員番号管理</a></li>
			</ul>
		</div>
	</header>
	<main>
		<form method="post" name="form">
			<h2>従業員番号管理</h2>
			<table class="num">
				<caption>
					<h3>従業員一覧</h3>
				</caption>
				<tr class="tr1">
					<th class="th1"></th>
					<th class="th1">従業員番号</th>
					<th>従業員氏名</th>
					<th class="th2">登録日</th>
				</tr>
				<tr class="tr2">
					<th class="th1"></th>
					<th class="th1">従業員<br>番号
					</th>
					<th>従業員氏名</th>
					<th class="th2">登録日</th>
				</tr>
				<%if( wlist != null ){%>
					<%for(Worker w : wlist){%>
					<tr>
						<td><button type="submit" name="button" value="<%=w.getW_id()%>" onClick="JumpJava()">削除</button></td>
						<td><%=w.getW_id()%></td>
						<td><%=w.getW_name()%></td>
						<td><%=w.getW_day()%></td>
					</tr>
					<%}%>
				<%}%>
			</table>
			<table class="num">
				<caption>
					<h3>新規登録欄</h3>
				</caption>
				<tr class="tr1">
					<th class="th2">従業員番号</th>
					<th>従業員氏名</th>
					<th class="th1"></th>
				</tr>
				<tr class="tr2">
					<th class="th2">従業員<br>番号
					</th>
					<th>従業員氏名</th>
					<th class="th1"></th>
				</tr>
				<tr class="tr3">
					<td><input type="text" maxlength="2" id="w_id" name="w_id" onchange="IdJudge()"></td>
					<td><input type="text"id="w_name" name="w_name" onchange="NameJudge()"></td>
					<td><button type="submit" name="button" value="subsc" onClick="JumpJava()">登録</button></td>
				</tr>
			</table>
		</form>
	</main>
	<script>
		window.onload = function(){
			<%if(error != null){%>
				alert("<%=error%>");
			<%}%>
		}
	</script>
	<script src="./js/us09.js" charset="UTF-8"></script>
	<footer> </footer>
</body>

</html>