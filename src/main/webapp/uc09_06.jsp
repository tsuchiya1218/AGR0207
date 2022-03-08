<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang=ja>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>当日受付</title>
    <link rel="stylesheet" type="text/css" href="./css/RoomRiyou/default.css">
    <link rel="stylesheet" type="text/css" href="./css/RoomRiyou/header.css">
    <link rel="stylesheet" type="text/css" href="./css/RoomRiyou/register.css">
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
        <h2>受付確認</h2>
        <p>お間違いないかご確認ください。</p>
        <form method="post" action="">
            <table class="table1">
                <tr>
                    <th>入室日時</th>
                    <td>１月３日（月）　11:00</td>
                </tr>
                <tr>
                    <th>店舗</th>
                    <td>新宿東口店</td>
                </tr>
                <tr>
                    <th>人数</th>
                    <td>2</td>
                </tr>
                <tr>
                    <th>時間</th>
                    <td>180分</td>
                </tr>
                <tr>
                    <th>ルーム番号</th>
                    <td>101</td>
                </tr>
                <tr>
                    <th>機種</th>
                    <td>LIVE DAM Ai</td>
                </tr>
                <tr>
                    <th>ルーム代金</th>
                    <td>1800円</td>
                </tr>
            </table>
        </form>
        <div class="click">
            <button class="back" onclick="location.href='uc09_04.jsp'">戻る</button>
            <button class="go" onclick="location.href='uc10_02.jsp'">入室QRコード</button>
        </div>
    </main>
    <script src="./js/top.js" charset="UTF-8"></script>
</body>

</html>