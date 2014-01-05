insert into XDD_PRIVILEGE (ID, TYPE, PRIVILEGE_POINT, REMARK)
values ('1', 'user', '/user/register.do', '注册用户');
insert into XDD_PRIVILEGE (ID, TYPE, PRIVILEGE_POINT, REMARK)
values ('10', 'info_audit', '/info/passInfo.do', '审核通过');
insert into XDD_PRIVILEGE (ID, TYPE, PRIVILEGE_POINT, REMARK)
values ('11', 'info_audit', '/info/denyInfo.do', '审核退回');
insert into XDD_PRIVILEGE (ID, TYPE, PRIVILEGE_POINT, REMARK)
values ('12', 'info_pub', '/info/submitInfo.do', '提交审核');
insert into XDD_PRIVILEGE (ID, TYPE, PRIVILEGE_POINT, REMARK)
values ('13', 'info_pub', '/info/delInfo.do', '删除信息');
insert into XDD_PRIVILEGE (ID, TYPE, PRIVILEGE_POINT, REMARK)
values ('14', 'info_pub', '/info/pub_draft.do', '发布(保存草稿)');
insert into XDD_PRIVILEGE (ID, TYPE, PRIVILEGE_POINT, REMARK)
values ('15', 'info_pub', '/user/editInfo.do', '编辑信息(发布)');
insert into XDD_PRIVILEGE (ID, TYPE, PRIVILEGE_POINT, REMARK)
values ('16', 'info_audit', '/user/editInfo.do', '编辑信息(审核)');
insert into XDD_PRIVILEGE (ID, TYPE, PRIVILEGE_POINT, REMARK)
values ('17', 'info_pub', '/info/pub_audit.do', '发布(提交审核)');
insert into XDD_PRIVILEGE (ID, TYPE, PRIVILEGE_POINT, REMARK)
values ('18', 'info_stat', '/info/statInfo.do', '信息统计');
insert into XDD_PRIVILEGE (ID, TYPE, PRIVILEGE_POINT, REMARK)
values ('2', 'user', '/user/moidfyUser.do', '修改用户');
insert into XDD_PRIVILEGE (ID, TYPE, PRIVILEGE_POINT, REMARK)
values ('4', 'user', '/user/resetPassword.do', '重置密码');
insert into XDD_PRIVILEGE (ID, TYPE, PRIVILEGE_POINT, REMARK)
values ('3', 'user', '/user/delUser.do', '删除用户');
insert into XDD_PRIVILEGE (ID, TYPE, PRIVILEGE_POINT, REMARK)
values ('5', 'user', '/user/addRole.do', '添加角色');
insert into XDD_PRIVILEGE (ID, TYPE, PRIVILEGE_POINT, REMARK)
values ('6', 'user', '/user/modifyRole.do', '修改角色');
insert into XDD_PRIVILEGE (ID, TYPE, PRIVILEGE_POINT, REMARK)
values ('7', 'user', '/user/delRole.do', '删除角色');
insert into XDD_PRIVILEGE (ID, TYPE, PRIVILEGE_POINT, REMARK)
values ('8', 'user', '/user/assignPrivilege.do', '分配权限');
insert into XDD_PRIVILEGE (ID, TYPE, PRIVILEGE_POINT, REMARK)
values ('9', 'user', '/user/callbackPrivilege.do', '收回权限');
commit;

