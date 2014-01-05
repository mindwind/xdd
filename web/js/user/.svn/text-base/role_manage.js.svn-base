function man_role(tab) {
	if (Ext.getCmp(xdd.id.role_manage_panel)) {
		tab.doLayout();
		return;
	}
	Ext.QuickTips.init();

	var form = get_form();
	var grid = get_grid();
	var head = {
		xtype : 'panel',
		border : false,
		html : '<div class="headline2">' + xdd.lang.role_management + '</div>'
	}
	var body = {
		layout : 'column',
		xtype : 'panel',
		border : false,
		items : [{
					columnWidth : .4,
					layout : 'form',
					border : false,
					items : [form]
				}, {
					columnWidth : .6,
					border : false,
					layout : 'form',
					items : [grid]
				}]
	}

	var rmp = {
		id : xdd.id.role_manage_panel,
		xtype : 'panel',
		border : false,
		items : [head, body]
	}

	tab.add(rmp);
	tab.doLayout();

	/** 角色列表 */
	function get_grid() {
		var cm = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), {
					header : '',
					dataIndex : 'id',
					width : 0,
					hidden : true
				}, {
					header : xdd.lang.rolename,
					dataIndex : 'name',
					width : 200,
					sortable : true
				}, {
					header : xdd.lang.operation,
					dataIndex : 'operation',
					width : 120
				}]);

		var store = new Ext.data.Store({
					proxy : new Ext.data.HttpProxy({
								url : 'user/listRole.do?select=grid',
								method : 'GET'
							}),
					reader : new Ext.data.JsonReader({}, [{
										name : 'id'
									}, {
										name : 'name'
									}, {
										name : 'operation'
									}])
				});

		var grid = new Ext.grid.GridPanel({
					id : xdd.id.role_grid,
					width : 320,
					autoHeight : true,
					stripeRows : true,
					loadMask : true,
					store : store,
					cm : cm,
					style : 'margin-top: 15px'
				});
		store.load();
		return grid;
	}

	/** 角色添加表单 */
	function get_form() {
		var headline = {
			xtype : 'panel',
			html : '<div class="headline">' + xdd.lang.role + xdd.lang.add
					+ '</div>'
		};

		var rolename = {
			layout : 'form',
			items : [{
						xtype : 'textfield',
						fieldLabel : xdd.lang.rolename,
						name : 'name',
						allowBlank : false,
						minLength : 2,
						maxLength : 20
					}]
		};

		var submit = {
			layout : 'form',
			style : 'margin-left:5px;',
			items : [{
						xtype : 'button',
						text : xdd.lang.submit,
						handler : form_handler
					}]
		}

		var rs = {
			layout : 'column',
			border : false,
			items : [{
						columnWidth : .72,
						layout : 'form',
						items : [rolename]
					}, {
						columnWidth : .28,
						layout : 'form',
						items : [submit]
					}]
		};

		function form_handler() {
			form.getForm().submit({
						success : function() {
							Ext.getCmp(xdd.id.role_grid).store.reload();
						},
						failure : function(form, action) {
							Ext.Msg.alert(xdd.lang.error_tip,
									action.result.error);
						}
					});
		}

		var form = new Ext.form.FormPanel({
					url : 'user/addRole.do',
					method : 'POST',
					labelAlign : 'right',
					labelWidth : 55,
					frame : true,
					width : 270,
					style : 'margin-top: 15px; margin-left: 23px',
					region : 'center',
					items : [{
								layout : 'form',
								items : [headline, rs]
							}]
				});
		return form;
	}
}