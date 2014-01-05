function man_message() {
	if (isExist('message_manage_panel')) {
		refresh('message_manage_panel', null);
		return;
	}

	var messagePanel = new org.craft.xdd.open.MessagePanel();

	var tabs = new Ext.TabPanel({
				id : 'message_manage_tabs',
				width : 800,
				height : 425,
				activeTab : 0,
				plain : true,
				style : 'margin-top: 25px; margin-left: 25px',
				defaults : {
					autoScroll : true
				},
				items : [{
							title : xdd.lang.message_box,
							items : [messagePanel]
						}]
			});

	refresh('message_manage_tabs', tabs);
}