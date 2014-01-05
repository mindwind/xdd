

org.craft.xdd.open.MessagePanel = Ext.extend(Ext.Panel, {
	id : 'org.xdd.open.message.panel',
	border : false,
	style : 'margin-top: 20px; margin-left: 20px; margin-right: 20px;',
	initComponent : function() {
		var panel = this;

		// query toolbar
		var nameField = new Ext.form.TextField({
					name : 'title'
				});
		var stateCombo = new Ext.form.ComboBox({
					store : new Ext.data.ArrayStore({
								fields : ['code', 'state'],
								data : [['0', xdd.lang.wait],
										['1', xdd.lang.finish]]
							}),
					valueField : 'code',
					displayField : 'state',
					fieldLabel : xdd.lang.state,
					hiddenName : 'stateStr',
					mode : 'local',
					triggerAction : 'all',
					emptyText : xdd.lang.all,
					forceSelection : true,
					typeAhead : true,
					width : 100
				});
		var queryBar = new Ext.Toolbar({
			style : 'border-top:1px solid #99bbe8;border-left:1px solid #99bbe8;border-right:1px solid #99bbe8;',
			items : [{
						xtype : 'tbtext',
						text : xdd.lang.title
					}, nameField, '-', stateCombo, '-', {
						text : xdd.lang.query,
						icon : "images/query.gif",
						handler : function() {
							store.load({
										params : {
											start : 0,
											limit : 10
										}
									});
						}
					}]
		});

		// grid
		var store = new Ext.data.Store({
					proxy : new Ext.data.HttpProxy({
								url : 'open/message_list.do',
								method : 'POST'
							}),
					baseParams : {
						name : nameField.getValue(),
						stateStr : stateCombo.getValue()
					},
					reader : new Ext.data.JsonReader({
								totalProperty : 'totalProperty',
								root : 'root'
							}, [{
										name : 'title'
									}, {
										name : 'name'
									}, {
										name : 'datetime'
									}, {
										name : 'type'
									}, {
										name : 'state'
									}, {
										name : 'id'
									}])
				});
		store.on('beforeload', function(store) {
					Ext.apply(store.baseParams, {
								title : nameField.getValue(),
								stateStr : stateCombo.getValue(),
								start : 0,
								limit : 10
							});
				});
		var sm = new Ext.grid.CheckboxSelectionModel({
					singleSelect : true
				});
		var cm = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), sm, {
					header : xdd.lang.title,
					dataIndex : 'title',
					width : 4,
					sortable : true
				}, {
					header : xdd.lang.name,
					dataIndex : 'name',
					width : 2
				}, {
					header : xdd.lang.datetime,
					dataIndex : 'datetime',
					width : 2
				}, {
					header : xdd.lang.type,
					dataIndex : 'type',
					width : 1
				}, {
					header : xdd.lang.state,
					dataIndex : 'state',
					width : 1
				}, {
					header : '',
					dataIndex : 'id',
					width : '0%',
					hidden : true
				}]);

		var handleButton = new Ext.Button({
					text : xdd.lang.handle,
					icon : "images/handle.png",
					disabled : true
				});
		var removeButton = new Ext.Button({
					text : xdd.lang.del,
					icon : "images/remove.gif",
					disabled : true
				});
		var detailButton = new Ext.Button({
					text : xdd.lang.detail,
					icon : "images/detail.png",
					disabled : true
				});
		var grid = new Ext.grid.GridPanel({
					style : 'margin-top: 10px; margin-bottom: 20px',
					autoHeight : true,
					cm : cm,
					sm : sm,
					store : store,
					viewConfig : {
						forceFit : true
					},
					tbar : new Ext.Toolbar({
								items : [handleButton, '-', detailButton, '-',
										removeButton]
							}),
					bbar : new Ext.PagingToolbar({
								pageSize : 10,
								store : store,
								displayInfo : true,
								displayMsg : xdd.lang.page_tip,
								emptyMsg : xdd.lang.no_item
							})
				});

		// events
		handleButton.on("click", function() {
					var win = new org.craft.xdd.open.MessageWindow({
								messageId : grid.sid,
								title : grid.stitle,
								grid : grid
							});
					win.show().center();
				});
		detailButton.on("click", function() {
					var link = 'open/message_view.do?id=' + grid.sid + '&listType=detail';
					window.open(link);
				});
		removeButton.on("click", function() {
					Ext.MessageBox.confirm(xdd.lang.del, xdd.lang.del_tip,
							function(button) {
								Ext.Ajax.request({
											url : 'open/message_remove.do',
											params : {
												id : grid.sid
											},
											success : function(response) {
												var result = Ext
														.decode(response.responseText);
												var succ = result.success + '';
												if (succ == 'true') {
													grid.store.reload();
												} else {
													Ext.Msg.alert(
															xdd.lang.error_tip,
															result.msg);
												}
											},
											failure : function(response) {
												Ext.Msg.alert(
														xdd.lang.error_tip,
														xdd.lang.connect_error);
											}
										});
							})
				});
		sm.on('rowselect', function(self, rowIndex, record) {
					handleButton.enable();
					removeButton.enable();
					detailButton.enable();
					grid.sid = record.get('id');
					grid.stitle = record.get('title');
				});
		sm.on('rowdeselect', function(self, rowIndex, record) {
					handleButton.disable();
					removeButton.disable();
					detailButton.disable();
					grid.sid = '';
				});

		this.items = [queryBar, grid];
		org.craft.xdd.open.MessagePanel.superclass.initComponent.call(this);
	}

});

Ext.reg('org.craft.xdd.open.MessagePanel', org.craft.xdd.open.MessagePanel);