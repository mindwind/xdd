Ext.onReady(paint);

function paint() {
	var data1 = [
			['<a href="#">农贸市场内私自建房扰民乱民<a>', '反映', '互联网', '2009-08-27', '办结'],
			['<a href="#">请客运公司重新派车送乘客到目的地</a>', '求助', '电话', '2009-08-19', '办结'],
			['<a href="#">喜德县冕山镇某洗矿厂乱排污水<a>', '反映', '电话', '2009-07-20', '办结'],
			['<a href="#">网吧、电子游戏室都有接纳未成人的现象<a>', '反映', '电话', '2009-07-08', '办结'],
			['<a href="#">电视收视费为何涨价<a>', '反映', '互联网', '2009-06-02', '办结'],
			['<a href="#">何时才能更改姓名<a>', '求助', '电话', '2009-06-02', '办结'],
			['<a href="#">换发二代身份证问题<a>', '反映', '电话', '2009-05-28', '办结'],
			['<a href="#">没有住房担保怎样办理住房公积金贷款<a>', '咨询', '电话', '2009-05-08', '办结'],
			['<a href="#">如何更换摩托车后车牌<a>', '咨询', '电话', '2009-04-30', '办结'],
			['<a href="#"> 惠民工程何时到我村<a>', '反映', '电话', '2009-04-28', '办结'],
			['<a href="#">咨询大学生创业优惠条件<a>', '反映', '电话', '2009-04-20', '办结'],
			['<a href="#">事业单位绩效工资何时才执行？<a>', '咨询', '电话', '2009-04-08', '办结'],
			['<a href="#">咨询公积金贷款利率是多少<a>', '咨询', '电话', '2009-04-20', '办结'],
			['<a href="#">咨询关于非转农的相关政策<a>', '咨询', '电话', '2009-03-30', '办结'],
			['<a href="#">咨询惠农政策<a>', '咨询', '电话', '2009-03-28', '办结'],
			['<a href="#">请制止商家把摊位摆在街上<a>', '反映', '电话', '2009-03-12', '办结'],
			['<a href="#">希望有关单位重新设置街灯开关时间<a>', '建议', '互联网', '2009-03-08', '办结']];
	var store1 = new Ext.data.ArrayStore({
				fields : [{
							name : 'title'
						}, {
							name : 'type'
						}, {
							name : 'style'
						}, {
							name : 'date'
						}, {
							name : 'result'
						}]
			});
	store1.loadData(data1);
	var grid1 = new Ext.grid.GridPanel({
				style : 'margin:15 10 0 0',
				store : store1,
				columns : [new Ext.grid.RowNumberer(), {
							header : xdd.lang.title,
							width : 290,
							dataIndex : 'title',
							sortable : true
						}, {
							header : xdd.lang.type,
							width : 62,
							dataIndex : 'type'
						}, {
							header : xdd.lang.style,
							width : 62,
							dataIndex : 'style'
						}, {
							header : xdd.lang.pub_time,
							width : 124,
							dataIndex : 'date',
							sortable : true
						}, {
							header : xdd.lang.result,
							width : 62,
							dataIndex : 'result'
						}],
				autoHeight : true,
				width : 620,
				border : true,
				stripeRows : true,
				bbar : new Ext.PagingToolbar({
							pageSize : 17,
							store : store1,
							displayInfo : true,
							displayMsg : xdd.lang.page_tip,
							emptyMsg : xdd.lang.no_item
						})
			});
	grid1.render('ts_grid');
}