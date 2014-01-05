Ext.onReady(function() {
			var psize = 20;

			var paraArr = getUrlPara();
			var gid = paraArr[0].pvalue;

			var store = new Ext.data.Store({
						proxy : new Ext.data.HttpProxy({
									url : 'info/info_list.do',
									method : 'POST'
								}),
						baseParams : {
							gid : gid
						},
						reader : new Ext.data.JsonReader({
									totalProperty : 'totalProperty',
									root : 'root'
								}, [{
											name : 'title'
										}, {
											name : 'date'
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
									gid : gid
								});
					});

			var cm = new Ext.grid.ColumnModel([{
						header : xdd.lang.title,
						dataIndex : 'title',
						width : 9
					}, {
						header : xdd.lang.datetime,
						dataIndex : 'date',
						width : 1
					}]);

			var grid = new Ext.grid.GridPanel({
						style : 'margin:10 0 10 0;',
						store : store,
						autoScroll : false,
						autoHeight : true,
						stripeRows : false,
						enableHdMenu : false,
						enableColumnMove : false,
						enableColumnResize : false,
						hideHeaders : true,
						autoExpandColumn : 'date',
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
			grid.render('groupInfoList');

		});