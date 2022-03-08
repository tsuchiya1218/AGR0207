<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Member"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang=ja>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>会員情報編集</title>
    <link rel="stylesheet" type="text/css" href="./css/RoomRiyou/default.css">
    <link rel="stylesheet" type="text/css" href="./css/RoomRiyou/header.css">
    <link rel="stylesheet" type="text/css" href="./css/RoomRiyou/register.css">
	<%Member m = (Member) session.getAttribute("member");%>
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
            ようこそ、　<a href="uc05_02.jsp"><%=m.getM_sei() + m.getM_mei() %></a>　さん
            <button type="button" class="back" onclick="OnButtonClick()">ログアウト</button>
        </div>
        <h2>新規クレジットカード登録</h2>
        <p>登録したいクレジットカードの情報を入力してください。</p>
        <form method="post" name="form" action="">
            <table class="table2">
                <tr>
                    <th>カード番号</th>
                    <td><input type="text" id="cardNum" name="cardNum" onChange="checkCardNum()"></td>
                </tr>
                <tr>
                    <th>有効期限</th>
                    <td>
                        <select name="cardMonth">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                            <option>7</option>
                            <option>8</option>
                            <option>9</option>
                            <option>10</option>
                            <option>11</option>
                            <option>12</option>
                        </select>
                        /
                        <select name="cardYear">
                            <option>2021</option>
                            <option>2022</option>
                            <option>2023</option>
                            <option>2024</option>
                            <option>2025</option>
                            <option>2026</option>
                            <option>2027</option>
                            <option>2028</option>
                            <option>2029</option>
                            <option>2030</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>カード名義人</th>
                    <td><input type="text" name="cardName"></td>
                </tr>
                <tr>
                    <th>セキュリティコード</th>
                    <td><input type="text" name="cardCord" maxlength="3"></td>
                </tr>
            </table>
            <div class="click">
                <button type="button" class="back" onclick="location.href='uc05_04.jsp'">戻る</button>
                <button type="button" class="go" onclick="JumpJava()">追加</button>
            </div>
        </form>
    </main>
    <script>
    	function JumpJava(){
    		txt1 = document.form.cardNum.value;
    		txt2 = document.form.cardName.value;
    		txt3 = document.form.cardCord.value;
    		if(txt1!=""&&txt2!=""&&txt3!=""){
        		document.form.action = "Uc05_s1";
        		document.form.submit();
    		}else{
    			alert("入力してください。");
    		}
    	}
    </script>
    <script src="./js/top.js" charset="UTF-8"></script>
    <script src="./js/uc05.js" charset="UTF-8"></script>
</body>

</html>