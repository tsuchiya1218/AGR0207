function addOne(cnt) {
	for (i = 1; i <= 29; i++) {
		if (cnt == 'menu_' + i) {
			let count = document.getElementById('counter' + i);
			count.value++;
			count.style.backgroundColor = '#FFCCCC';
		}
	}
}

function subOne(cnt) {
	for (i = 1; i <= 29; i++) {
		if (cnt == 'menu_' + i) {
			let count = document.getElementById('counter' + i);
			if (count.value > 1) {
				count.value--;
			}
			else if (count.value = 1) {
				count.value--;
				count.style.backgroundColor = '#FFF';
			}
		}
	}
}
function Next(){
	location.href="Uc12";
}