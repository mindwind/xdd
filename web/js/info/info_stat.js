function stat_info() {
	if (isExist(xdd.id.info_stat_tabs)) {
		refresh(xdd.id.info_stat_tabs, null);
		return;
	}

	Ext.QuickTips.init();

	var head = {
		xtype : 'panel',
		border : false,
		html : '<div class="headline2">' + xdd.lang.info_stat + '</div>'
	}

	// -------------------------------------------------------- info stat form

	var store = new Ext.data.Store({
				proxy : new Ext.data.HttpProxy({
							url : 'info/listInfoYear.do',
							method : 'GET'
						}),
				reader : new Ext.data.ArrayReader({}, [{
									name : 'value'
								}, {
									name : 'text'
								}])
			});
	store.load();
	store.on('load', function(ds, records, o) {
				if (records.length > 0) {
					combo.setValue(records[0].data.value);
				}
			});
	var combo = new Ext.form.ComboBox({
				store : store,
				mode : 'remote',
				triggerAction : 'all',
				valueField : 'value',
				displayField : 'text',
				fieldLabel : xdd.lang.year,
				hiddenName : 'year',
				forceSelection : true,
				typeAhead : true,
				width : 150
			});

	var submit = {
		xtype : 'button',
		text : xdd.lang.stat,
		handler : form_handler
	};

	function form_handler() {
		info_store.load({
					params : {
						year : combo.getValue()
					}
				});
	}

	var qc = {
		layout : 'column',
		border : false,
		items : [{
					columnWidth : .29,
					layout : 'form',
					items : [combo]
				}, {
					columnWidth : .71,
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

	// --------------------------------------------------------- info stat grid

	var info_cm = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), {
				header : xdd.lang.user,
				dataIndex : 'user',
				width : 80
			}, {
				header : xdd.lang.mon_jan,
				dataIndex : 'v1',
				width : 50
			}, {
				header : xdd.lang.mon_feb,
				dataIndex : 'v2',
				width : 50
			}, {
				header : xdd.lang.mon_mar,
				dataIndex : 'v3',
				width : 50
			}, {
				header : xdd.lang.mon_apr,
				dataIndex : 'v4',
				width : 50
			}, {
				header : xdd.lang.mon_may,
				dataIndex : 'v5',
				width : 50
			}, {
				header : xdd.lang.mon_jun,
				dataIndex : 'v6',
				width : 50
			}, {
				header : xdd.lang.mon_july,
				dataIndex : 'v7',
				width : 50
			}, {
				header : xdd.lang.mon_aug,
				dataIndex : 'v8',
				width : 50
			}, {
				header : xdd.lang.mon_sep,
				dataIndex : 'v9',
				width : 50
			}, {
				header : xdd.lang.mon_oct,
				dataIndex : 'v10',
				width : 50
			}, {
				header : xdd.lang.mon_nov,
				dataIndex : 'v11',
				width : 50
			}, {
				header : xdd.lang.mon_dec,
				dataIndex : 'v12',
				width : 50
			}, {
				header : xdd.lang.total,
				dataIndex : 'total',
				width : 70
			}]);

	var info_store = new Ext.data.Store({
				proxy : new Ext.data.HttpProxy({
							url : 'info/statInfo.do',
							method : 'GET'
						}),
				reader : new Ext.data.JsonReader({}, [{
									name : 'user'
								}, {
									name : 'v1'
								}, {
									name : 'v2'
								}, {
									name : 'v3'
								}, {
									name : 'v4'
								}, {
									name : 'v5'
								}, {
									name : 'v6'
								}, {
									name : 'v7'
								}, {
									name : 'v8'
								}, {
									name : 'v9'
								}, {
									name : 'v10'
								}, {
									name : 'v11'
								}, {
									name : 'v12'
								}, {
									name : 'total'
								}])
			});
	info_store.on('beforeload', function(store) {
				Ext.apply(store.baseParams, {
							year : combo.getValue()
						});
			});

	var info_stat_grid = new Ext.grid.GridPanel({
				style : 'margin-top: 15px; margin-left: 23px',
				width : 750,
				autoHeight : true,
				store : info_store,
				loadMask : true,
				stripeRows : true,
				cm : info_cm
			});

	var tabs = new Ext.TabPanel({
				id : xdd.id.info_stat_tabs,
				width : 800,
				height : 425,
				activeTab : 0,
				plain : true,
				style : 'margin-top: 25px; margin-left: 25px',
				defaults : {
					autoScroll : true
				},
				items : [{
							title : xdd.lang.stat,
							items : [head, form, info_stat_grid]
						}]
			});

	push(xdd.id.info_stat_tabs, tabs);

}