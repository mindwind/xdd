package org.craft.xdd.view.action.user;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import net.sf.json.JSONArray;

import org.craft.cowork.util.StringUtil;
import org.craft.xdd.XDDConstants;
import org.craft.xdd.dao.user.PrivilegeDao;
import org.craft.xdd.dao.user.RoleDao;
import org.craft.xdd.model.user.Privilege;
import org.craft.xdd.model.user.Role;
import org.craft.xdd.model.user.Privilege.PrivilegeView;
import org.craft.xdd.view.action.JsonAction;

/**
 * <code>Privilege</code> list action.
 * 
 * @author Frank Hu
 * @version 1.0, 2009/9/9
 */
public class PrivilegeListAction extends JsonAction {

	private static final long serialVersionUID = 2582419733199250698L;

	private RoleDao roleDao;

	private PrivilegeDao privilegeDao;

	private String select = "all";

	private String roleId;

	public PrivilegeListAction() {
		super();
	}

	/**
	 * Invoke this while url <code>listPrivilege.do</code> be requested, and
	 * forward to the user login input page.
	 * 
	 * @return
	 * @throws Exception
	 *             on any error
	 */
	public String execute() throws Exception {
		log.debug("<action>: invoke input()");

		if (select.equals("all")) {
			execute4all();
		} else if (select.equals("role")) {
			execute4role();
		}
		return JSON;
	}

	private void execute4role() {
		Role role = roleDao.read(roleId);
		Set<Privilege> pl = role.getPrivilegeSet();
		List<PrivilegeView> list = new ArrayList<PrivilegeView>();
		for (Privilege p : pl) {
			PrivilegeView pv = new PrivilegeView();
			pv.setId(p.getId());
			pv.setName(p.getRemark());
			String[] v = new String[] {roleId, p.getId()};
			String op = StringUtil.getReplaceString(getText(XDDConstants.OPERATION_8), v);
			pv.setOperation(op);
			list.add(pv);
		}
		JSONArray ja = JSONArray.fromObject(list);
		setJson(ja.toString());
	}

	private void execute4all() {
		List<Privilege> pl = privilegeDao.read(Privilege.class);
		List<PrivilegeView> list = new ArrayList<PrivilegeView>();
		for (Privilege p : pl) {
			PrivilegeView pv = new PrivilegeView();
			pv.setId(p.getId());
			pv.setName(p.getRemark());
			String[] v = new String[] {roleId, p.getId()};
			String op = StringUtil.getReplaceString(getText(XDDConstants.OPERATION_7), v);
			pv.setOperation(op);
			list.add(pv);
		}
		JSONArray ja = JSONArray.fromObject(list);
		setJson(ja.toString());
	}

	public PrivilegeDao getPrivilegeDao() {
		return privilegeDao;
	}

	public void setPrivilegeDao(PrivilegeDao privilegeDao) {
		this.privilegeDao = privilegeDao;
	}

	public RoleDao getRoleDao() {
		return roleDao;
	}

	public void setRoleDao(RoleDao roleDao) {
		this.roleDao = roleDao;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getSelect() {
		return select;
	}

	public void setSelect(String select) {
		this.select = select;
	}

}
