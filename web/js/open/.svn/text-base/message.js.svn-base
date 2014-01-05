Ext.onReady(function() {
			Ext.QuickTips.init();
			var form = new org.craft.xdd.open.MessageFormPanel();
			form.render('messageForm');
			
			html = '<div class="usertip">';
			html += xdd.lang.message_tip_1 + "<br>";
			html += xdd.lang.message_tip_2 + "<br>";
			html += xdd.lang.message_tip_3;
			html += "</div>";
			var tip = new Ext.Panel({
						border : false,
						style : 'margin : 20 10 20 0',
						html : html
					});
			tip.render('messageTip');
		});

function newverifypic() {
	var timenow = new Date().getTime();
	var img = document.getElementById("verifypic");
	img.src = "../cowork/validationCodeServlet?t=" + timenow;
}
