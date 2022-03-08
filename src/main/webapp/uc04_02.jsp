<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang=ja>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>パスワード再設定</title>
    <link rel="stylesheet" type="text/css" href="./css/RoomRiyou/default.css">
    <link rel="stylesheet" type="text/css" href="./css/RoomRiyou/header.css">
    <link rel="stylesheet" type="text/css" href="./css/RoomRiyou/login.css">
</head>

<body>
    <header>
        <div class="h1">
            <h1>カラオケわっしょい</h1>
        </div>
    </header>
    <main>
        <h2>ご本人様確認</h2>
        <p>ご登録いただいたメールアドレスと電話番号を入力してください。パスワード再設定のためのURLをお送りします。</p>
        <div class="login">
            <form method="post" action="" class="login">
                <p>メールアドレス：　<input type="email" name="mail" placeholder="例：karaoke@wassyoi.jp" required></p>
                <p>電話番号　　　：　<input type="text" placeholder="例：09012345678" required></p>
                <div class="click">
                    <button type="button" class="go" onclick="location.href='uc04_04.jsp'">本人確認用メールを送信</button>
                </div>
                <div class="click">
                    <button type="button" class="back" onclick="location.href='uc_index.jsp'">ログイン画面に戻る</button>
                </div>
            </form>
        </div>
    </main>
</body>

</html>