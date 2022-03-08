function OnButtonClick() {
	if (checkPhone() == true && checkPass() == true) {
		alert('更新しました。');
		document.form.action = "Uc05";
		document.form.submit();
	}
}
function checkPhone() {
	txt1 = document.form.m_phone1.value;
	txt2 = document.form.m_phone2.value;
	txt3 = document.form.m_phone3.value;
	if (txt1 != "" || txt2 != "" || txt3 != "") { //どれかが入力されていたら
		if (txt1 != "" && txt2 != "" && txt3 != "") { //全部空白じゃないかつパスワード一致
			return true;
		} else {
			if (txt1 != "" || txt2 != "" || txt3 != "") {
				alert('電話番号を正しくご記入ください。');
				document.getElementById("m_phone1").value = "";
				document.getElementById("m_phone2").value = "";
				document.getElementById("m_phone3").value = "";
			}
		}
	} else {
		return true;
	}
}
function checkPass() {
	pass1 = document.form.m_pass1.value;
	pass2 = document.form.m_pass2.value;
	if (pass1 != "" || pass2 != "") { //どれかが入力されていたら
		if (pass1 == pass2) {
			return true;
		} else {
			alert('パスワードが一致していません。\n再度ご記入し直してください。');
			document.getElementById("m_pass1").value = "";
			document.getElementById("m_pass2").value = "";
		}
	} else {
		return true;
	}

}
function checkPost1() {
	txt = document.form.m_postcode1.value;
	n = txt.length;
	if (n != 3) {
		alert("半角数字3文字でご記入ください。");
		document.getElementById("m_postcode1").value = "";
	} else if (txt.match(/^[0-9]*$/)) {

	} else {
		alert("半角数字3文字でご記入ください。");
		document.getElementById("m_postcode1").value = "";
	}
}

function checkPost2() {
	txt = document.form.m_postcode2.value;
	n = txt.length;
	if (n != 4) {
		alert("半角数字4文字でご記入ください。");
		document.getElementById("m_postcode2").value = "";
	} else if (txt.match(/^[0-9]*$/)) {
	} else {
		alert("半角数字4文字でご記入ください。");
		document.getElementById("m_postcode2").value = "";
	}
}

function checkMail() {
	txt = document.form.m_mail.value;
	if (txt.match(/^[A-Za-z0-9]{1}[A-Za-z0-9_.-]*@{1}[A-Za-z0-9_.-]+.[A-Za-z0-9]+$/)) {
	} else {
		alert("正しいメールアドレスをご記入ください。");
		document.getElementById("m_mail").value = "";
	}
}

function checkPhone1() {
	txt1 = document.form.m_phone1.value;
	if (txt.match(/^[0-9]*$/)) {
	} else {
		alert("半角数字でご記入ください。");
		document.getElementById("m_phone1").value = "";
	}
}
function checkPhone2() {
	txt1 = document.form.m_phone2.value;
	if (txt.match(/^[0-9]*$/)) {
	} else {
		alert("半角数字でご記入ください。");
		document.getElementById("m_phone2").value = "";
	}
}
function checkPhone3() {
	txt1 = document.form.m_phone1.value;
	if (txt.match(/^[0-9]*$/)) {
	} else {
		alert("半角数字でご記入ください。");
		document.getElementById("m_phone3").value = "";
	}
}
function checkPass1(){
	pass = document.form.m_pass1.value;
	if ( pass.match(/([a-z].*[A-Z])|([A-Z].*[a-z])/) && pass.match(/([0-9])/) && pass.length >= 8 && pass.length <= 12 ){
	}else{
		alert("※アルファベットの大文字・小文字を必ず１文字以上使用し、\nかつ数字を組み合わせて８文字以上１２文字以内でご記入ください。");
		document.getElementById("m_pass1").value = "";
	}
}
function checkPass2(){
	pass = document.form.m_pass2.value;
	if ( pass.match(/([a-z].*[A-Z])|([A-Z].*[a-z])/) && pass.match(/([0-9])/) && pass.length >= 8 && pass.length <= 12 ){
	}else{
		alert("※アルファベットの大文字・小文字を必ず１文字以上使用し、\nかつ数字を組み合わせて８文字以上１２文字以内でご記入ください。");
		document.getElementById("m_pass2").value = "";
	}
}
function checkCardNum(){
	pass = document.form.cardNum.value;
	if ( pass.match(/([0-9])/) && pass.length == 16 ){
	}else{
		alert("半角数字16字で入力してください。");
		document.getElementById("m_pass2").value = "";
	}
}
