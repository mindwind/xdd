package org.craft.xdd.view.action.user;

import org.apache.struts2.interceptor.SessionAware;
import org.craft.xdd.service.XDDServiceException;
import org.craft.xdd.service.user.UserService;
import org.craft.xdd.view.action.JsonAction;

/**
 * Privilege assign action.
 * 
 * @author Frank Hu
 * @version 1.0, 2009-9-10
 */
public class PrivilegeAssignAction extends JsonAction implements SessionAware {

	private static final long serialVersionUID = -7699727083499557255L;

	private UserService userService;

	private String rid;
	
	private String pid;

	public PrivilegeAssignAction() {
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
			userService.assignPrivilege(rid, pid);
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


	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

}
