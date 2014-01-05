var edit_win;

function edit_info(id) {
	if (!edit_win) {
		edit_win = create(id);
	}
	Ext.Ajax.request({
				url : 'info/loadInfo.do',
				success : function(response) {
					var result = Ext.decode(response.responseText);
					var info_id = Ext.getCmp(xdd.id.info_edit_id);
					info_id.setValue(id);
					var title = Ext.getCmp(xdd.id.info_edit_title);
					title.setValue(result.title);
					var pub_time = Ext.getCmp(xdd.id.info_edit_pub_time);
					pub_time.setValue(result.pubTime);
					var group_combo = Ext.getCmp(xdd.id.info_edit_group_combo);
					group_combo.setValue(result.groupId);
					if (result.groupId == '22') {
						var img = Ext.getCmp(xdd.id.info_edit_img);
						img.enable();
					}
					var editor = FCKeditorAPI.GetInstance("infoEditor2");
					if (!editor) {
						var task = new Ext.util.DelayedTask(function() {
									editor = FCKeditorAPI
											.GetInstance("infoEditor2");
								});
						task.delay(3000);
					}
					if (editor) {
						editor.SetHTML(result.content);
					} else {
						alert("editor is null, please retry!");
					}
				},
				params : {
					id : id
				}
			});
	edit_win.show();

	function create(id) {
		Ext.QuickTips.init();

		var info_id = new Ext.form.Hidden({
					id : xdd.id.info_edit_id,
					name : 'id',
					value : id
				})

		var title = new Ext.form.TextField({
					id : xdd.id.info_edit_title,
					xtype : 'textfield',
					fieldLabel : xdd.lang.title,
					name : 'title',
					allowBlank : false,
					minLength : 1,
					maxLength : 150,
					width : 510
				});

		var pub_time = new Ext.form.DateField({
					id : xdd.id.info_edit_pub_time,
					fieldLabel : xdd.lang.pub_time,
					name : 'pubTime',
					format : 'Y-m-d',
					width : 510,
					allowBlank : true
				});

		var group_store = new Ext.data.Store({
					proxy : new Ext.data.HttpProxy({
								url : 'info/listInfoGroup.do?level=1',
								method : 'GET'
							}),
					reader : new Ext.data.ArrayReader({}, [{
										name : 'id'
									}, {
										name : 'name'
									}])
				});
		group_store.load();
		group_store.on('load', function(ds, records, o) {
					if (records.length > 0) {
						group_combo.setValue(records[0].data.id);
					}
				});
		var group_combo = new Ext.form.ComboBox({
					id : xdd.id.info_edit_group_combo,
					store : group_store,
					mode : 'remote',
					triggerAction : 'all',
					valueField : 'id',
					displayField : 'name',
					fieldLabel : xdd.lang.info_group,
					hiddenName : 'groupId',
					forceSelection : true,
					typeAhead : true,
					width : 510
				});

		group_combo.on('select', function(combo) {
					var value = combo.getValue();
					if (value == '22') {
						img.enable();
					} else {
						img.disable();
					}
				});

		var img = new Ext.form.TextField({
					id : xdd.id.info_edit_img,
					fieldLabel : xdd.lang.img_cover,
					name : 'img',
					inputType : 'file',
					width : 510,
					disabled : true
				});

		var img_name = new Ext.form.TextField({
					name : 'uploadFileName',
					inputType : 'hidden'
				});

		var fck = new FCKeditor("infoEditor2");
		fck.BasePath = "/xdd/thirdparty/FCKeditor-2.6.4.1/";
		fck.Height = 320;
		var fck_html = fck.CreateHtml();
		var fck_panel = new Ext.Panel({
					border : false,
					html : fck_html
				});

		var confirm_btn = {
			xtype : 'button',
			text : xdd.lang.confirm,
			handler : form_handler
		};

		function form_handler() {
			setForm();
			form.getForm().submit({
						success : function() {
							var g1 = Ext.getCmp(xdd.id.info_grid);
							var g2 = Ext.getCmp(xdd.id.info_audit_grid);
							if (g1) {
								g1.store.reload();
							}
							if (g2) {
								g2.store.reload();
							}
							resetForm();
							win.hide();
						},
						failure : function(form, action) {
							Ext.Msg.alert(xdd.lang.error_tip,
									action.result.error);
						}
					});
		}

		function setForm() {
			var ehtml = FCKeditorAPI.GetInstance("infoEditor2").GetXHTML(true);
			document.getElementById("infoEditor2").value = ehtml;
			img_name.setValue(img.getValue());
		}

		var cancel_btn = {
			xtype : 'button',
			text : xdd.lang.cancel,
			handler : function() {
				resetForm();
				win.hide();
			}
		};

		function resetForm() {
			info_id.reset();
			title.reset();
			img.reset();
			pub_time.reset();
			group_combo.reset();
			var editor = FCKeditorAPI.GetInstance("infoEditor2")
			editor.SetHTML("");
		}

		var form = new Ext.form.FormPanel({
					url : 'info/editInfo.do',
					method : 'POST',
					labelAlign : 'right',
					labelWidth : 55,
					frame : true,
					width : 730,
					fileUpload : true,
					items : [{
						layout : 'form',
						items : [info_id, title, pub_time, group_combo, img,
								fck_panel, img_name]
					}],
					buttons : [confirm_btn, cancel_btn],
					buttonAlign : 'center'
				});

		var win = new Ext.Window({
					id : xdd.id.info_edit_win,
					title : xdd.lang.info_edit,
					width : 730,
					height : 500,
					closeAction : 'hide',
					closable : false,
					modal : true,
					draggable : false,
					resizable : false,
					border : false,
					items : [form]
				});
		return win;
	}
}
