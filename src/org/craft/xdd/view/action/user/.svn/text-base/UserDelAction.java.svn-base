package org.craft.xdd.view.action.user;

import org.craft.xdd.service.XDDServiceException;
import org.craft.xdd.service.user.UserService;
import org.craft.xdd.view.action.JsonAction;

/**
 * <code>User</code> del action.
 * 
 * @author Frank Hu
 * @version 1.0, 2009/9/7
 */
public class UserDelAction extends JsonAction {

	private static final long serialVersionUID = 2582419733199250698L;

	private UserService userService;

	private String id;

	public UserDelAction() {
		super();
	}

	/**
	 * Invoke this while url <code>delUser.do</code> be requested, and forward
	 * to the user login input page.
	 * 
	 * @return
	 * @throws Exception
	 *             on any error
	 */
	public String execute() throws Exception {
		log.debug("<action>: invoke input()");

		try {
			userService.del(id);
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

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

}
