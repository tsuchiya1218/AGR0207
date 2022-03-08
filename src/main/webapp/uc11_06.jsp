<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Member"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang=ja>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>退室</title>
    <link rel="stylesheet" type="text/css" href="./css/RoomRiyou/default.css">
    <link rel="stylesheet" type="text/css" href="./css/RoomRiyou/header.css">
    <link rel="stylesheet" type="text/css" href="./css/RoomRiyou/register.css">
    <%
	Member m = (Member) session.getAttribute("member");
    String cash = (String)session.getAttribute("cash");
    int total = (Integer)session.getAttribute("total");
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
            <input type="checkbox" id="menu-btn-check">
            <label for="menu-btn-check" class="menu-btn"><span></span></label>
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
            ようこそ、　<a href="uc05_02.jsp"><%=m.getM_sei() + m.getM_mei()%></a>　さん
            <button type="button" class="back" onclick="OnButtonClick()">ログアウト</button>
        </div>
        <h2>注文・延長決済確認</h2>
        <p>お間違いなければ、決済ボタンを押してください。</p>
        <form method="post" name="form" action="">
            <table class="table2">
                <tr>
                    <th>退室時決済金額</th>
                    <td><%=total%>円</td>
                </tr>
                <tr>
                    <th>決済方法</th>
                    <td><%=cash%></td>
                </tr>
            </table>
        <script>
        function JumpJava06(){
        	document.form.action = "Uc11_06";
        	document.form.submit();
        }
        </script>
        <div class="click">
            <button type="button" class="back" onclick="location.href='uc11_04.jsp'">戻る</button>
            <button type="button" class="go" onclick="JumpJava06()">決済</button>
        </div>
        </form>
    </main>
    <script src="./js/top.js" charset="UTF-8"></script>
</body>

</html>