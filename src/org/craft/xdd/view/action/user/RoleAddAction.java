package org.craft.xdd.view.action.user;

import org.craft.xdd.XDDConstants;
import org.craft.xdd.service.XDDServiceException;
import org.craft.xdd.service.user.UserService;
import org.craft.xdd.view.action.JsonAction;

/**
 * <code>Role</code> add action.
 * 
 * @author Frank Hu
 * @version 1.0, 2009/9/9
 */
public class RoleAddAction extends JsonAction {

	private static final long serialVersionUID = 8395178628959366021L;
	
	private UserService userService;
	
	private String name;

	public RoleAddAction() {
		super();
		log.debug("<action>: invoke default constructor");
	}

	/**
	 * Invoke this while url <code>addRole.do</code> be requested
	 * 
	 * @return String
	 * @throws Exception
	 *             on any error
	 */
	public String execute() throws Exception {
		log.debug("<action>: invoke execute()");
			
		try {
			if (!validate2()) {
				return JSON;
			}
			userService.addRole(name);
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

		boolean b = true;
		if (valNull(name)) {
			setJson(json(getText(XDDConstants.ERR_NAME_REQUIRED), false));
			b = false;
		}
		return b;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

}
