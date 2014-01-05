package org.craft.xdd.view.action.user;

import java.util.List;
import java.util.Set;

import org.apache.struts2.interceptor.SessionAware;
import org.craft.xdd.XDDConstants;
import org.craft.xdd.dao.user.PrivilegeDao;
import org.craft.xdd.model.user.Privilege;
import org.craft.xdd.model.user.User;
import org.craft.xdd.service.XDDServiceException;
import org.craft.xdd.service.user.UserService;
import org.craft.xdd.view.action.JsonAction;

/**
 * <code>User</code> login action.
 * 
 * @author Frank Hu
 * @version 1.0, 2009/8/29
 */
public class UserLoginAction extends JsonAction implements SessionAware {

	private static final long serialVersionUID = 7358514100687082627L;

//	private static final String LOGIN = "login";

//	private static final long COOKIE_VALID_TIME = 60 * 60 * 24 * 30;
//
//	private static final int COOKIE_MAX_AGE = 60 * 60 * 24 * 365;
//
//	private static final String COOKIE_NAME = "org.craft.xdd";

	private UserService userService;

	private PrivilegeDao privilegeDao;

	// -------------------- in

	private User user;

	private boolean logout;

//	private String check;

	/** Singnal what title the Header.jsp page use */
	private String htitle;

	public UserLoginAction() {
		log.debug("<action>: invoke default constructor");
		this.htitle = "login";
	}

	/**
	 * Invoke this while url <code>login_input.do</code> be requested, and
	 * forward to the user login input page.
	 * 
	 * @return
	 * @throws Exception
	 *             on any error
	 */
	public String input() throws Exception {
		log.debug("<action>: invoke input()");

		try {
			setHtitle();
			result = INPUT;

			// if logout, clear user session
			if (logout) {
				session.remove(XDDConstants.USER_KEY);
			} 
//			else {
//				result = readCookie();
//			}
//		} catch (XDDServiceException e) {
//			setJson(json(getMessage(e), false));
//			return JSON;
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw e;
		}

		return result;
	}

	/**
	 * Put page head title in the request scope for page use
	 */
	private void setHtitle() {
		getRequest().setAttribute(XDDConstants.HEAD_TITLE, htitle);
	}

	/**
	 * Invoke this while url <code>login_enter.do</code> be requested.
	 * 
	 * @return
	 * @throws Exception
	 *             on any error
	 */
	@SuppressWarnings("unchecked")
	public String enter() throws Exception {
		log.debug("<action>: invoke enter()");

		try {
			if (!validate2()) {
				return JSON;
			}
			setHtitle();
			User u = userService.login(user);
			setSession(u);
//			if (check != null && check.equals("on")) {
//				writeCookie(user);
//			}
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

//	/**
//	 * Invoke this while url <code>login_destroyCookie.do</code> be requested.
//	 * 
//	 * @return
//	 * @throws Exception
//	 *             on any error
//	 */
//	public String destroyCookie() throws Exception {
//		clearCookie();
//		return SUCCESS;
//	}

//	@SuppressWarnings("unchecked")
//	private String readCookie() throws Exception {
//		Cookie cookies[] = getRequest().getCookies();
//		String cookieValue = null;
//		if (cookies != null) {
//			for (int i = 0; i < cookies.length; i++) {
//				if (COOKIE_NAME.equals(cookies[i].getName())) {
//					cookieValue = cookies[i].getValue();
//					break;
//				}
//			}
//		}
//		if (cookieValue != null) {
//			String cvalues[] = cookieValue.split(":");
//			if (cvalues.length == 3) {
//				long cookieDeadTime = Long.parseLong(cvalues[2]);
//				if (cookieDeadTime < System.currentTimeMillis()) {
//					clearCookie();
//					result = INPUT;
//				} else {
//					user = new User();
//					user.setId(cvalues[0]);
//					user.setPassword(cvalues[1]);
//					user.setEncrypt(true);
//					User u = userService.login(user);
//					setSession(u);
//					result = LOGIN;
//				}
//			} else {
//				result = INPUT;
//			}
//		} else {
//			result = INPUT;
//		}
//		return result;
//	}

//	private void clearCookie() {
//		Cookie cookie = new Cookie(COOKIE_NAME, null);
//		cookie.setMaxAge(0);
//		cookie.setPath("/");
//		getResponse().addCookie(cookie);
//	}

	@SuppressWarnings("unchecked")
	private void setSession(User u) {
		session.put(XDDConstants.USER_KEY, u.getId());
		Set<Privilege> upset = u.getRole().getPrivilegeSet();
		String[] ups = new String[upset.size()];
		int i = 0;
		for (Privilege p : upset) {
			ups[i] = p.getPrivilegePoint();
			i++;
		}
		session.put(u.getId(), ups);
		List<Privilege> plist = privilegeDao.read(Privilege.class);
		String[] ps = new String[plist.size()];
		int j = 0;
		for (Privilege p : plist) {
			ps[j] = p.getPrivilegePoint();
			j++;
		}
		session.put(XDDConstants.PRIVILEGE, ps);
	}

//	private void writeCookie(User user) {
//		long cookieDeadTime = System.currentTimeMillis()
//				+ (COOKIE_VALID_TIME * 1000);
//		String encryptPwd = UserDatabaseRealm.Digest(user.getId()
//				+ user.getPassword(), "MD5");
//		String cookieValue = user.getId() + ":" + encryptPwd + ":"
//				+ cookieDeadTime;
//		log.debug("<action>: cookie - " + cookieValue);
//
//		Cookie cookie = new Cookie(COOKIE_NAME, cookieValue);
//		cookie.setMaxAge(COOKIE_MAX_AGE);
//		cookie.setPath("/");
//		getResponse().addCookie(cookie);
//	}

	private boolean validate2() {
		log.debug("<action>: invoke validate2()");

		boolean b = true;
		if (valNull(user.getId())) {
			setJson(json(getText(XDDConstants.ERR_USER_REQUIRED), false));
			b = false;
		} else {
			user.setId(user.getId().trim());
		}

		if (valNull(user.getPassword())) {
			setJson(json(getText(XDDConstants.ERR_PASSWORD_REQUIRED), false));
			b = false;
		}

		return b;
	}

	// getter & setter
	public String getHtitle() {
		return htitle;
	}

	public void setHtitle(String htitle) {
		this.htitle = htitle;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public boolean getLogout() {
		return logout;
	}

	public void setLogout(boolean logout) {
		this.logout = logout;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

//	public void setCheck(String check) {
//		this.check = check;
//	}

	public PrivilegeDao getPrivilegeDao() {
		return privilegeDao;
	}

	public void setPrivilegeDao(PrivilegeDao privilegeDao) {
		this.privilegeDao = privilegeDao;
	}

}
