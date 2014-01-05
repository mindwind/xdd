package org.craft.xdd.view.action;

import java.util.Set;

import org.apache.struts2.interceptor.SessionAware;
import org.craft.xdd.XDDConstants;
import org.craft.xdd.dao.user.UserDao;
import org.craft.xdd.model.user.Privilege;
import org.craft.xdd.model.user.Role;
import org.craft.xdd.model.user.User;

/**
 * Welcome action
 * 
 * @author Frank Hu
 * @version 1.0, 2009-8-29
 */
public class WelcomeAction extends BaseAction implements SessionAware {

	private static final long serialVersionUID = -1820223657822102284L;
	
	private UserDao userDao;

	private String userFlag = "off";

	private String pubFlag = "off";

	private String auditFlag = "off";

	private String statFlag = "off";
	
	private String messageFlag = "off";

	public WelcomeAction() {
		super();
	}

	/**
	 * Invoke this while url <code>welcome.do</code> be requested
	 * 
	 * @return String
	 * @throws Exception
	 *             on any error
	 */
	public String execute() throws Exception {
		log.debug("<action>: invoke execute()");
		
		String uid = (String) session.get(XDDConstants.USER_KEY);
		User u = userDao.read(uid);
		Role role = u.getRole();
		Set<Privilege> ps = role.getPrivilegeSet();
		for (Privilege p : ps) {
			if (p.getType().equals("user")) {
				userFlag = "on";
			} else if (p.getType().equals("info_pub")) {
				pubFlag = "on";
			} else if (p.getType().equals("info_audit")) {
				auditFlag = "on";
			} else if (p.getType().equals("info_stat")) {
				statFlag = "on";
			} else if (p.getType().equals("message")) {
				messageFlag = "on";
			}
		}
		
		return SUCCESS;
	}

	public String getAuditFlag() {
		return auditFlag;
	}

	public void setAuditFlag(String auditFlag) {
		this.auditFlag = auditFlag;
	}

	public String getPubFlag() {
		return pubFlag;
	}

	public void setPubFlag(String pubFlag) {
		this.pubFlag = pubFlag;
	}

	public String getStatFlag() {
		return statFlag;
	}

	public void setStatFlag(String statFlag) {
		this.statFlag = statFlag;
	}

	public String getUserFlag() {
		return userFlag;
	}

	public void setUserFlag(String userFlag) {
		this.userFlag = userFlag;
	}

	public String getMessageFlag() {
		return messageFlag;
	}

	public void setMessageFlag(String messageFlag) {
		this.messageFlag = messageFlag;
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

}
