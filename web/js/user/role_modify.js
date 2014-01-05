function modify_role(id) {
	Ext.QuickTips.init();

	var role_id = new Ext.form.Hidden({
				name : 'id',
				value : id
			})

	var role_grid = Ext.getCmp(xdd.id.role_grid);
	var idx = role_grid.store.find('id', id);

	var role_name = new Ext.form.TextField({
				fieldLabel : xdd.lang.rolename,
				name : 'name',
				allowBlank : false,
				minLength : 2,
				maxLength : 20,
				value : role_grid.store.getAt(idx).get('name')
			});

	var confirm_btn = {
		xtype : 'button',
		text : xdd.lang.confirm,
		handler : form_handler
	};

	function form_handler() {
		form.getForm().submit({
					success : function() {
						role_grid.store.reload();
						win.close();
					},
					failure : function(form, action) {
						Ext.Msg.alert(xdd.lang.error_tip, action.result.error);
					}
				});
	}

	var cancel_btn = {
		xtype : 'button',
		text : xdd.lang.cancel,
		handler : function() {
			win.close();
		}
	};

	var form = new Ext.form.FormPanel({
				url : 'user/modifyRole.do',
				method : 'POST',
				labelAlign : 'right',
				labelWidth : 55,
				frame : true,
				width : 270,
				items : [{
							layout : 'form',
							items : [role_id, role_name]
						}],
				buttons : [confirm_btn, cancel_btn],
				buttonAlign : 'center'
			});

	var win = new Ext.Window({
				title : xdd.lang.role_modify,
				width : 270,
				closeAction : 'close',
				modal : true,
				draggable : false,
				resizable : false,
				border : false,
				items : [form]
			});
	win.show();
}