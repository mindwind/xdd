function man_user() {
	Ext.QuickTips.init();

	var form = get_form();
	var grid = get_grid();
	var head = {
		xtype : 'panel',
		border : false,
		html : '<div class="headline2">' + xdd.lang.user_management + '</div>'
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
	var foot = {
		xtype : 'panel',
		border : false,
		style : 'margin-top: 20px; margin-left: 23px; margin-right: 20px; margin-bottom: 20px',
		html : '<div class="usertip"> ' + xdd.lang.tip + '<br>'
				+ xdd.lang.user_tip_desc + '</div>'
	}

	var tabs = new Ext.TabPanel({
				id : xdd.id.user_tabs,
				width : 800,
				height : 425,
				activeTab : 0,
				plain : true,
				style : 'margin-top: 25px; margin-left: 25px',
				defaults : {
					autoScroll : true
				},
				items : [{
							title : xdd.lang.user,
							items : [head, body, foot]
						}, {
							title : xdd.lang.role,
							listeners : {
								activate : man_role
							}
						}]
			});

	refresh(xdd.id.user_tabs, tabs);

	/** 用户列表 */
	function get_grid() {
		var cm = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), {
					header : xdd.lang.username,
					dataIndex : 'id',
					width : 85,
					sortable : true
				}, {
					header : xdd.lang.role,
					dataIndex : 'role',
					width : 85
				}, {
					header : xdd.lang.org,
					dataIndex : 'org',
					width : 130
				}, {
					header : xdd.lang.operation,
					dataIndex : 'operation',
					width : 150
				}, {
					header : '',
					dataIndex : 'roleId',
					width : 0,
					hidden : true
				}, {
					header : '',
					dataIndex : 'orgId',
					width : 0,
					hidden : true
				}]);

		var store = new Ext.data.Store({
					proxy : new Ext.data.HttpProxy({
								url : 'user/listUser.do',
								method : 'GET'
							}),
					reader : new Ext.data.JsonReader({
								totalProperty : 'totalProperty',
								root : 'root'
							}, [{
										name : 'id'
									}, {
										name : 'role'
									}, {
										name : 'org'
									}, {
										name : 'operation'
									}, {
										name : 'roleId'
									}, {
										name : 'orgId'
									}])
				});

		var grid = new Ext.grid.GridPanel({
					id : xdd.id.user_grid,
					width : 450,
					autoHeight : true,
					stripeRows : true,
					loadMask : true,
					store : store,
					cm : cm,
					style : 'margin-top: 15px',
					bbar : new Ext.PagingToolbar({
								pageSize : 10,
								store : store,
								displayInfo : true,
								displayMsg : xdd.lang.page_tip,
								emptyMsg : xdd.lang.no_item
							})
				});
		store.load({
					params : {
						start : 0,
						limit : 10
					}
				});
		return grid;
	}

	/** 用户注册表单 */
	function get_form() {
		var headline = {
			xtype : 'panel',
			html : '<div class="headline">' + xdd.lang.user + xdd.lang.register
					+ '</div>'
		};

		var username = new Ext.form.TextField({
					fieldLabel : xdd.lang.username,
					name : 'userId',
					allowBlank : false,
					minLength : 2,
					maxLength : 20
				});

		var password = new Ext.form.TextField({
					xtype : 'textfield',
					fieldLabel : xdd.lang.password,
					name : 'password',
					inputType : 'password',
					allowBlank : false,
					minLength : 6,
					maxLength : 20
				});

		var confirm_pwd = new Ext.form.TextField({
					xtype : 'textfield',
					fieldLabel : xdd.lang.confirm_pwd,
					name : 'confirmPwd',
					inputType : 'password',
					allowBlank : false,
					minLength : 6,
					maxLength : 20
				});

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
					if (records.length > 0) {
						org_combo.setValue(records[0].data.id);
					}
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
					if (records.length > 0) {
						role_combo.setValue(records[0].data.id);
					}
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

		var submit = {
			layout : 'form',
			style : 'margin-left:5px;',
			items : [{
						xtype : 'button',
						text : xdd.lang.submit,
						handler : form_handler
					}]
		}

		var rcs = {
			layout : 'column',
			border : false,
			items : [{
						columnWidth : .72,
						layout : 'form',
						items : [role_combo]
					}, {
						columnWidth : .28,
						layout : 'form',
						items : [submit]
					}]
		};

		function form_handler() {
			form.getForm().submit({
						success : function() {
							Ext.getCmp(xdd.id.user_grid).store.reload();
						},
						failure : function(form, action) {
							Ext.Msg.alert(xdd.lang.error_tip,
									action.result.error);
						}
					});
		}

		var form = new Ext.form.FormPanel({
					url : 'user/register.do',
					method : 'POST',
					labelAlign : 'right',
					labelWidth : 55,
					frame : true,
					width : 270,
					style : 'margin-top: 15px; margin-left: 23px',
					region : 'center',
					items : [{
						layout : 'form',
						items : [headline, username, password, confirm_pwd,
								org_combo, rcs]
					}]
				});
		return form;
	}

}