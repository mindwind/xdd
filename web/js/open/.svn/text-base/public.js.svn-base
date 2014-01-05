Ext.onReady(paint);

function paint() {
	Ext.QuickTips.init();

	var cm = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), {
				header : xdd.lang.index,
				dataIndex : 'id',
				width : 70,
				sortable : true
			}, {
				header : xdd.lang.title,
				dataIndex : 'title',
				width : 300
			}, {
				header : xdd.lang.type,
				dataIndex : 'group',
				width : 80
			}, {
				header : xdd.lang.org_unit,
				dataIndex : 'org',
				width : 100
			}, {
				header : xdd.lang.public_time,
				dataIndex : 'time',
				width : 80
			}]);

	var s = new Ext.data.Store({
				proxy : new Ext.data.HttpProxy({
							url : '../info/listPublicInfo.do',
							method : 'GET'
						}),
				reader : new Ext.data.JsonReader({
							totalProperty : 'totalProperty',
							root : 'root'
						}, [{
									name : 'id'
								}, {
									name : 'title'
								}, {
									name : 'group'
								}, {
									name : 'org'
								}, {
									name : 'time'
								}])
			});

	var grid = new Ext.grid.GridPanel({
				style : 'margin: 20 10 20 10',
				width : 670,
				autoHeight : true,
				store : s,
				loadMask : true,
				stripeRows : true,
				cm : cm,
				bbar : new Ext.PagingToolbar({
							pageSize : 10,
							store : s,
							displayInfo : true,
							displayMsg : xdd.lang.page_tip,
							emptyMsg : xdd.lang.no_item
						})
			});
	grid.render('public_grid');
	s.load({
				params : {
					start : 0,
					limit : 10
				}
			});
}