<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.*"%>
<%@ page import="dao.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang=ja>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>注文履歴</title>
    <link rel="stylesheet" type="text/css" href="./css/RoomRiyou/default.css">
    <link rel="stylesheet" type="text/css" href="./css/RoomRiyou/header.css">
    <link rel="stylesheet" type="text/css" href="./css/RoomRiyou/register.css">
 	<%
	Member m = (Member) session.getAttribute("member");
 	String u_id = (String)session.getAttribute("u_id");
 	OrdersDao oDao = new OrdersDao();
 	GoodsDao gDao = new GoodsDao();
 	%>
<%
ArrayList<String> menu = (ArrayList<String>)session.getAttribute("menu");
String classStr = "null";
if((String)session.getAttribute("class") != null){
	classStr = (String)session.getAttribute("class");
}
%>
</head>
<%
ArrayList<Orders> olist = null;
olist = oDao.findOrders(u_id);
SimpleDateFormat HHmm = new SimpleDateFormat("HH:mm");
%>
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
        <h2>注文履歴</h2>
        <table class="table3">
            <tr>
                <th>注文時刻</th>
                <th>商品名</th>
                <th>個数</th>
                <th></th>
            </tr>
            <%
            int totalPrice = 0;
            for(Orders o : olist){
            	String g_name = gDao.findName(o.getG_id());
            	int price = gDao.findPrice(o.getG_id());
            	totalPrice += price * o.getO_quantity();
            %>
            <tr>
                <td><%=HHmm.format(o.getO_time())%></td>
                <td><%=g_name%></td>
                <td><%=o.getO_quantity()%></td>
                <td><%=o.getO_situation()%></td>
            </tr>
            <%}%>
            <tr>
                <td colspan="4">合計金額　<%=totalPrice%>円</td>
            </tr>
        </table>
    </main>
    <script src="./js/top.js" charset="UTF-8"></script>
</body>

</html>