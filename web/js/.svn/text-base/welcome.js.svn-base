Ext.onReady(paint);

function paint() {

	var cp = new Ext.Panel({
				id : xdd.id.center_panel,
				border : false
			});
	var wp = new Ext.Panel({
				border : false,
				html : '<div id="welcome">' + xdd.lang.welcome + '</div>'
			});
	cp.add(wp);

	var viewport = new Ext.Viewport({
				layout : 'border',
				items : [{
							region : 'north',
							contentEl : 'header',
							height : 90,
							border : false
						}, {
							region : 'south',
							contentEl : 'footer',
							height : 20,
							border : false
						}, {
							region : 'east',
							html : '',
							width : 0,
							border : false
						}, {
							region : 'west',
							contentEl : 'west',
							width : 150,
							border : false
						}, {
							region : 'center',
							border : false,
							items : [cp]
						}]
			});
}