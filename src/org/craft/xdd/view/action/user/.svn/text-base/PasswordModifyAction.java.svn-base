package org.craft.xdd.view.action.user;

import org.apache.struts2.interceptor.SessionAware;
import org.craft.xdd.XDDConstants;
import org.craft.xdd.service.XDDServiceException;
import org.craft.xdd.service.user.UserService;
import org.craft.xdd.view.action.JsonAction;

/**
 * Password modify action.
 * 
 * @author Frank Hu
 * @version 1.0, 2009-9-8
 */
public class PasswordModifyAction extends JsonAction implements SessionAware {

	private static final long serialVersionUID = -7699727083499557255L;

	private UserService userService;

	private String oldPwd;

	private String newPwd;

	private String confirmPwd;

	public PasswordModifyAction() {
		super();
		log.debug("<action>: invoke default constructor");
	}

	/**
	 * Invoke this while url <code>resetPwd.do</code> be requested
	 * 
	 * @return String
	 * @throws Exception
	 *             on any error
	 */
	public String execute() throws Exception {
		log.debug("<action>: invoke input()");

		try {
			if (!validate2()) {
				return JSON;
			}
			String id = (String) session.get(XDDConstants.USER_KEY);
			userService.modify(id, oldPwd, newPwd);
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

		if (valNull(oldPwd)) {
			setJson(json(getText(XDDConstants.ERR_PASSWORD_REQUIRED), false));
			return false;
		} else if (!valRange(6, 20, oldPwd)) {
			setJson(json(getText(XDDConstants.ERR_PASSWORD_RANGE), false));
			return false;
		}

		if (valNull(newPwd)) {
			setJson(json(getText(XDDConstants.ERR_PASSWORD_REQUIRED), false));
			return false;
		} else if (!valRange(6, 20, newPwd)) {
			setJson(json(getText(XDDConstants.ERR_PASSWORD_RANGE), false));
			return false;
		}

		if (valNotEqual(newPwd, confirmPwd)) {
			setJson(json(getText(XDDConstants.ERR_PASSWORD_NOT_MATCH), false));
			return false;
		}

		return true;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String getConfirmPwd() {
		return confirmPwd;
	}

	public void setConfirmPwd(String confirmPwd) {
		this.confirmPwd = confirmPwd;
	}

	public String getNewPwd() {
		return newPwd;
	}

	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}

	public String getOldPwd() {
		return oldPwd;
	}

	public void setOldPwd(String oldPwd) {
		this.oldPwd = oldPwd;
	}

}
