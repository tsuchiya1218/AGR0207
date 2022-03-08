function Jump06_04() {
	mail = document.form.mail.value;
	pass = document.form.pass.value;
	if (mail == "") {
		alert("メールアドレスを入力してください");
	} else if (pass == "") {
		alert("パスワードを入力してください");
	} else {
		document.form.action = "Uc06_04";
		document.form.submit();
	}
}