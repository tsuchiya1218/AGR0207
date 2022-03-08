<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Member"%>
<%@ page import="model.Goods"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang=ja>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>入室</title>
    <link rel="stylesheet" type="text/css" href="./css/RoomRiyou/default.css">
    <link rel="stylesheet" type="text/css" href="./css/RoomRiyou/header.css">
    <link rel="stylesheet" type="text/css" href="./css/RoomRiyou/in.css">
<%
Member m = (Member) session.getAttribute("member");
@SuppressWarnings("unchecked")
ArrayList<Goods> gFDlist = (ArrayList<Goods>) session.getAttribute("goodsFDlist");
%>
<%
ArrayList<String> menu = (ArrayList<String>) session.getAttribute("menu");
String classStr = "null";
if ((String) session.getAttribute("class") != null) {
	classStr = (String) session.getAttribute("class");
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
						href="<%if (classStr.equals("cannot") || menu.get(1).equals("入室中")) {%>#<%} else {%>javascript:JumpJava1002()<%}%>">入室QRコード</a>
					</li>
					<li class="<%if (!menu.get(1).equals("入室中")) {%>li_cannot<%}%>">
						<a
						href="<%if (menu.get(1).equals("入室中")) {%>uc12_02.jsp<%} else {%>#<%}%>">メニュー</a>
					</li>
					<li class="<%if (!menu.get(1).equals("入室中")) {%>li_cannot<%}%>">
						<a
						href="<%if (menu.get(1).equals("入室中")) {%>uc13_02.jsp<%} else {%>#<%}%>">注文履歴</a>
					</li>
					<li class="<%if (!menu.get(1).equals("入室中")) {%>li_cannot<%}%>">
						<a
						href="<%if (menu.get(1).equals("入室中")) {%>javascript:JumpJava1102()<%} else {%>#<%}%>">退室する</a>
					</li>
				</ul>
			</div>
        </div>
    </header>
    <main>
    <form method="post" name="form">
        <div class="idnum">
            ようこそ、　<a href="uc05_02.jsp"><%=m.getM_sei() + m.getM_mei()%></a>　さん
            <button type="button" class="back" onclick="OnButtonClick()">ログアウト</button>
        </div>
        <h2>その他のメニュー</h2>
        <p>ご利用の場合のみ選択してください。</p>
        <p>※ご注文は後からでも可能です。
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
			%>
        		<%int num = 0;
				for (Goods g : gFDlist) {
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
					}
				}
				%>
			<table class="in">
				<caption>その他のメニュー</caption>
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
			</table>
			<script>
			function JumpJava06() {
				document.form.action = "Uc10_06";
				document.form.submit();
			}
			</script>
        <div class="click">
            <button type="button" class="back" onclick="location.href='uc10_04.jsp'">戻る</button>
            <button type="button" class="go" onclick="JumpJava06()">確認画面へ</button>
        </div>
    </form>
    </main>
    <script src="./js/top.js" charset="UTF-8"></script>
    <script src="./js/in10_06.js" charset="UTF-8"></script>
</body>

</html>