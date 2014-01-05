function modify_user(id) {
	Ext.QuickTips.init();

	var user_id = new Ext.form.Hidden({
				name : 'id',
				value : id
			})

	var user_grid = Ext.getCmp(xdd.id.user_grid);
	var idx = user_grid.store.find('id', id);
	var org_store = new Ext.data.Store({
				proxy : new Ext.data.HttpProxy({
							url : 'user/listOrg.do',
							method : 'GET'
						}),
				reader : new Ext.data.ArrayReader({}, [{
									name : 'id'
								}, {
									name : 'name'
								}])
			});
	org_store.load();
	org_store.on('load', function(ds, records, o) {
				org_combo.setValue(user_grid.store.getAt(idx).get('orgId'));
			});
	var org_combo = new Ext.form.ComboBox({
				store : org_store,
				mode : 'remote',
				triggerAction : 'all',
				valueField : 'id',
				displayField : 'name',
				fieldLabel : xdd.lang.org,
				hiddenName : 'orgId',
				width : 125
			});

	var role_store = new Ext.data.Store({
				proxy : new Ext.data.HttpProxy({
							url : 'user/listRole.do',
							method : 'GET'
						}),
				reader : new Ext.data.ArrayReader({}, [{
									name : 'id'
								}, {
									name : 'name'
								}])
			});
	role_store.load();
	role_store.on('load', function(ds, records, o) {
				role_combo.setValue(user_grid.store.getAt(idx).get('roleId'));
			});
	var role_combo = new Ext.form.ComboBox({
				store : role_store,
				mode : 'remote',
				triggerAction : 'all',
				valueField : 'id',
				displayField : 'name',
				fieldLabel : xdd.lang.role,
				hiddenName : 'roleId',
				width : 125
			});

	var confirm_btn = {
		xtype : 'button',
		text : xdd.lang.confirm,
		handler : form_handler
	};

	function form_handler() {
		form.getForm().submit({
					success : function() {
						user_grid.store.reload();
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
				url : 'user/modifyUser.do',
				method : 'POST',
				labelAlign : 'right',
				labelWidth : 55,
				frame : true,
				width : 270,
				items : [{
							layout : 'form',
							items : [user_id, role_combo, org_combo]
						}],
				buttons : [confirm_btn, cancel_btn],
				buttonAlign : 'center'
			});

	var win = new Ext.Window({
				title : xdd.lang.user_modify + '-' + id,
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