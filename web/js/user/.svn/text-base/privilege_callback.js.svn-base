function callback_privilege(rid, pid) {
	Ext.Ajax.request({
				url : 'user/callbackPrivilege.do',
				success : function(response) {
					var result = Ext.decode(response.responseText);
					if (result.success == true) {
						Ext.getCmp(xdd.id.role_privilege_grid).store.reload();
					} else {
						Ext.Msg.alert(xdd.lang.error_tip, result.error);
					}
				},
				params : {
					rid : rid,
					pid : pid
				}
			});
}