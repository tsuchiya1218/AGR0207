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
    <link rel="stylesheet" type="text/css" href="./css/RoomRiyou/apo.css">
</head>

<!-- ログインしていない場合はログイン画面（index.html）に遷移して戻ってくる -->

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
        <h2>人数・時間選択</h2>
        <p>ご利用する人数、時間を選択してください。</p>
        <form method="post" action="" class="pulldownset">
            <div class="apo">
                <div>利用人数</div>
                <select>
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
                人
            </div>
            <div class="apo">
                <div>利用時間</div>
                <select>
                    <option>30</option>
                    <option>60</option>
                    <option>90</option>
                    <option>120</option>
                    <option>150</option>
                    <option>180</option>
                    <option>210</option>
                    <option>240</option>
                    <option>270</option>
                    <option>300</option>
                </select>
                分
            </div>
        </form>
        <div class="click">
            <button class="go" onclick="location.href='uc09_04.jsp'">次へ</button>
        </div>
    </main>
    <script src="./js/top.js" charset="UTF-8"></script>
</body>

</html>