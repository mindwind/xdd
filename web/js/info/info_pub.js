function pub_info() {
	Ext.QuickTips.init();

	var form = get_form();

	var head = {
		xtype : 'panel',
		border : false,
		html : '<div class="headline2">' + xdd.lang.info_pub + '</div>'
	}

	var foot = {
		xtype : 'panel',
		border : false,
		style : 'margin-top: 10px; margin-left: 23px; margin-right: 20px; margin-bottom: 20px',
		html : '<div class="usertip"> ' + xdd.lang.tip + '<br>'
				+ xdd.lang.info_tip_desc1 + '<br>' + xdd.lang.info_tip_desc2
				+ '<br>' + xdd.lang.info_tip_desc3 + '</div>'
	}

	var tabs = new Ext.TabPanel({
				id : xdd.id.info_pub_tabs,
				width : 800,
				height : 425,
				activeTab : 0,
				plain : true,
				style : 'margin-top: 25px; margin-left: 25px',
				defaults : {
					autoScroll : true
				},
				items : [{
							title : xdd.lang.pub,
							items : [head, form, foot]
						}, {
							title : xdd.lang.query,
							listeners : {
								activate : query_info
							}
						}]
			});

	refresh(xdd.id.info_pub_tabs, tabs);

	function get_form() {
		var title = new Ext.form.TextField({
					xtype : 'textfield',
					fieldLabel : xdd.lang.title,
					name : 'title',
					allowBlank : false,
					minLength : 1,
					maxLength : 150,
					width : 510
				});

		var pub_time = new Ext.form.DateField({
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
					if (value == '22' || value == '71') {
						img.enable();
					} else {
						img.disable();
					}
				});

		var img = new Ext.form.TextField({
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

		var submit_audit = {
			layout : 'form',
			style : 'margin-left:5px;',
			items : [{
						xtype : 'button',
						text : xdd.lang.submit + xdd.lang.audit,
						handler : form_handler_audit
					}]
		}

		var save_draft = {
			layout : 'form',
			style : 'margin-left:5px;',
			items : [{
						xtype : 'button',
						text : xdd.lang.save + xdd.lang.draft,
						handler : form_handler_draft
					}]
		}

		var gcs = {
			layout : 'column',
			border : false,
			items : [{
						columnWidth : .8,
						layout : 'form',
						items : [img]
					}, {
						columnWidth : .1,
						layout : 'form',
						items : [save_draft]
					}, {
						columnWidth : .1,
						layout : 'form',
						items : [submit_audit]
					}]
		};

		function form_handler_draft() {
			form.getForm().url = 'info/pub_draft.do';
			setForm()
			form.getForm().submit({
						success : function() {
							Ext.Msg.alert(xdd.lang.tip,
									xdd.lang.info_pub_tip_desc);
							resetForm();
						},
						failure : function(form, action) {
							Ext.Msg.alert(xdd.lang.error_tip,
									action.result.error);
						}
					});
		}

		function form_handler_audit() {
			form.getForm().url = 'info/pub_audit.do';
			setForm();
			form.getForm().submit({
						success : function() {
							Ext.Msg.alert(xdd.lang.tip,
									xdd.lang.info_pub_tip_desc);
							resetForm();
						},
						failure : function(form, action) {
							Ext.Msg.alert(xdd.lang.error_tip,
									action.result.error);
						}
					});
		}

		function resetForm() {
			title.reset();
			img.reset();
			pub_time.reset();
			var editor = FCKeditorAPI.GetInstance("infoEditor")
			editor.SetHTML("");
		}

		function setForm() {
			var ehtml = FCKeditorAPI.GetInstance("infoEditor").GetXHTML(true);
			document.getElementById("infoEditor").value = ehtml;
			img_name.setValue(img.getValue());
		}

		var fck = new FCKeditor("infoEditor");
		fck.BasePath = "/xdd/thirdparty/FCKeditor-2.6.4.1/";
		fck.Height = 800;
		var fck_html = fck.CreateHtml();
		var fck = {
			xtype : 'panel',
			border : false,
			html : fck_html
		}

		var form = new Ext.form.FormPanel({
					url : 'info/pub_draft.do',
					method : 'POST',
					labelAlign : 'right',
					labelWidth : 55,
					frame : true,
					width : 740,
					fileUpload : true,
					style : 'margin-top: 15px; margin-left: 23px',
					region : 'center',
					items : [{
								layout : 'form',
								items : [title, pub_time, group_combo, gcs, fck, img_name]
							}]
				});

		return form;
	}
}