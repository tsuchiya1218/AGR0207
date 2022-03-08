let table = document.querySelectorAll(".time input[type='radio']");
window.onload = function() {
	for (let i of table) {
		if (i.nextElementSibling.textContent == '✕') {
			i.disabled = true;
			i.nextElementSibling.style.backgroundColor = 'lightgray';
		}
		if (i.nextElementSibling.textContent == '◎') {
			i.nextElementSibling.style.color = 'red';
		}
	}	
}