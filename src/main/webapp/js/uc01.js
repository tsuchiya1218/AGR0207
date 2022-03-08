function JumpJavaMail() {
	document.member.action = "Mail";
	document.member.submit();

}
function Jump01_04() {
	txt = document.member.mail.value;
	if (txt != "") {
		document.member.action = "Uc01_02";
		document.member.submit();
	}else{
		alert("メールアドレスを入力してください。");
	}
}
function JumpJava06() {
	var year = document.getElementById("year");
	var month = document.getElementById("month");
	var day = document.getElementById("day");
	if (!year.options[0].selected && !month.options[0].selected && !day.options[0].selected) {
		if (CheckPass() == true) {
			document.member.action = "Uc01_06";
			document.member.submit();
		}
	} else {
		alert("誕生日を選択ください。");
	}
}
function JumpJava08() {
	document.member.action = "Uc01_08";
	document.member.submit();
}
function CheckSei() {
	txt = document.member.sei.value;
	if (txt.match(/^[A-Za-z0-9]/)) {
		alert("正しい名前をご記入ください。");
		document.member.sei.value = "";
	}
}
function CheckMei() {
	txt = document.member.mei.value;
	if (txt.match(/^[A-Za-z0-9]/)) {
		alert("正しい名前をご記入ください。");
		document.member.mei.value = "";
	}
}
function CheckPostcode1() {
	txt = document.member.postcode1.value;
	if (!txt.match(/^[0-9]+$/)) {
		alert("半角数字でご記入ください。");
		document.member.postcode1.value = "";
	}
}
function CheckPostcode2() {
	txt = document.member.postcode2.value;
	if (!txt.match(/^[0-9]+$/)) {
		alert("半角数字でご記入ください。");
		document.member.postcode2.value = "";
	}
}
function CheckMail() {
	txt = document.member.mail.value;
	if (txt.match(/^[A-Za-z0-9]{1}[A-Za-z0-9_.-]*@{1}[A-Za-z0-9_.-]+.[A-Za-z0-9]+$/)) {
	} else {
		alert("正しいメールアドレスをご記入ください。");
		document.member.mail.value = "";
	}
}
function CheckPhone1() {
	txt = document.member.tel1.value;
	if (txt.match(/^[0-9]+$/)) {
	} else {
		alert("半角数字でご記入ください。");
		document.member.tel1.value = "";
	}
}
function CheckPhone2() {
	txt = document.member.tel2.value;
	if (txt.match(/^[0-9]+$/)) {
	} else {
		alert("半角数字でご記入ください。");
		document.member.tel2.value = "";
	}
}
function CheckPhone3() {
	txt = document.member.tel3.value;
	if (txt.match(/^[0-9]+$/)) {
	} else {
		alert("半角数字でご記入ください。");
		document.member.tel3.value = "";
	}
}
function CheckPass1() {
	pass = document.member.pass1.value;
	if (pass.match(/([a-z].*[A-Z])|([A-Z].*[a-z])/) && pass.match(/([0-9])/) && pass.length >= 8 && pass.length <= 12) {
	} else {
		alert("※アルファベットの大文字・小文字を必ず１文字以上使用し、\nかつ数字を組み合わせて８文字以上１２文字以内でご記入ください。");
		document.member.pass1.value = "";
	}
}
function CheckPass2() {
	pass = document.member.pass2.value;
	if (pass.match(/([a-z].*[A-Z])|([A-Z].*[a-z])/) && pass.match(/([0-9])/) && pass.length >= 8 && pass.length <= 12) {
	} else {
		alert("※アルファベットの大文字・小文字を必ず１文字以上使用し、\nかつ数字を組み合わせて８文字以上１２文字以内でご記入ください。");
		document.member.pass2.value = "";
	}
}
function CheckPass() {
	pass1 = document.member.pass1.value;
	pass2 = document.member.pass2.value;
	if (pass1 != "" || pass2 != "") { //どれかが入力されていたら
		if (pass1 == pass2) {
			return true;
		} else {
			alert('パスワードが一致していません。\n再度ご記入し直してください。');
			document.member.pass1.value = "";
			document.member.pass2.value = "";
		}
	} else {
		return true;
	}
}