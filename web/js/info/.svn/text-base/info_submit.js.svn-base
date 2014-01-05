function submit_info(id) {
	Ext.Ajax.request({
				url : 'info/submitInfo.do',
				success : function(response) {
					var result = Ext.decode(response.responseText);
					if (result.success == true) {
						Ext.getCmp(xdd.id.info_grid).store.reload();
					} else {
						Ext.Msg.alert(xdd.lang.error_tip, result.error);
					}
				},
				params : {
					id : id
				}
			});
}