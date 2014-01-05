package org.craft.xdd.view.action.user;

import org.craft.xdd.dao.user.OrgDao;
import org.craft.xdd.dao.user.RoleDao;
import org.craft.xdd.dao.user.UserDao;
import org.craft.xdd.model.user.User;
import org.craft.xdd.service.XDDServiceException;
import org.craft.xdd.service.user.UserService;
import org.craft.xdd.view.action.JsonAction;

/**
 * <code>User</code> modify action.
 * 
 * @author Frank Hu
 * @version 1.0, 2009/9/7
 */
public class UserModifyAction extends JsonAction {

	private static final long serialVersionUID = 2582419733199250698L;

	private UserService userService;

	private OrgDao orgDao;

	private RoleDao roleDao;

	private UserDao userDao;

	private String id;

	private String roleId;

	private String orgId;

	public UserModifyAction() {
		super();
	}

	/**
	 * Invoke this while url <code>modifyUser.do</code> be requested, and
	 * forward to the user login input page.
	 * 
	 * @return
	 * @throws Exception
	 *             on any error
	 */
	public String execute() throws Exception {
		log.debug("<action>: invoke input()");

		try {
			User user = userDao.read(id);
			user.setRole(roleDao.read(roleId));
			user.setOrg(orgDao.read(orgId));
			userService.modify(user);
		} catch (XDDServiceException e) {
			setJson(json(getMessage(e), false));
			return JSON;
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw e;
		}

		setJson(JSON_SUCCESS);
		return JSON;

	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOrgId() {
		return orgId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public void setOrgDao(OrgDao orgDao) {
		this.orgDao = orgDao;
	}

	public void setRoleDao(RoleDao roleDao) {
		this.roleDao = roleDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

}
