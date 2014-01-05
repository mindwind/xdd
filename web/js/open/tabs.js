var m3 = {
	0 : "",
	1 : "栏目建设中。。。",
	2 : "栏目建设中。。。",
	3 : "栏目建设中。。。",
	4 : "栏目建设中。。。",
	5 : "栏目建设中。。。"
}

function nowtab(n) {
	if (n != 0 && m3[0] == "") {
		m3[0] = document.getElementById("tab").innerHTML;
	}
	document.getElementById("tip2").style.left = n * 120 + 'px';
	document.getElementById("tab").innerHTML = m3[n];
}

function nowtab1(n) {
	document.getElementById("tip2").style.left = n * 120 + 'px';
	var tab = document.getElementById("tab");
	var cn = tab.childNodes;
	for (var i = 0; i < cn.length; i++) {
		if (cn[i].style) {
			cn[i].style.display = "none";
		}
	}
	var tabn = document.getElementById("tab" + n);
	tabn.style.display = "";
}