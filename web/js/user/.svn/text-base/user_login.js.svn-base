Ext.onReady(paint);

function paint() {
//	Ext.QuickTips.init();

	var headline = {
		xtype : 'panel',
		html : '<div class="headline">' + xdd.lang.user + xdd.lang.login
				+ '</div>'
	}

	var username = {
		xtype : 'textfield',
		fieldLabel : xdd.lang.username,
		name : 'user.id',
		allowBlank : false,
		minLength : 2,
		maxLength : 20
	}

	var password = {
		xtype : 'textfield',
		inputType : 'password',
		fieldLabel : xdd.lang.password,
		name : 'user.password',
		allowBlank : false,
		minLength : 6,
		maxLength : 20
	}

//	var checkbox = {
//		layout : 'form',
//		style : 'margin-left: 40px',
//		items : [{
//					xtype : 'checkbox',
//					boxLabel : xdd.lang.remember,
//					checked : false,
//					hideLabel : true,
//					name : 'check'
//				}]
//	}

	var login = {
		xtype : 'button',
		text : xdd.lang.login,
		handler : form_handler
	}

	var forgetPwd = {
		xtype : 'panel',
		style : 'margin-left: 10px',
		html : '<a href="">' + xdd.lang.forget_pwd + '</a>'
	}

	var submit = {
		layout : 'column',
		style : 'margin-left: 78px',
		items : [login, forgetPwd]
	}

	var form = new Ext.form.FormPanel({
				url : 'login_enter.do',
				method : 'POST',
				labelAlign : 'right',
				labelWidth : 50,
				frame : true,
				width : 220,
				style : 'margin-top: 30px',
				region : 'east',
				items : [{
							layout : 'form',
							items : [headline, username, password,
									submit]
						}]
			});

	function form_handler() {
		form.getForm().submit({
					success : function() {
						document.location.href = '../welcome.do';
					},
					failure : function(form, action) {
						Ext.Msg.alert(xdd.lang.error_tip, action.result.error);
					}
				});
	}

	// layout
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
							region : 'center',
							contentEl : 'center',
							border : false
						}, {
							region : 'east',
							border : false,
							width : 250,
							items : [form]
						}]
			});

};