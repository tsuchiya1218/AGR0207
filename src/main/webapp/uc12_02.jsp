<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Member"%>
<%@ page import="model.Goods"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang=ja>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<title>注文</title>
<link rel="stylesheet" type="text/css"
	href="./css/RoomRiyou/default.css">
<link rel="stylesheet" type="text/css" href="./css/RoomRiyou/header.css">
<link rel="stylesheet" type="text/css" href="./css/RoomRiyou/in.css">
<script src="./js/uc12jump.js" charset="UTF-8"></script>
<%
Member m = (Member) session.getAttribute("member");
@SuppressWarnings("unchecked")
ArrayList<Goods> gSDlist = (ArrayList<Goods>) session.getAttribute("goodsSDlist");
@SuppressWarnings("unchecked")
ArrayList<Goods> gAClist = (ArrayList<Goods>) session.getAttribute("goodsAClist");
@SuppressWarnings("unchecked")
ArrayList<Goods> gFDlist = (ArrayList<Goods>) session.getAttribute("goodsFDlist");
%>
<%
ArrayList<String> menu = (ArrayList<String>)session.getAttribute("menu");
try{
	menu.get(1);
}catch(Exception e){
	menu.add("null");
	menu.add("null");
	session.setAttribute("menu",menu);
}
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
			<h2>メニュー</h2>

			<table class="in">
				<caption>ソフトドリンク</caption>
				<%
				String name1 = "";
				String imgName1 = "";
				int price1 = 0;

				String name2 = "";
				String imgName2 = "";
				int price2 = 0;

				String name3 = "";
				String imgName3 = "";
				int price3 = 0;

				String name4 = "";
				String imgName4 = "";
				int price4 = 0;

				String name5 = "";
				String imgName5 = "";
				int price5 = 0;

				String name6 = "";
				String imgName6 = "";
				int price6 = 0;

				String name7 = "";
				String imgName7 = "";
				int price7 = 0;

				String name8 = "";
				String imgName8 = "";
				int price8 = 0;

				String name9 = "";
				String imgName9 = "";
				int price9 = 0;

				String name10 = "";
				String imgName10 = "";
				int price10 = 0;

				String name11 = "";
				String imgName11 = "";
				int price11 = 0;

				String name12 = "";
				String imgName12 = "";
				int price12 = 0;

				String name13 = "";
				String imgName13 = "";
				int price13 = 0;

				String name14 = "";
				String imgName14 = "";
				int price14 = 0;

				String name15 = "";
				String imgName15 = "";
				int price15 = 0;

				String name16 = "";
				String imgName16 = "";
				int price16 = 0;

				String name17 = "";
				String imgName17 = "";
				int price17 = 0;

				String name18 = "";
				String imgName18 = "";
				int price18 = 0;

				String name19 = "";
				String imgName19 = "";
				int price19 = 0;

				String name20 = "";
				String imgName20 = "";
				int price20 = 0;

				String name21 = "";
				String imgName21 = "";
				int price21 = 0;

				String name22 = "";
				String imgName22 = "";
				int price22 = 0;

				String name23 = "";
				String imgName23 = "";
				int price23 = 0;

				String name24 = "";
				String imgName24 = "";
				int price24 = 0;

				String name25 = "";
				String imgName25 = "";
				int price25 = 0;

				String name26 = "";
				String imgName26 = "";
				int price26 = 0;

				String name27 = "";
				String imgName27 = "";
				int price27 = 0;

				String name28 = "";
				String imgName28 = "";
				int price28 = 0;

				String name29 = "";
				String imgName29 = "";
				int price29 = 0;
				%>
				<%
				int num = 0;
				for (Goods g : gSDlist) {
					String g_name = g.getG_name();
					String g_imgName = g.getG_imgName();
					int g_price = g.getG_price();
					num++;
					switch (num) {
					case 1:
						name1 = g_name;
						imgName1 = g_imgName;
						price1 = g_price;
						break;
					case 2:
						name2 = g_name;
						imgName2 = g_imgName;
						price2 = g_price;
						break;
					case 3:
						name3 = g_name;
						imgName3 = g_imgName;
						price3 = g_price;
						break;
					case 4:
						name4 = g_name;
						imgName4 = g_imgName;
						price4 = g_price;
						break;
					case 5:
						name5 = g_name;
						imgName5 = g_imgName;
						price5 = g_price;
						break;
					case 6:
						name6 = g_name;
						imgName6 = g_imgName;
						price6 = g_price;
						break;
					case 7:
						name7 = g_name;
						imgName7 = g_imgName;
						price7 = g_price;
						break;
					case 8:
						name8 = g_name;
						imgName8 = g_imgName;
						price8 = g_price;
						break;
					case 9:
						name9 = g_name;
						imgName9 = g_imgName;
						price9 = g_price;
						break;
					case 10:
						name10 = g_name;
						imgName10 = g_imgName;
						price10 = g_price;
						break;
					case 11:
						name11 = g_name;
						imgName11 = g_imgName;
						price11 = g_price;
						break;
					case 12:
						name12 = g_name;
						imgName12 = g_imgName;
						price12 = g_price;
						break;
					}
				}
				num = 0;
				for (Goods g : gAClist) {
					String g_name = g.getG_name();
					String g_imgName = g.getG_imgName();
					int g_price = g.getG_price();
					num++;
					switch (num) {
					case 1:
						name13 = g_name;
						imgName13 = g_imgName;
						price13 = g_price;
						break;
					case 2:
						name14 = g_name;
						imgName14 = g_imgName;
						price14 = g_price;
						break;
					case 3:
						name15 = g_name;
						imgName15 = g_imgName;
						price15 = g_price;
						break;
					case 4:
						name16 = g_name;
						imgName16 = g_imgName;
						price16 = g_price;
						break;
					case 5:
						name17 = g_name;
						imgName17 = g_imgName;
						price17 = g_price;
						break;
					case 6:
						name18 = g_name;
						imgName18 = g_imgName;
						price18 = g_price;
						break;
					case 7:
						name19 = g_name;
						imgName19 = g_imgName;
						price19 = g_price;
						break;
					}
				}
				num = 0;
				for (Goods g : gFDlist) {
					String g_name = g.getG_name();
					String g_imgName = g.getG_imgName();
					int g_price = g.getG_price();
					num++;
					switch (num) {
					case 1:
						name20 = g_name;
						imgName20 = g_imgName;
						price20 = g_price;
						break;
					case 2:
						name21 = g_name;
						imgName21 = g_imgName;
						price21 = g_price;
						break;
					case 3:
						name22 = g_name;
						imgName22 = g_imgName;
						price22 = g_price;
						break;
					case 4:
						name23 = g_name;
						imgName23 = g_imgName;
						price23 = g_price;
						break;
					case 5:
						name24 = g_name;
						imgName24 = g_imgName;
						price24 = g_price;
						break;
					case 6:
						name25 = g_name;
						imgName25 = g_imgName;
						price25 = g_price;
						break;
					case 7:
						name26 = g_name;
						imgName26 = g_imgName;
						price26 = g_price;
						break;
					case 8:
						name27 = g_name;
						imgName27 = g_imgName;
						price27 = g_price;
						break;
					case 9:
						name28 = g_name;
						imgName28 = g_imgName;
						price28 = g_price;
						break;
					case 10:
						name29 = g_name;
						imgName29 = g_imgName;
						price29 = g_price;
						break;
					}
				}
				%>
				<tr>
					<th><img src="./img/<%=imgName1%>" alt="<%=name1%>"></th>
					<th><img src="./img/<%=imgName2%>" alt="<%=name2%>"></th>
				</tr>
				<tr class="price">
					<td><%=name1%><br><%=price1%>円</td>
					<td><%=name2%><br><%=price2%>円</td>
				</tr>
				<tr class="count">
					<td>
						<button type="button" onclick="subOne('menu_1');chgNumBack('menu_1')">－</button>
						<input type="text" id="counter1" name="counter1" value="0">点
						<button type="button" onclick="addOne('menu_1');chgNumBack('menu_1')">＋</button>
					</td>
					<td>
						<button type="button" onclick="subOne('menu_2');chgNumBack('menu_2')">－</button>
						<input type="text" id="counter2" name="counter2" value="0">点
						<button type="button" onclick="addOne('menu_2');chgNumBack('menu_2')">＋</button>
					</td>
				</tr>
				<tr class="space"></tr>
				<tr>
					<th><img src="./img/<%=imgName3%>" alt="<%=name3%>"></th>
					<th><img src="./img/<%=imgName4%>" alt="<%=name4%>"></th>
				</tr>
				<tr class="price">
					<td><%=name3%><br><%=price3%>円</td>
					<td><%=name4%><br><%=price4%>円</td>
				</tr>
				<tr class="count">
					<td>
						<button type="button" onclick="subOne('menu_3');chgNumBack('menu_3')">－</button>
						<input type="text" id="counter3" name="counter3" value="0">点
						<button type="button" onclick="addOne('menu_3');chgNumBack('menu_3')">＋</button>
					</td>
					<td>
						<button type="button" onclick="subOne('menu_4');chgNumBack('menu_4')">－</button>
						<input type="text" id="counter4" name="counter4" value="0">点
						<button type="button" onclick="addOne('menu_4');chgNumBack('menu_4')">＋</button>
					</td>
				</tr>
				<tr class="space"></tr>
				<tr>
					<th><img src="./img/<%=imgName5%>" alt="<%=name5%>"></th>
					<th><img src="./img/<%=imgName6%>" alt="<%=name6%>"></th>
				</tr>
				<tr class="price">
					<td><%=name5%><br><%=price5%>円</td>
					<td><%=name6%><br><%=price6%>円</td>
				</tr>
				<tr class="count">
					<td>
						<button type="button" onclick="subOne('menu_5');chgNumBack('menu_5')">－</button>
						<input type="text" id="counter5" name="counter5" value="0">点
						<button type="button" onclick="addOne('menu_5');chgNumBack('menu_5')">＋</button>
					</td>
					<td>
						<button type="button" onclick="subOne('menu_6');chgNumBack('menu_6')">－</button>
						<input type="text" id="counter6" name="counter6" value="0">点
						<button type="button" onclick="addOne('menu_6');chgNumBack('menu_6')">＋</button>
					</td>
				</tr>
				<tr class="space"></tr>
				<tr>
					<th><img src="./img/<%=imgName7%>" alt="<%=name7%>"></th>
					<th><img src="./img/<%=imgName8%>" alt="<%=name8%>"></th>
				</tr>
				<tr class="price">
					<td><%=name7%><br><%=price7%>円</td>
					<td><%=name8%><br><%=price8%>円</td>
				</tr>
				<tr class="count">
					<td>
						<button type="button" onclick="subOne('menu_7');chgNumBack('menu_7')">－</button>
						<input type="text" id="counter7" name="counter7" value="0">点
						<button type="button" onclick="addOne('menu_7');chgNumBack('menu_7')">＋</button>
					</td>
					<td>
						<button type="button" onclick="subOne('menu_8');chgNumBack('menu_8')">－</button>
						<input type="text" id="counter8" name="counter8" value="0">点
						<button type="button" onclick="addOne('menu_8');chgNumBack('menu_8')">＋</button>
					</td>
				</tr>
				<tr class="space"></tr>
				<tr>
					<th><img src="./img/<%=imgName9%>" alt="<%=name9%>"></th>
					<th><img src="./img/<%=imgName10%>" alt="<%=name10%>"></th>
				</tr>
				<tr class="price">
					<td><%=name9%><br><%=price9%>円</td>
					<td><%=name10%><br><%=price10%>円</td>
				</tr>
				<tr class="count">
					<td>
						<button type="button" onclick="subOne('menu_9');chgNumBack('menu_9')">－</button>
						<input type="text" id="counter9" name="counter9" value="0">点
						<button type="button" onclick="addOne('menu_9');chgNumBack('menu_9')">＋</button>
					</td>
					<td>
						<button type="button" onclick="subOne('menu_10');chgNumBack('menu_10')">－</button>
						<input type="text" id="counter10" name="counter10" value="0">点
						<button type="button" onclick="addOne('menu_10');chgNumBack('menu_10')">＋</button>
					</td>
				</tr>
				<tr class="space"></tr>
				<tr>
					<th><img src="./img/<%=imgName11%>" alt="<%=name11%>"></th>
					<th><img src="./img/<%=imgName12%>" alt="<%=name12%>"></th>
				</tr>
				<tr class="price">
					<td><%=name11%><br><%=price11%>円</td>
					<td><%=name12%><br><%=price12%>円</td>
				</tr>
				<tr class="count">
					<td>
						<button type="button" onclick="subOne('menu_11');chgNumBack('menu_11')">－</button>
						<input type="text" id="counter11" name="counter11" value="0">点
						<button type="button" onclick="addOne('menu_11');chgNumBack('menu_11')">＋</button>
					</td>
					<td>
						<button type="button" onclick="subOne('menu_12');chgNumBack('menu_12')">－</button>
						<input type="text" id="counter12" name="counter12" value="0">点
						<button type="button" onclick="addOne('menu_12');chgNumBack('menu_12')">＋</button>
					</td>
				</tr>
			</table>
			<table class="in">
				<caption>アルコール</caption>
				<tr>
					<th><img src="./img/<%=imgName13%>" alt="<%=name13%>"></th>
					<th><img src="./img/<%=imgName14%>" alt="<%=name14%>"></th>
				</tr>
				<tr class="price">
					<td><%=name13%><br><%=price13%>円</td>
					<td><%=name14%><br><%=price14%>円</td>
				</tr>
				<tr class="count">
					<td>
						<button type="button" onclick="subOne('menu_13');chgNumBack('menu_13')">－</button>
						<input type="text" id="counter13" name="counter13" value="0">点
						<button type="button" onclick="addOne('menu_13');chgNumBack('menu_13')">＋</button>
					</td>
					<td>
						<button type="button" onclick="subOne('menu_14');chgNumBack('menu_14')">－</button>
						<input type="text" id="counter14" name="counter14" value="0">点
						<button type="button" onclick="addOne('menu_14');chgNumBack('menu_14')">＋</button>
					</td>
				</tr>
				<tr class="space"></tr>
				<tr>
					<th><img src="./img/<%=imgName15%>" alt="<%=name15%>"></th>
					<th><img src="./img/<%=imgName16%>" alt="<%=name16%>"></th>
				</tr>
				<tr class="price">
					<td><%=name15%><br><%=price15%>円</td>
					<td><%=name16%><br><%=price16%>円</td>
				</tr>
				<tr class="count">
					<td>
						<button type="button" onclick="subOne('menu_15');chgNumBack('menu_15')">－</button>
						<input type="text" id="counter15" name="counter15" value="0">点
						<button type="button" onclick="addOne('menu_15');chgNumBack('menu_15')">＋</button>
					</td>
					<td>
						<button type="button" onclick="subOne('menu_16');chgNumBack('menu_16')">－</button>
						<input type="text" id="counter16" name="counter16" value="0">点
						<button type="button" onclick="addOne('menu_16');chgNumBack('menu_16')">＋</button>
					</td>
				</tr>
				<tr class="space"></tr>
				<tr>
					<th><img src="./img/<%=imgName17%>" alt="<%=name17%>"></th>
					<th><img src="./img/<%=imgName18%>" alt="<%=name18%>"></th>
				</tr>
				<tr class="price">
					<td><%=name17%><br><%=price17%>円</td>
					<td><%=name18%><br><%=price18%>円</td>
				</tr>
				<tr class="count">
					<td>
						<button type="button" onclick="subOne('menu_17');chgNumBack('menu_17')">－</button>
						<input type="text" id="counter17" name="counter17" value="0">点
						<button type="button" onclick="addOne('menu_17');chgNumBack('menu_17')">＋</button>
					</td>
					<td>
						<button type="button" onclick="subOne('menu_18');chgNumBack('menu_18')">－</button>
						<input type="text" id="counter18" name="counter18" value="0">点
						<button type="button" onclick="addOne('menu_18');chgNumBack('menu_18')">＋</button>
					</td>
				</tr>
				<tr class="space"></tr>
				<tr>
					<th><img src="./img/<%=imgName19%>" alt="<%=name19%>"></th>
				</tr>
				<tr class="price">
					<td><%=name19%><br><%=price19%>円</td>
				</tr>
				<tr class="count">
					<td>
						<button type="button" onclick="subOne('menu_19');chgNumBack('menu_19')">－</button>
						<input type="text" id="counter19" name="counter19" value="0">点
						<button type="button" onclick="addOne('menu_19');chgNumBack('menu_19')">＋</button>
					</td>
				</tr>
			</table>
			<table class="in">
				<caption>フード</caption>
				<tr>
					<th><img src="./img/<%=imgName20%>" alt="<%=name20%>"></th>
					<th><img src="./img/<%=imgName21%>" alt="<%=name21%>"></th>
				</tr>
				<tr class="price">
					<td><%=name20%><br><%=price20%>円</td>
					<td><%=name21%><br><%=price21%>円</td>
				</tr>
				<tr class="count">
					<td>
						<button type="button" onclick="subOne('menu_20');chgNumBack('menu_20')">－</button>
						<input type="text" id="counter20" name="counter20" value="0">点
						<button type="button" onclick="addOne('menu_20');chgNumBack('menu_20')">＋</button>
					</td>
					<td>
						<button type="button" onclick="subOne('menu_21');chgNumBack('menu_21')">－</button>
						<input type="text" id="counter21" name="counter21" value="0">点
						<button type="button" onclick="addOne('menu_21');chgNumBack('menu_21')">＋</button>
					</td>
				</tr>
				<tr class="space"></tr>
				<tr>
					<th><img src="./img/<%=imgName22%>" alt="<%=name22%>"></th>
					<th><img src="./img/<%=imgName23%>" alt="<%=name23%>"></th>
				</tr>
				<tr class="price">
					<td><%=name22%><br><%=price22%>円</td>
					<td><%=name23%><br><%=price23%>円</td>
				</tr>
				<tr class="count">
					<td>
						<button type="button" onclick="subOne('menu_22');chgNumBack('menu_22')">－</button>
						<input type="text" id="counter22" name="counter22" value="0">点
						<button type="button" onclick="addOne('menu_22');chgNumBack('menu_22')">＋</button>
					</td>
					<td>
						<button type="button" onclick="subOne('menu_23');chgNumBack('menu_23')">－</button>
						<input type="text" id="counter23" name="counter23" value="0">点
						<button type="button" onclick="addOne('menu_23');chgNumBack('menu_23')">＋</button>
					</td>
				</tr>
				<tr class="space"></tr>
				<tr>
					<th><img src="./img/<%=imgName24%>" alt="<%=name24%>"></th>
					<th><img src="./img/<%=imgName25%>" alt="<%=name25%>"></th>
				</tr>
				<tr class="price">
					<td><%=name24%><br><%=price24%>円</td>
					<td><%=name25%><br><%=price25%>円</td>
				</tr>
				<tr class="count">
					<td>
						<button type="button" onclick="subOne('menu_24');chgNumBack('menu_24')">－</button>
						<input type="text" id="counter24" name="counter24" value="0">点
						<button type="button" onclick="addOne('menu_24');chgNumBack('menu_24')">＋</button>
					</td>
					<td>
						<button type="button" onclick="subOne('menu_25');chgNumBack('menu_25')">－</button>
						<input type="text" id="counter25" name="counter25" value="0">点
						<button type="button" onclick="addOne('menu_25');chgNumBack('menu_25')">＋</button>
					</td>
				</tr>
				<tr class="space"></tr>
				<tr>
					<th><img src="./img/<%=imgName26%>" alt="<%=name26%>"></th>
					<th><img src="./img/<%=imgName27%>" alt="<%=name27%>"></th>
				</tr>
				<tr class="price">
					<td><%=name26%><br><%=price26%>円</td>
					<td><%=name27%><br><%=price27%>円</td>
				</tr>
				<tr class="count">
					<td>
						<button type="button" onclick="subOne('menu_26');chgNumBack('menu_26')">－</button>
						<input type="text" id="counter26" name="counter26" value="0">点
						<button type="button" onclick="addOne('menu_26');chgNumBack('menu_26')">＋</button>
					</td>
					<td>
						<button type="button" onclick="subOne('menu_27');chgNumBack('menu_27')">－</button>
						<input type="text" id="counter27" name="counter27" value="0">点
						<button type="button" onclick="addOne('menu_27');chgNumBack('menu_27')">＋</button>
					</td>
				</tr>
				<tr class="space"></tr>
				<tr>
					<th><img src="./img/<%=imgName28%>" alt="<%=name28%>"></th>
					<th><img src="./img/<%=imgName29%>" alt="<%=name29%>"></th>
				</tr>
				<tr class="price">
					<td><%=name28%><br><%=price28%>円</td>
					<td><%=name29%><br><%=price29%>円</td>
				</tr>
				<tr class="count">
					<td>
						<button type="button" onclick="subOne('menu_28');chgNumBack('menu_28')">－</button>
						<input type="text" id="counter28" name="counter28" value="0">点
						<button type="button" onclick="addOne('menu_28');chgNumBack('menu_28')">＋</button>
					</td>
					<td>
						<button type="button" onclick="subOne('menu_29');chgNumBack('menu_29')">－</button>
						<input type="text" id="counter29" name="counter29" value="0">点
						<button type="button" onclick="addOne('menu_29');chgNumBack('menu_29')">＋</button>
					</td>
				</tr>
			</table>
			<script>
			function JumpJava02() {
				var count = 0;
				<%
				String s = "counter";
				for(int i = 1 ; i <= 29 ; i++ ){
					s = s + String.valueOf(i);%>
					counter = document.form.<%=s%>.value;
					if(counter >= 1){
						document.form.action = "Uc12_02";
						document.form.submit();
					}else{
						count++;
					}
					if(count == 29){
						alert("購入したい商品を選択してください。");
					}
				<%s = "counter";
				}
				%>
			}
			</script>
			<div class="click">
				<button type="button" class="go" onclick="JumpJava02()">確認画面へ</button>
			</div>
		</form>
	</main>
	<script src="./js/top.js" charset="UTF-8"></script>
	<script src="./js/in.js" charset="UTF-8"></script>
</body>

</html>