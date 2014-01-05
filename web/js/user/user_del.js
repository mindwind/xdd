function del_user(id) {

	Ext.MessageBox.confirm(xdd.lang.del_user, xdd.lang.del_tip, callback);

	function callback(btn) {
		if (btn == 'yes') {
			Ext.Ajax.request({
						url : 'user/delUser.do',
						success : function(response) {
							var result = Ext.decode(response.responseText);
							if (result.success == true) {
								Ext.getCmp(xdd.id.user_grid).store.reload();
							} else {
								Ext.Msg.alert(xdd.lang.error_tip, result.error);
							}
						},
						params : {
							id : id
						}
					});
		}
	}
}