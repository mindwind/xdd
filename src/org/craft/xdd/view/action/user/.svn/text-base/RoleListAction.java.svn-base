package org.craft.xdd.view.action.user;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

import org.craft.xdd.XDDConstants;
import org.craft.xdd.dao.user.RoleDao;
import org.craft.xdd.model.user.Role;
import org.craft.xdd.model.user.Role.RoleView;
import org.craft.xdd.view.action.JsonAction;

/**
 * <code>Role</code> list action.
 * 
 * @author Frank Hu
 * @version 1.0, 2009/9/7
 */
public class RoleListAction extends JsonAction {

	private static final long serialVersionUID = 8395178628959366021L;

	private RoleDao roleDao;

	private String select = "combo";

	public RoleListAction() {
		super();
		log.debug("<action>: invoke default constructor");
	}

	/**
	 * Invoke this while url <code>listInfoGroup.do</code> be requested
	 * 
	 * @return String
	 * @throws Exception
	 *             on any error
	 */
	public String execute() throws Exception {
		log.debug("<action>: invoke execute()");
		List<Role> rl = roleDao.read(Role.class);
		if (select.equals("combo")) {
			execute4combo(rl);
		} else if (select.equals("grid")) {
			execute4grid(rl);
		}
		return JSON;
	}

	private void execute4grid(List<Role> rl) {
		List<RoleView> list = new ArrayList<RoleView>();
		for (Role role : rl) {
			RoleView rv = new RoleView();
			rv.setId(role.getId());
			rv.setName(role.getName());
			rv.setOperation(getText(XDDConstants.OPERATION_6).replaceAll("%id",
					role.getId()));
			list.add(rv);
		}
		JSONArray ja = JSONArray.fromObject(list);
		setJson(ja.toString());
	}

	private void execute4combo(List<Role> rl) {
		List<String[]> list = new ArrayList<String[]>();
		for (Role role : rl) {
			String[] sarr = new String[] { role.getId(), role.getName() };
			list.add(sarr);
		}
		JSONArray ja = JSONArray.fromObject(list);
		setJson(ja.toString());
	}

	public RoleDao getRoleDao() {
		return roleDao;
	}

	public void setRoleDao(RoleDao roleDao) {
		this.roleDao = roleDao;
	}

	public String getSelect() {
		return select;
	}

	public void setSelect(String select) {
		this.select = select;
	}

}
