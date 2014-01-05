

org.craft.xdd.open.MessageWindow = Ext.extend(Ext.Window, {
			width : 500,
			autoHeight : true,
			closeAction : 'close',
			modal : true,
			draggable : false,
			resizable : false,
			messageId : '',
			initComponent : function() {
				var win = this;

				// message id
				var id = new Ext.form.Hidden({
							name : 'id',
							value : this.messageId
						});

				// answer
				var answer = new Ext.form.TextArea({
							fieldLabel : xdd.lang.answer,
							name : 'result',
							width : 400,
							height : 200,
							maxLength : 2000
						});

				var store = new Ext.data.Store({
							proxy : new Ext.data.HttpProxy({
										url : 'open/message_load.do'
									}),
							baseParams : {
								id : this.messageId
							},
							reader : new Ext.data.JsonReader({}, ['id','result']),
							remoteSort : false
						});
				store.load();
				store.on('load', function() {
							answer.setValue(store.getAt(0).get('result'));
						});

				// 确认button
				var confirm = new Ext.Button({
							text : xdd.lang.confirm,
							handler : function() {
								form.getForm().submit({
									success : function() {
										win.close();
										win.grid.store.reload();
									},
									failure : function(form, action) {
										Ext.Msg.alert(craft.lang.error_tip,
												action.result.msg);
									}
								});
							}
						});

				// 取消button
				var cancel = new Ext.Button({
							text : xdd.lang.cancel,
							handler : function() {
								win.close();
							}
						});

				// form
				var form = new Ext.form.FormPanel({
							url : 'open/message_handle.do',
							method : 'POST',
							labelAlign : 'right',
							labelWidth : 60,
							frame : true,
							width : this.width,
							autoHeight : true,
							buttonAlign : "center",
							items : [{
										layout : 'form',
										items : [id, answer]
									}],
							buttons : [confirm, cancel]
						});

				this.items = [form];
				org.craft.xdd.open.MessageWindow.superclass.initComponent
						.call(this);
			}

		});

Ext.reg('org.craft.xdd.open.MessageWindow', org.craft.xdd.open.MessageWindow);