function modify_password() {
	Ext.QuickTips.init();

	var old_pwd = {
		layout : 'form',
		items : [{
					xtype : 'textfield',
					fieldLabel : xdd.lang.old_password,
					name : 'oldPwd',
					inputType : 'password',
					allowBlank : false,
					minLength : 6,
					maxLength : 20
				}]
	};

	var new_pwd = {
		layout : 'form',
		items : [{
					xtype : 'textfield',
					fieldLabel : xdd.lang.new_password,
					name : 'newPwd',
					inputType : 'password',
					allowBlank : false,
					minLength : 6,
					maxLength : 20
				}]
	};

	var confirm_pwd = {
		layout : 'form',
		items : [{
					xtype : 'textfield',
					fieldLabel : xdd.lang.confirm_pwd,
					name : 'confirmPwd',
					inputType : 'password',
					allowBlank : false,
					minLength : 6,
					maxLength : 20
				}, {
					columnWidth : .4,
					xtype : 'panel',
					html : xdd.lang.password_tip,
					style : 'color: gray; padding-top: 5px; margin-left: 63px;'
				}]
	};

	var confirm_btn = {
		xtype : 'button',
		text : xdd.lang.confirm,
		handler : form_handler
	};

	function form_handler() {
		form.getForm().submit({
					success : function() {
						win.close();
						Ext.Msg.alert(xdd.lang.tip, xdd.lang.success);
					},
					failure : function(form, action) {
						Ext.Msg.alert(xdd.lang.error_tip, action.result.error);
					}
				});
	}

	var cancel_btn = {
		xtype : 'button',
		text : xdd.lang.cancel,
		handler : function() {
			win.close();
		}
	};

	var form = new Ext.form.FormPanel({
				url : 'user/modifyPassword.do',
				method : 'POST',
				labelAlign : 'right',
				labelWidth : 55,
				frame : true,
				width : 270,
				items : [{
							layout : 'form',
							items : [old_pwd, new_pwd, confirm_pwd]
						}],
				buttons : [confirm_btn, cancel_btn],
				buttonAlign : 'center'
			});

	var win = new Ext.Window({
				title : xdd.lang.modify_password,
				width : 270,
				closeAction : 'close',
				modal : true,
				draggable : false,
				resizable : false,
				border : false,
				items : [form]
			});
	win.show();
}