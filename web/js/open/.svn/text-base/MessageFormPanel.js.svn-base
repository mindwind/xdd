

org.craft.xdd.open.MessageFormPanel = Ext.extend(Ext.form.FormPanel, {
	title : xdd.lang.input_form,
	method : 'POST',
	labelAlign : 'right',
	labelWidth : 60,
	frame : true,
	border : true,
	buttonAlign : 'center',
	style : 'margin:5 10 0 0;',
	initComponent : function() {
		var form = this;

		// 来源
		var name = new Ext.form.TextField({
					fieldLabel : xdd.lang.name,
					name : 'from',
					width : 500,
					msgTarget : 'side',
					allowBlank : false,
					maxLength : 5
				});

		// 标题
		var title = new Ext.form.TextField({
					fieldLabel : xdd.lang.title,
					name : 'title',
					width : 500,
					msgTarget : 'side',
					allowBlank : false,
					maxLength : 32
				});

		// e-mail
		var email = new Ext.form.TextField({
					fieldLabel : xdd.lang.email,
					name : 'email',
					width : 500,
					msgTarget : 'side',
					allowBlank : false,
					vtype : 'email',
					maxLength : 32
				});

		// 地址
		var address = new Ext.form.TextField({
					fieldLabel : xdd.lang.address,
					name : 'address',
					width : 500,
					msgTarget : 'side',
					allowBlank : false,
					maxLength : 64
				});

		// 电话
		var tel = new Ext.form.TextField({
					fieldLabel : xdd.lang.tel,
					name : 'tel',
					width : 500,
					msgTarget : 'side',
					allowBlank : false,
					regex : /^[0-9]*$/,
					regexText : xdd.lang.num_required,
					maxLength : 16
				});

		// 传真
		var fax = new Ext.form.TextField({
					fieldLabel : xdd.lang.fax,
					name : 'fax',
					width : 500,
					msgTarget : 'side',
					allowBlank : true,
					regex : /^[0-9]*$/,
					regexText : xdd.lang.num_required,
					maxLength : 16
				});

		// 分类
		var store = new Ext.data.Store({
					proxy : new Ext.data.HttpProxy({
								url : 'open/messageType_list.do',
								method : 'GET'
							}),
					reader : new Ext.data.ArrayReader({}, [{
										name : 'id'
									}, {
										name : 'name'
									}])
				});
		store.load();
		store.on('load', function(ds, records, o) {
					if (records.length > 0) {
						type.setValue(records[0].data.id);
					}
				});

		var type = new Ext.form.ComboBox({
					store : store,
					mode : 'remote',
					triggerAction : 'all',
					valueField : 'id',
					displayField : 'name',
					fieldLabel : xdd.lang.type,
					hiddenName : 'messageTypeId',
					forceSelection : true,
					typeAhead : true,
					width : 500,
					editable : false,
					allowBlank : false
				});

		// 内容
		var content = new Ext.form.TextArea({
					fieldLabel : xdd.lang.content,
					name : 'content',
					width : 640,
					height : 200,
					msgTarget : 'side',
					allowBlank : false,
					maxLength : 2000
				});

		// 验证码 Field
		var vcode = new Ext.form.TextField({
					fieldLabel : xdd.lang.vcode,
					name : 'vcode',
					width : 120,
					msgTarget : 'side',
					allowBlank : false
				});

		// 验证码图片
		var vcodePic = {
			xtype : 'panel',
			html : '<img id="verifypic", src="../cowork/validationCodeServlet">&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:newverifypic();">'
					+ xdd.lang.not_clear + '</a>',
			style : 'margin-left: 65px'
		}

		var confirm = {
			xtype : 'button',
			text : xdd.lang.confirm,
			handler : function() {
				if (form.getForm().isValid()) {
					form.getForm().submit({
						url : 'open/message_add.do',
						success : function(form1, action) {
							Ext.Msg.show({
										title : xdd.lang.tip,
										msg : action.result.msg,
										buttons : Ext.Msg.OK,
										minWidth : 300,
										maxwidth : 300
									});
							form.getForm().reset();
							newverifypic();
						},
						failure : function(form1, action) {
							Ext.Msg.alert(xdd.lang.error_tip,
									action.result.error);
						}
					});
				}
			}
		};

		this.items = [name, title, email, address, tel, fax, type, content,
				vcode, vcodePic];
		this.buttons = [confirm]

		org.craft.xdd.open.MessageFormPanel.superclass.initComponent.call(this);
	}

});

Ext.reg('org.craft.xdd.open.MessageFormPanel',
		org.craft.xdd.open.MessageFormPanel);