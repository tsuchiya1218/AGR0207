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
<link rel="stylesheet" type="text/css" href="./css/RoomKanri/cus.css">
</head>
<%
Date date = new Date();
SimpleDateFormat hhmm = new SimpleDateFormat("HH:mm");
String s_id = (String) session.getAttribute("s_id");
String nowtime = hhmm.format(date);
%>
<%
SimpleDateFormat MMdd = new SimpleDateFormat("MM/dd");
String search = (String)session.getAttribute("search");
MemberDao mDao = new MemberDao();
StoreDao sDao =new StoreDao();
UtilizationDao uDao = new UtilizationDao();
ArrayList<Member> mlist = null;
//ID判別(数字判別)
int searchId = 0;
try{
	searchId = Integer.parseInt(search);
}catch(Exception e){
	searchId = -1;
}
//searchが数字じゃなかったら
if(searchId == -1 && search != ""){
	mlist = mDao.searchMember(search);
//数字だったら
}else{
	mlist = mDao.searchMember(searchId);
}
//mlistの中身チェック
try{
	mlist.get(0);
}catch(Exception e){
	mlist = null;
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
		<h2>会員情報</h2>
		<h3>"<%=search%>"で検索</h3>
		<div class="scroll">
			<table class="cus">
				<tr>
					<th class="size1">会員ID</th>
					<th class="size2">会員氏名</th>
					<th class="size3">年齢</th>
					<th class="size4">来店履歴</th>
				</tr>
				<%if( mlist != null ){%>
					<%for( Member m : mlist ){%>
						<tr class="tr1">
							<td><%=m.getM_id()%></td>
							<td><%=m.getM_sei()+m.getM_mei()%></td>
							<td>
							<%
							//年齢計算
							Calendar now = Calendar.getInstance();
							Calendar birth = Calendar.getInstance();
							now.setTime(date);
							birth.setTime(m.getM_birthday());
							int age = now.get(Calendar.YEAR) - birth.get(Calendar.YEAR);
							if (now.get(Calendar.MONTH) < birth.get(Calendar.MONTH)) {
								age -= 1;
							}else if (now.get(Calendar.MONTH) == birth.get(Calendar.MONTH)) {
								if (now.get(Calendar.DATE) < birth.get(Calendar.DATE)) {
									age -= 1;
								}
							}%>
							<%=age%>歳
							</td>
							<td class="td1">
							<%--来店履歴チェック--%>
								<%
								ArrayList<Utilization> ulist = uDao.searchMember(m.getM_id());
								try{ulist.get(0);
								}catch(Exception e){ulist = null;}
								if( ulist != null ){
									for( Utilization u : ulist ){%>
										<%=MMdd.format(u.getU_enterDay())%> 
										<%=sDao.findStoreName(u.getS_id())%> 
										<%=u.getR_id()%>ルーム
										<br>
									<%}%>
								<%}%>
							</td>
						</tr>
					<%}%>
				<%}%>
			</table>
		</div>

	</main>
	<footer> </footer>
</body>

</html>