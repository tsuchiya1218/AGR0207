function JumpJava04() {
	var txt = document.form.date.value;
	if (txt != "") {
		document.form.action = "Uc07_04";
		document.form.submit();
	} else {
		alert("予約したい日時を選択してください。");
	}
}
function JumpJava06() {
	var txt = document.form.room.value;
	if (txt != "") {
		document.form.action = "Uc07_06";
		document.form.submit();
	} else {
		alert("予約したいルームを選択してください。");
	}
}
function JumpJava10() {
	var txt = document.form.cash.value;
	if (txt != "") {
		document.form.action = "Uc07_10";
		document.form.submit();
	} else {
		alert("お支払方法を選択してください。");
	}
}
function JumpJava12() {
	document.form.action = "Uc07_12";
	document.form.submit();
}
