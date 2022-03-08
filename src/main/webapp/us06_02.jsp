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
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>カラオケわっしょい</title>
    <link rel="stylesheet" type="text/css" href="./css/RoomKanri/default.css">
    <link rel="stylesheet" type="text/css" href="./css/RoomKanri/header.css">
    <link rel="stylesheet" type="text/css" href="./css/RoomKanri/clean.css">
</head>
<%
Date date = new Date();
SimpleDateFormat hhmm = new SimpleDateFormat("HH:mm");
String s_id = (String)session.getAttribute("s_id");
String nowtime = hhmm.format(date);
%>
<%
RoomDao rDao = new RoomDao();
WorkerDao wDao = new WorkerDao();
ArrayList<Room> rlist = rDao.findClean();
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
            <div class="header-nav1">
                最終更新　<%=nowtime%>
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
	        <h2>清掃ルーム一覧</h2>
	        <table class="clean">
	            <tr class="tr1">
	                <th>清掃状況</th>
	                <th>ルーム番号</th>
	                <th>従業員番号入力欄</th>
	                <th></th>
	            </tr>
	            <tr class="tr2">
	                <th>清掃<br>状況</th>
	                <th>ルーム<br>番号</th>
	                <th>従業員番号<br>入力欄</th>
	                <th></th>
	            </tr>
	            <%for( Room r : rlist ){%>
	            <tr>
	                <td>
	                	<%if(r.getR_clean().equals("未清掃")){%>待ち
	                	<%}else{%>清掃中<%}%>
	                </td>
	                <td><%=r.getR_id()%></td>
	                <td>
	                    <%if(r.getR_clean().equals("未清掃")||r.getW_id()==null){%><input type="text" name="w_id">
	                    <button type="submit" name="r_id" value="<%=r.getR_id()%>" onClick="JumpJava()">確定</button>
	                    <%}else if(r.getR_clean().equals("清掃中")){%><%=wDao.findName(r.getW_id())%><%}%>
	                </td>
	                <td>
	                	<%if(r.getR_clean().equals("清掃中")){%>
	                	<button type="submit" name="finR_id" value="<%=r.getR_id()%>" onClick="JumpJava()">完了</button><%}%>
	                </td>
	            </tr>
				<%}%>
	        </table>
		</form>
    </main>
    <script>
		function JumpJava(){
			document.form.action = "Us06";
			document.form.submit();
		}
	</script>
    <footer>
    </footer>
</body>
</html>