function copy_info(id) {
	Ext.Ajax.request({
				url : 'info/copyInfo.do',
				success : function(response) {
					var result = Ext.decode(response.responseText);
					if (result.success == true) {
						var grid = Ext.getCmp(xdd.id.info_audit_grid);
						grid.store.reload();
					} else {
						Ext.Msg.alert(xdd.lang.error_tip, result.error);
					}
				},
				params : {
					id : id
				}
			});
}