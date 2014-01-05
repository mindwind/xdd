$(document).ready(load);

function load() {
	$.ajax({
		type : 'GET',
		url : 'info/listRollInfo.do',
		dataType : 'json',
		success : function(result) {
			if (result.success == true) {
				var msg = result.msg;
				var linfo = new Array();
				for (var i = 0; i < msg.length; i++) {
					var item = [msg[i].imgUrl, msg[i].title, msg[i].imgLinkUrl];
					linfo[i] = item;
				}
				Lantern.info = linfo;
				Lantern.init();
			} else {
				// do nothing
			}
		}
	});
}