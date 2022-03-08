function JumpJava() {
	document.form.action = "Us09";
	document.form.submit();
}
function Delete(){
	document.form.action = "Us09";
	document.form.submit();
}
function IdJudge() {
	var id = document.getElementById("w_id").value;
	if (!(id.match(/[0-9]{2,2}/))){
		alert("半角数字2桁で登録してください。");
		document.getElementById("w_id").value = "";
	}
}
function NameJudge() {
	var name = document.getElementById("w_name").value;
	if ((name.match(/[0-9]/))){
		alert("正しい名前を登録してください。");
		document.getElementById("w_name").value = "";
	}
}