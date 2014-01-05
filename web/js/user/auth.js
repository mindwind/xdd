function auth(id) {
	Ext.QuickTips.init();
	var role_id = new Ext.form.Hidden({
				name : 'id',
				value : id
			})
	var role_grid = Ext.getCmp(xdd.id.role_grid);
	var idx = role_grid.store.find('id', id);
	var role_name = role_grid.store.getAt(idx).get('name');

	var plabel = {
		xtype : 'panel',
		html : xdd.lang.all_privilege
	};
	var rlabel = {
		xtype : 'panel',
		html : xdd.lang.role_privilege
	};
	var pgrid = get_privilege_grid(xdd.id.privilege_grid,
			'user/listPrivilege.do?select=all&roleId=' + id);
	var rgrid = get_privilege_grid(xdd.id.role_privilege_grid,
			'user/listPrivilege.do?select=role&roleId=' + id);
	var grids = {
		layout : 'column',
		items : [{
					columnWidth : .5,
					layout : 'form',
					border : false,
					items : [plabel, pgrid]
				}, {
					columnWidth : .5,
					layout : 'form',
					border : false,
					items : [rlabel, rgrid]
				}]
	};

	var close_btn = {
		xtype : 'button',
		text : xdd.lang.close,
		handler : function() {
			win.close();
		}
	};

	var form = new Ext.form.FormPanel({
				url : '',
				method : 'POST',
				labelAlign : 'right',
				labelWidth : 55,
				frame : true,
				width : 450,
				height : 350,
				items : [{
							layout : 'form',
							items : [grids]
						}],
				buttons : [close_btn],
				buttonAlign : 'center'
			});

	var win = new Ext.Window({
				title : role_name + '-' + xdd.lang.auth,
				width : 450,
				height : 370,
				closeAction : 'close',
				modal : true,
				draggable : false,
				resizable : false,
				border : false,
				items : [form]
			});
	win.show();

	function get_privilege_grid(grid_id, url) {
		var cm = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), {
					header : '',
					dataIndex : 'id',
					width : 0,
					hidden : true
				}, {
					header : xdd.lang.privilege_name,
					dataIndex : 'name',
					width : 130,
					sortable : true
				}, {
					header : xdd.lang.operation,
					dataIndex : 'operation',
					width : 50,
					sortable : true
				}]);

		var store = new Ext.data.Store({
					proxy : new Ext.data.HttpProxy({
								url : url,
								method : 'GET'
							}),
					reader : new Ext.data.JsonReader({}, [{
										name : 'name'
									}, {
										name : 'operation'
									}])
				});

		var grid = new Ext.grid.GridPanel({
					id : grid_id,
					width : 200,
					height : 300,
					autoScroll : true,
					stripeRows : true,
					loadMask : true,
					store : store,
					cm : cm,
					broder : false,
					style : 'margin-top: 5px;'
				});
		store.load();
		return grid;
	}

}