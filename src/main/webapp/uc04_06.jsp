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
        <h2>パスワード再設定</h2>
        <p>新しく設定するパスワードを入力してください。</p>
        <div class="login">
            <form method="post" action="" class="login">
                <p>新パスワード　　　　　：　<input type="password" name="pw1" required></p>
                <p class="detail">
                    ※アルファベットの大文字・小文字を必ず１文字以上使用し、
                    かつ数字を組み合わせて８文字以上１２文字以内でご記入ください。
                </p>
                <p>新パスワード（確認用）：　<input type="password" name="pw2" required></p>
                <p class="detail">
                    ※確認のため、もう一度入力してください。
                </p>
                <div class="click">
                    <button type="button" class="go" onclick="location.href='uc04_08.jsp'">パスワードを再設定する</button>
                </div>
            </form>
        </div>
    </main>
</body>

</html>