Ext.onReady(function() {
			var psize = 14;

			var code = new Ext.form.TextField({
						name : 'qcode'
					});

			var queryBar = new Ext.Toolbar({
						style : 'border:1px solid #e7b9d6;',
						items : [{
									xtype : 'tbtext',
									text : xdd.lang.code
								}, code, '-', {
									text : xdd.lang.query,
									icon : "../images/query.gif",
									handler : function() {
										store.load({
													params : {
														start : 0,
														limit : psize
													}
												});
									}
								}]
					});

			var store = new Ext.data.Store({
						proxy : new Ext.data.HttpProxy({
									url : 'open/message_list.do',
									method : 'POST'
								}),
						baseParams : {
							qcode : code.getValue(),
							listType : 'express'
						},
						reader : new Ext.data.JsonReader({
									totalProperty : 'totalProperty',
									root : 'root'
								}, [{
											name : 'code'
										}, {
											name : 'title'
										}, {
											name : 'type'
										}, {
											name : 'state'
										}, {
											name : 'datetime'
										}])
					});
			store.load({
						params : {
							start : 0,
							limit : psize
						}
					});
			store.on('beforeload', function(store) {
						Ext.apply(store.baseParams, {
									qcode : code.getValue(),
									listType : 'express'
								});
					});

			var cm = new Ext.grid.ColumnModel([{
						header : xdd.lang.code,
						dataIndex : 'code',
						width : 2
					}, {
						header : xdd.lang.title,
						dataIndex : 'title',
						width : 4
					}, {
						header : xdd.lang.type,
						dataIndex : 'type',
						width : 1
					}, {
						header : xdd.lang.state,
						dataIndex : 'state',
						width : 1
					}, {
						header : xdd.lang.datetime,
						dataIndex : 'datetime',
						width : 2
					}]);

			var grid = new Ext.grid.GridPanel({
						style : 'margin-top:20;',
						store : store,
						autoScroll : false,
						autoHeight : true,
						stripeRows : false,
						enableHdMenu : false,
						enableColumnMove : false,
						enableColumnResize : false,
						autoExpandColumn : 'datetime',
						viewConfig : {
							forceFit : true,
							scrollOffset : 0
						},
						cm : cm,
						bbar : new Ext.PagingToolbar({
									store : store,
									displayInfo : true,
									pageSize : psize,
									displayMsg : xdd.lang.page_tip,
									emptyMsg : xdd.lang.no_item,
									beforePageText : xdd.lang.page_before,
									afterPageText : xdd.lang.page_after
								})
					});

			var panel = new Ext.Panel({
						style : 'margin:20 20 0 0;',
						items : [queryBar, grid]
					})
			panel.render('messageList');

		});
