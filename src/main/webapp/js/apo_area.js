window.onload = function () {
    subbbox = document.getElementById("subbox");
    area = document.getElementById("area");
    area.onchange = changearea;
}

function changearea() {
    var changedarea = area.value;
    if (changedarea == "shinjyuku") {
        setshinjyuku();
    } else if (changedarea == "shibuya") {
        setshibuya();
    } else if (changedarea == "setagaya") {
        setsetagaya();
    } else if (changedarea == "minato") {
        setminato();
    } else if (changedarea == "chiyoda") {
        setchiyoda();
    } else if (changedarea == "adachi") {
        setadachi();
    } else if (changedarea == "toshima") {
        settoshima();
    } else if (changedarea == "katsushika") {
        setkatsushika();
    } else if (changedarea == "kugai") {
        setkugai();
    } else if (changedarea == "saitama") {
        setsaitama();
    } else if (changedarea == "kanagawa") {
        setkanagawa();
    }
}

function setshinjyuku() {
	subbox.textContent = null;
	for(var i=0 ; i<sSSlist.length ; i++ ){
		array = [{label:sSSlist[i]}];
		array.forEach(function (value) {
		    var op = document.createElement("option");
		    op.text = value.label;
		    subbox.appendChild(op);
	});
	}
}

function setshibuya() {
	subbox.textContent = null;
	for(var i=0 ; i<sSMlist.length ; i++ ){
		array = [{label:sSMlist[i]}];
		array.forEach(function (value) {
		    var op = document.createElement("option");
		    op.text = value.label;
		    subbox.appendChild(op);
	});
	}
}

function setsetagaya() {
	subbox.textContent = null;
	for(var i=0 ; i<sSOlist.length ; i++ ){
		array = [{label:sSOlist[i]}];
		array.forEach(function (value) {
		    var op = document.createElement("option");
		    op.text = value.label;
		    subbox.appendChild(op);
	});
	}
}
function setminato() {
	subbox.textContent = null;
	for(var i=0 ; i<sMIlist.length ; i++ ){
		array = [{label:sMIlist[i]}];
		array.forEach(function (value) {
		    var op = document.createElement("option");
		    op.text = value.label;
		    subbox.appendChild(op);
		});
	}
}
function setchiyoda() {
	subbox.textContent = null;
	for(var i=0 ; i<sCClist.length ; i++ ){
		array = [{label:sCClist[i]}];
		array.forEach(function (value) {
		    var op = document.createElement("option");
		    op.text = value.label;
		    subbox.appendChild(op);
	});
	}
}
function setadachi() {
	subbox.textContent = null;
	for(var i=0 ; i<sADlist.length ; i++ ){
		array = [{label:sADlist[i]}];
		array.forEach(function (value) {
		    var op = document.createElement("option");
		    op.text = value.label;
		    subbox.appendChild(op);
	});
	}
}
function settoshima() {
	subbox.textContent = null;
	for(var i=0 ; i<sTNlist.length ; i++ ){
		array = [{label:sTNlist[i]}];
		array.forEach(function (value) {
		    var op = document.createElement("option");
		    op.text = value.label;
		    subbox.appendChild(op);
	});
	}
}
function setkatsushika() {
	subbox.textContent = null;
	for(var i=0 ; i<sKElist.length ; i++ ){
		array = [{label:sKElist[i]}];
		array.forEach(function (value) {
		    var op = document.createElement("option");
		    op.text = value.label;
		    subbox.appendChild(op);
	});
	}
}
function setkugai() {
	subbox.textContent = null;
	for(var i=0 ; i<sOUlist.length ; i++ ){
		array = [{label:sOUlist[i]}];
		array.forEach(function (value) {
		    var op = document.createElement("option");
		    op.text = value.label;
		    subbox.appendChild(op);
	});
	}
}
function setsaitama() {
	subbox.textContent = null;
	for(var i=0 ; i<sSAlist.length ; i++ ){
		array = [{label:sSAlist[i]}];
		array.forEach(function (value) {
		    var op = document.createElement("option");
		    op.text = value.label;
		    subbox.appendChild(op);
	});
	}
}
function setkanagawa() {
	subbox.textContent = null;
	for(var i=0 ; i<sKAlist.length ; i++ ){
		array = [{label:sKAlist[i]}];
		array.forEach(function (value) {
		    var op = document.createElement("option");
		    op.text = value.label;
		    subbox.appendChild(op);
	});
	}
}
