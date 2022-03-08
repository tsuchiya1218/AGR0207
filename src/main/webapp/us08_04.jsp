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
<link rel="stylesheet" type="text/css" href="./css/RoomKanri/sales.css">
</head>
<%
Date date = new Date();
SimpleDateFormat hhmm = new SimpleDateFormat("HH:mm");
String s_id = (String)session.getAttribute("s_id");
String nowtime = hhmm.format(date);
%>
<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
SimpleDateFormat yyyy = new SimpleDateFormat("yyyy");
SimpleDateFormat MM = new SimpleDateFormat("MM");
SimpleDateFormat dd = new SimpleDateFormat("dd");
String dateSelect = (String)session.getAttribute("date");
UtilizationDao uDao = new UtilizationDao();
OrdersDao oDao = new OrdersDao();
GoodsDao gDao = new GoodsDao();
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
			<h2>売上情報</h2>
			<!-- 		
			<select onChange="location.href=value;">
				<option value="us08_04.jsp">新宿店</option>
				<option value="us08_04.jsp">池袋店</option>
			</select> の売上を表示
			-->
			<div class="flex">
				<div class="sales">
					<h3 class="today">本日の売り上げ</h3>
					<p>
					<%//本日の売上
					int totalToday = 0;
					totalToday += uDao.priceToday(sdf.format(date));
					ArrayList<Orders> olist = oDao.findTodayOrder(sdf.format(date));
					for( Orders o : olist ){
						int gprice = gDao.goodsPrice(o.getG_id());
						totalToday += (gprice * o.getO_quantity());
					}
					%>
					<%=totalToday%>円
					</p>
				</div>
				<div class="sales">
					<h3 class="daily">
						<input type="date" name="date" value="<%=dateSelect%>"
							min="<%=Integer.parseInt(yyyy.format(date))-2%>-<%=MM.format(date)%>-<%=dd.format(date)%>"
							max="<%=sdf.format(date)%>" onchange="JumpJava()">日の売り上げ
					</h3>
					<%//指定した日の売上
					int totalSelect = 0;
					totalSelect += uDao.priceToday(dateSelect);
					olist = oDao.findTodayOrder(dateSelect);
					for( Orders o : olist ){
						int gprice = gDao.goodsPrice(o.getG_id());
						totalSelect += (gprice * o.getO_quantity());
					}
					%>
					<p><%=totalSelect%>円</p>
				</div>
			</div>
	
			<div class="sales">
				<h3>月間売上</h3>
				<div class="flex">
					<table>
						<tr>
							<th>１月</th>
							<td>
							<%
							int month1 = 0;
							month1 += uDao.priceMonth(yyyy.format(date)+"-01-");
							olist = oDao.findMonthOrder(yyyy.format(date)+"-01-");
							for( Orders o : olist ){
								int gprice = gDao.goodsPrice(o.getG_id());
								month1 += (gprice * o.getO_quantity());
							}
							%>
							<%=month1%>円
							</td>
						</tr>
						<tr>
							<th>２月</th>
							<td>
							<%
							int month2 = 0;
							month2 += uDao.priceMonth(yyyy.format(date)+"-02-");
							olist = oDao.findMonthOrder(yyyy.format(date)+"-02-");
							for( Orders o : olist ){
								int gprice = gDao.goodsPrice(o.getG_id());
								month2 += (gprice * o.getO_quantity());
							}
							%>
							<%=month2%>円
							</td>
						</tr>
						<tr>
							<th>３月</th>
							<td>
							<%
							int month3 = 0;
							month3 += uDao.priceMonth(yyyy.format(date)+"-03-");
							olist = oDao.findMonthOrder(yyyy.format(date)+"-03-");
							for( Orders o : olist ){
								int gprice = gDao.goodsPrice(o.getG_id());
								month3 += (gprice * o.getO_quantity());
							}
							%>
							<%=month3%>円
							</td>
						</tr>
						<tr>
							<th>４月</th>
							<td>
							<%
							int month4 = 0;
							month4 += uDao.priceMonth(yyyy.format(date)+"-04-");
							olist = oDao.findMonthOrder(yyyy.format(date)+"-04-");
							for( Orders o : olist ){
								int gprice = gDao.goodsPrice(o.getG_id());
								month4 += (gprice * o.getO_quantity());
							}
							%>
							<%=month4%>円
							</td>
						</tr>
						<tr>
							<th>５月</th>
							<td>
							<%
							int month5 = 0;
							month5 += uDao.priceMonth(yyyy.format(date)+"-05-");
							olist = oDao.findMonthOrder(yyyy.format(date)+"-05-");
							for( Orders o : olist ){
								int gprice = gDao.goodsPrice(o.getG_id());
								month5 += (gprice * o.getO_quantity());
							}
							%>
							<%=month5%>円
							</td>
						</tr>
						<tr>
							<th>６月</th>
							<td>
							<%
							int month6 = 0;
							month6 += uDao.priceMonth(yyyy.format(date)+"-06-");
							olist = oDao.findMonthOrder(yyyy.format(date)+"-06-");
							for( Orders o : olist ){
								int gprice = gDao.goodsPrice(o.getG_id());
								month6 += (gprice * o.getO_quantity());
							}
							%>
							<%=month6%>円
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<th>７月</th>
							<td>
							<%
							int month7 = 0;
							month7 += uDao.priceMonth(yyyy.format(date)+"-07-");
							olist = oDao.findMonthOrder(yyyy.format(date)+"-07-");
							for( Orders o : olist ){
								int gprice = gDao.goodsPrice(o.getG_id());
								month7 += (gprice * o.getO_quantity());
							}
							%>
							<%=month7%>円
							</td>
						</tr>
						<tr>
							<th>８月</th>
							<td>
							<%
							int month8 = 0;
							month8 += uDao.priceMonth(yyyy.format(date)+"-08-");
							olist = oDao.findMonthOrder(yyyy.format(date)+"-08-");
							for( Orders o : olist ){
								int gprice = gDao.goodsPrice(o.getG_id());
								month8 += (gprice * o.getO_quantity());
							}
							%>
							<%=month8%>円
							</td>
						</tr>
						<tr>
							<th>９月</th>
							<td>
							<%
							int month9 = 0;
							month9 += uDao.priceMonth(yyyy.format(date)+"-09-");
							olist = oDao.findMonthOrder(yyyy.format(date)+"-09-");
							for( Orders o : olist ){
								int gprice = gDao.goodsPrice(o.getG_id());
								month9 += (gprice * o.getO_quantity());
							}
							%>
							<%=month9%>円
							</td>
						</tr>
						<tr>
							<th>１０月</th>
							<td>
							<%
							int month10 = 0;
							month10 += uDao.priceMonth(yyyy.format(date)+"-10-");
							olist = oDao.findMonthOrder(yyyy.format(date)+"-10-");
							for( Orders o : olist ){
								int gprice = gDao.goodsPrice(o.getG_id());
								month10 += (gprice * o.getO_quantity());
							}
							%>
							<%=month10%>円
							</td>
						</tr>
						<tr>
							<th>１１月</th>
							<td>
							<%
							int month11 = 0;
							month11 += uDao.priceMonth(yyyy.format(date)+"-11-");
							olist = oDao.findMonthOrder(yyyy.format(date)+"-11-");
							for( Orders o : olist ){
								int gprice = gDao.goodsPrice(o.getG_id());
								month11 += (gprice * o.getO_quantity());
							}
							%>
							<%=month11%>円
							</td>
						</tr>
						<tr>
							<th>１２月</th>
							<td>
							<%
							int month12 = 0;
							month12 += uDao.priceMonth(yyyy.format(date)+"-12-");
							olist = oDao.findMonthOrder(yyyy.format(date)+"-12-");
							for( Orders o : olist ){
								int gprice = gDao.goodsPrice(o.getG_id());
								month12 += (gprice * o.getO_quantity());
							}
							%>
							<%=month12%>円
							</td>
						</tr>
					</table>
				</div>
			</div>
	
			<div class="sales">
				<h3>年間売上</h3>
				<div class="flex">
					<table>
						<%int year = Integer.parseInt(yyyy.format(date));%>
						<tr>
							<th><%=year%>年</th>
							<td>
							<%
							int totalYear1 = 0;
							totalYear1 += uDao.priceYear(String.valueOf(year));
							olist = oDao.findYearOrder(String.valueOf(year));
							for( Orders o : olist ){
								int gprice = gDao.goodsPrice(o.getG_id());
								totalYear1 += (gprice * o.getO_quantity());
							}
							%>
							<%=totalYear1%>円
							</td>
						</tr>
						<tr>
							<th><%=year-1%>年</th>
							<td>
							<%
							int totalYear2 = 0;
							totalYear2 += uDao.priceYear(String.valueOf(year-1));
							olist = oDao.findYearOrder(String.valueOf(year-1));
							for( Orders o : olist ){
								int gprice = gDao.goodsPrice(o.getG_id());
								totalYear2 += (gprice * o.getO_quantity());
							}
							%>
							<%=totalYear2%>円
							</td>
						</tr>
						<tr>
							<th><%=year-2%>年</th>
							<td>
							<%
							int totalYear3 = 0;
							totalYear3 += uDao.priceYear(String.valueOf(year-2));
							olist = oDao.findYearOrder(String.valueOf(year-2));
							for( Orders o : olist ){
								int gprice = gDao.goodsPrice(o.getG_id());
								totalYear3 += (gprice * o.getO_quantity());
							}
							%>
							<%=totalYear3%>円
							</td>
						</tr>
						<tr>
							<th><%=year-3%>年</th>
							<td>
							<%
							int totalYear4 = 0;
							totalYear4 += uDao.priceYear(String.valueOf(year-3));
							olist = oDao.findYearOrder(String.valueOf(year-3));
							for( Orders o : olist ){
								int gprice = gDao.goodsPrice(o.getG_id());
								totalYear4 += (gprice * o.getO_quantity());
							}
							%>
							<%=totalYear4%>円
							</td>
						</tr>
						<tr>
							<th><%=year-4%>年</th>
							<td>
							<%
							int totalYear5 = 0;
							totalYear5 += uDao.priceYear(String.valueOf(year-4));
							olist = oDao.findYearOrder(String.valueOf(year-4));
							for( Orders o : olist ){
								int gprice = gDao.goodsPrice(o.getG_id());
								totalYear5 += (gprice * o.getO_quantity());
							}
							%>
							<%=totalYear5%>円
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<th><%=year-5%>年</th>
							<td>
							<%
							int totalYear6 = 0;
							totalYear6 += uDao.priceYear(String.valueOf(year-5));
							olist = oDao.findYearOrder(String.valueOf(year-5));
							for( Orders o : olist ){
								int gprice = gDao.goodsPrice(o.getG_id());
								totalYear6 += (gprice * o.getO_quantity());
							}
							%>
							<%=totalYear6%>円
							</td>
						</tr>
						<tr>
							<th><%=year-6%>年</th>
							<td>
							<%
							int totalYear7 = 0;
							totalYear7 += uDao.priceYear(String.valueOf(year-6));
							olist = oDao.findYearOrder(String.valueOf(year-6));
							for( Orders o : olist ){
								int gprice = gDao.goodsPrice(o.getG_id());
								totalYear7 += (gprice * o.getO_quantity());
							}
							%>
							<%=totalYear7%>円
							</td>
						</tr>
						<tr>
							<th><%=year-7%>年</th>
							<td>
							<%
							int totalYear8 = 0;
							totalYear8 += uDao.priceYear(String.valueOf(year-7));
							olist = oDao.findYearOrder(String.valueOf(year-7));
							for( Orders o : olist ){
								int gprice = gDao.goodsPrice(o.getG_id());
								totalYear8 += (gprice * o.getO_quantity());
							}
							%>
							<%=totalYear8%>円
							</td>
						</tr>
						<tr>
							<th><%=year-8%>年</th>
							<td>
							<%
							int totalYear9 = 0;
							totalYear9 += uDao.priceYear(String.valueOf(year-8));
							olist = oDao.findYearOrder(String.valueOf(year-8));
							for( Orders o : olist ){
								int gprice = gDao.goodsPrice(o.getG_id());
								totalYear9 += (gprice * o.getO_quantity());
							}
							%>
							<%=totalYear9%>円
							</td>
						</tr>
						<tr>
							<th><%=year-9%>年</th>
							<td>
							<%
							int totalYear10 = 0;
							totalYear10 += uDao.priceYear(String.valueOf(year-9));
							olist = oDao.findYearOrder(String.valueOf(year-9));
							for( Orders o : olist ){
								int gprice = gDao.goodsPrice(o.getG_id());
								totalYear10 += (gprice * o.getO_quantity());
							}
							%>
							<%=totalYear10%>円
							</td>
						</tr>
					</table>
				</div>
			</div>
		</form>
	</main>
	<script>
		function JumpJava(){
			document.form.action = "Us08_04";
			document.form.submit();
		}
	</script>
	<footer> </footer>
</body>

</html>