<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang=ja>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>利用時間の延長</title>
    <link rel="stylesheet" type="text/css" href="./css/RoomRiyou/default.css">
    <link rel="stylesheet" type="text/css" href="./css/RoomRiyou/header.css">
    <link rel="stylesheet" type="text/css" href="./css/RoomRiyou/in.css">
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
                    <li>
                        <a href="uc07_02.jsp">予約</a>
                    </li>
                    <li>
                        <a href="uc08_02.jsp">予約確認</a>
                    </li>
                    <li>
                        <a href="uc10_02.jsp">入室QRコード</a>
                    </li>
                    <li>
                        <a href="uc12_02.jsp">メニュー</a>
                    </li>
                    <li>
                        <a href="uc13_02.jsp">注文履歴</a>
                    </li>
                    <li>
                        <a href="uc11_02.jsp">退室する</a>
                    </li>
                    <li class="li_cannot">
                        <a>押せないボタン例</a>
                    </li>
                </ul>
            </div>
        </div>
    </header>
    <main>
        <div class="idnum">
            ようこそ、　<a href="uc05_02.jsp">野永脩太</a>　さん
            <button type="button" class="back" onclick="OnButtonClick()">ログアウト</button>
        </div>
        <h2>退室時間変更確認</h2>
        <p>延長時間をお確かめください。</p>
        <table class="order">
            <tr>
                <td>30分延長</td>
                <td>延長料金　400円</td>
            </tr>
        </table>
        <div class="click">
            <button class="back" onclick="location.href='uc14_03.jsp'">戻る</button>
            <button class="go" onclick="location.href='uc14_07.jsp'">確定</button>
        </div>
    </main>
    <script src="./js/top.js" charset="UTF-8"></script>
</body>

</html>