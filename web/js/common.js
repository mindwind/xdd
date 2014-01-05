/**
 * 中心Panel区域刷新方法
 * 
 * @param String
 *            id 传入子panel对象id
 * @param object
 *            o 传入子对象
 */
function refresh(id, o) {
	var cp = Ext.getCmp(xdd.id.center_panel);
	for (var i = 0; i < cp.items.length; i++) {
		var ip = cp.get(i);
		ip.hide();
	}

	var tp = cp.findById(id);
	if (!tp) {
		cp.add(o);
		cp.doLayout();
	} else {
		tp.show();
	}
}

/**
 * 向中心Panel区域添加新对象,并隐藏其他对象
 * 
 * @param o
 *            传入子对象
 */
function push(o) {
	var cp = Ext.getCmp(xdd.id.center_panel);
	for (var i = 0; i < cp.items.length; i++) {
		var ip = cp.get(i);
		ip.hide();
	}
	cp.add(o);
	cp.doLayout();
}

/**
 * 检查该id对象是否存在
 * 
 * @param id
 *            传入子panel对象id
 */
function isExist(id) {
	var cp = Ext.getCmp(xdd.id.center_panel);
	var tp = cp.findById(id);
	if (tp) {
		return true;
	}
	return false;
}

/**
 * 获取当前页面URL参数
 * 
 * @return
 */
function getUrlPara() {
	var paraArr = new Array();
	var para = new Array();
	var url = window.location.href;
	var idx = url.indexOf("?");
	if (idx > 0) {
		var paraStr = url.substring(idx + 1);
		para = paraStr.split("&");
		for (var i = 0; i < para.length; i++) {
			var tmp = new Array();
			tmp = para[i].split("=");
			var obj = new Object();
			obj.pname = tmp[0];
			obj.pvalue = tmp[1];
			paraArr[i] = obj;
		}
	}
	return paraArr;
}
