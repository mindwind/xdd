function reset_pwd(id) {
	Ext.Ajax.request({
				url : 'user/resetPassword.do',
				success : function(response) {
					var result = Ext.decode(response.responseText);
					if (result.success == true) {
						Ext.Msg.alert(xdd.lang.tip, xdd.lang.success);
					} else {
						Ext.Msg.alert(xdd.lang.error_tip, result.error);
					}
				},
				params : {
					id : id
				}
			});
}