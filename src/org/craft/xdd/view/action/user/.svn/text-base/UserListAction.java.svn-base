package org.craft.xdd.view.action.user;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

import org.craft.xdd.XDDConstants;
import org.craft.xdd.dao.user.UserDao;
import org.craft.xdd.model.user.User;
import org.craft.xdd.model.user.User.UserView;
import org.craft.xdd.view.action.JsonAction;

/**
 * <code>User</code> list action.
 * 
 * @author Frank Hu
 * @version 1.0, 2009/9/7
 */
public class UserListAction extends JsonAction {

	private static final long serialVersionUID = 2582419733199250698L;

	private UserDao userDao;

	private int start = 0;

	private int limit = 10;

	public UserListAction() {
		super();
	}

	/**
	 * Invoke this while url <code>listUser.do</code> be requested, and
	 * forward to the user login input page.
	 * 
	 * @return
	 * @throws Exception
	 *             on any error
	 */
	public String execute() throws Exception {
		log.debug("<action>: invoke input()");
		List<User> ul = userDao.read(start, limit);
		List<UserView> list = new ArrayList<UserView>();
		for (User u : ul) {
			UserView uv = new UserView();
			uv.setId(u.getId());
			uv.setRoleId(u.getRole().getId());
			uv.setRole(u.getRole().getName());
			uv.setOrgId(u.getOrg().getId());
			uv.setOrg(u.getOrg().getName());
			uv.setOperation(getText(XDDConstants.OPERATION_5).replaceAll("%id",
					u.getId()));
			list.add(uv);
		}

		JSONArray ja = JSONArray.fromObject(list);
		long total = userDao.count();
		String json = "{totalProperty:" + total + ",root:" + ja.toString()
				+ "}";
		setJson(json);
		return JSON;

	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

}
