function JumpJava04() {
	document.form.action = "Uc08_s1_04";
	document.form.submit();
}
function JumpJava06() {
	var txt = document.form.date.value;
	if (txt != "") {
		document.form.action = "Uc08_s1_06";
		document.form.submit();
	} else {
		alert("予約したい日時を選択してください。");
	}
}
function JumpJava08() {
	var txt = document.form.room.value;
	if (txt != "") {
		document.form.action = "Uc08_s1_08";
		document.form.submit();
	} else {
		alert("予約したいルームを選択してください。");
	}
}
function JumpJava10() {
	document.form.action = "Uc08_s1_10";
	document.form.submit();
}
function JumpJavaS204(){
	document.form.action = "Uc08_s2_04";
	document.form.submit();
}