package org.craft.xdd.view.action.user;

import org.apache.struts2.interceptor.SessionAware;
import org.craft.xdd.XDDConstants;
import org.craft.xdd.dao.user.OrgDao;
import org.craft.xdd.dao.user.RoleDao;
import org.craft.xdd.model.user.User;
import org.craft.xdd.service.XDDServiceException;
import org.craft.xdd.service.user.UserService;
import org.craft.xdd.view.action.JsonAction;

/**
 * User register action
 * 
 * @author Frank Hu
 * @version 1.0, 2009-9-7
 */
public class UserRegisterAction extends JsonAction implements SessionAware {

	private static final long serialVersionUID = 1L;

	private UserService userService;

	private RoleDao roleDao;

	private OrgDao orgDao;

	// --------------- in

	private String userId;

	private String password;

	private String confirmPwd;

	private String orgId;

	private String roleId;

	/**
	 * Invoke this while url <code>register.do</code> be requested
	 * 
	 * @return
	 * @throws Exception
	 *             on any error
	 */
	@SuppressWarnings("unchecked")
	public String execute() throws Exception {
		log.debug("<action>: invoke save()");

		try {
			if (!validate2()) {
				return JSON;
			}

			User user = new User();
			user.setId(userId);
			user.setPassword(password);
			user.setRole(roleDao.read(roleId));
			user.setOrg(orgDao.read(orgId));
			userService.register(user);
			session.put(XDDConstants.USER_KEY, userId);
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

	private boolean validate2() {
		log.debug("<action>: invoke validate2()");

		if (valNull(userId)) {
			setJson(json(getText(XDDConstants.ERR_USER_REQUIRED), false));
			return false;
		} else if (!valRange(2, 20, userId)) {
			setJson(json(getText(XDDConstants.ERR_USERID_RANGE), false));
			return false;
		}

		if (valNull(password)) {
			setJson(json(getText(XDDConstants.ERR_PASSWORD_REQUIRED), false));
			return false;
		} else if (!valRange(6, 20, password)) {
			setJson(json(getText(XDDConstants.ERR_PASSWORD_RANGE), false));
			return false;
		}

		if (valNotEqual(password, confirmPwd)) {
			setJson(json(getText(XDDConstants.ERR_PASSWORD_NOT_MATCH), false));
			return false;
		}

		return true;
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

	public void setConfirmPwd(String confirmPwd) {
		this.confirmPwd = confirmPwd;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

}
