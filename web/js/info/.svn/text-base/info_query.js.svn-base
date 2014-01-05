function query_info(tab) {
	if (Ext.getCmp(xdd.id.info_query_panel)) {
		tab.doLayout();
		return;
	}

	Ext.QuickTips.init();

	var head = {
		xtype : 'panel',
		border : false,
		html : '<div class="headline2">' + xdd.lang.info + xdd.lang.query
				+ '</div>'
	}

	// -------------------------------------------------------- info query form
	var group_store = new Ext.data.Store({
				proxy : new Ext.data.HttpProxy({
							url : 'info/listInfoGroup.do?level=1',
							method : 'GET'
						}),
				reader : new Ext.data.ArrayReader({}, [{
									name : 'id'
								}, {
									name : 'name'
								}])
			});
	group_store.load();
	// group_store.on('load', function(ds, records, o) {
	// if (records.length > 0) {
	// group_combo.setValue(records[0].data.id);
	// }
	// });
	var group_combo = new Ext.form.ComboBox({
				store : group_store,
				mode : 'remote',
				triggerAction : 'all',
				valueField : 'id',
				displayField : 'name',
				fieldLabel : xdd.lang.info_group,
				hiddenName : 'groupId',
				forceSelection : true,
				emptyText : xdd.lang.all,
				typeAhead : true,
				width : 150
			});

	var state_store = new Ext.data.ArrayStore({
				fields : ['code', 'state'],
				data : [['3', xdd.lang.draft], ['2', xdd.lang.wait_audit1],
						['1', xdd.lang.wait_audit2],
						['0', xdd.lang.audit_pass], ['-1', xdd.lang.audit_deny]]
			});
	var state_combo = new Ext.form.ComboBox({
				store : state_store,
				valueField : 'code',
				displayField : 'state',
				fieldLabel : xdd.lang.state,
				hiddenName : 'state',
				mode : 'local',
				triggerAction : 'all',
				emptyText : xdd.lang.all,
				forceSelection : true,
				typeAhead : true,
				width : 100
			});

	var submit = {
		xtype : 'button',
		text : xdd.lang.query,
		handler : form_handler
	};

	function form_handler() {
		info_store.load({
					params : {
						start : 0,
						limit : 10,
						groupId : group_combo.getValue(),
						state : state_combo.getValue(),
						from  : 'pub'
					}
				});
	}

	var qc = {
		layout : 'column',
		border : false,
		items : [{
					columnWidth : .29,
					layout : 'form',
					items : [group_combo]
				}, {
					columnWidth : .23,
					layout : 'form',
					items : [state_combo]
				}, {
					columnWidth : .48,
					layout : 'form',
					items : [submit]
				}]
	};

	var form = new Ext.form.FormPanel({
				url : 'info/listInfo.do',
				method : 'POST',
				labelAlign : 'right',
				labelWidth : 55,
				frame : true,
				width : 750,
				fileUpload : true,
				style : 'margin-top: 15px; margin-left: 23px',
				region : 'center',
				items : [{
							layout : 'form',
							items : [qc]
						}]
			});

	// ------------------------------------------------------------- info grid

	var info_cm = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), {
				header : xdd.lang.pub_time,
				dataIndex : 'time',
				width : 70,
				sortable : true
			}, {
				header : xdd.lang.title,
				dataIndex : 'title',
				width : 185
			}, {
				header : xdd.lang.info_group,
				dataIndex : 'group',
				width : 90
			}, {
				header : xdd.lang.author,
				dataIndex : 'author',
				width : 55
			}, {
				header : xdd.lang.state,
				dataIndex : 'state',
				width : 65
			}, {
				header : xdd.lang.auditor1,
				dataIndex : 'auditor1',
				width : 55
			}, {
				header : xdd.lang.auditor2,
				dataIndex : 'auditor2',
				width : 55
			}, {
				header : xdd.lang.operation,
				dataIndex : 'operation',
				width : 175
			}, {
				header : '',
				dataIndex : 'id',
				width : 0,
				hidden : true
			}]);
	var info_store = new Ext.data.Store({
				proxy : new Ext.data.HttpProxy({
							url : 'info/listInfo.do',
							method : 'GET'
						}),
				reader : new Ext.data.JsonReader({
							totalProperty : 'totalProperty',
							root : 'root'
						}, [{
									name : 'time'
								}, {
									name : 'title'
								}, {
									name : 'group'
								}, {
									name : 'author'
								}, {
									name : 'state'
								}, {
									name : 'auditor1'
								}, {
									name : 'auditor2'
								}, {
									name : 'operation'
								}, {
									name : 'id'
								}])
			});
	info_store.on('beforeload', function(store) {
				Ext.apply(store.baseParams, {
							groupId : group_combo.getValue(),
							state : state_combo.getValue(),
							from  : 'pub'
						});
			});

	var info_grid = new Ext.grid.GridPanel({
				id : xdd.id.info_grid,
				style : 'margin-top: 15px; margin-left: 23px',
				width : 750,
				autoHeight : true,
				store : info_store,
				loadMask : true,
				stripeRows : true,
				cm : info_cm,
				bbar : new Ext.PagingToolbar({
							pageSize : 10,
							store : info_store,
							displayInfo : true,
							displayMsg : xdd.lang.page_tip,
							emptyMsg : xdd.lang.no_item
						})
			});

	var iqp = {
		id : xdd.id.info_query_panel,
		xtype : 'panel',
		border : false,
		items : [head, form, info_grid]
	}

	tab.add(iqp);
	tab.doLayout();
}