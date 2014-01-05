package org.craft.xdd.service.user.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;

import org.apache.catalina.realm.UserDatabaseRealm;
import org.craft.xdd.XDDConstants;
import org.craft.xdd.dao.user.PrivilegeDao;
import org.craft.xdd.dao.user.RoleDao;
import org.craft.xdd.dao.user.UserDao;
import org.craft.xdd.model.user.Privilege;
import org.craft.xdd.model.user.Role;
import org.craft.xdd.model.user.User;
import org.craft.xdd.service.AbstractService;
import org.craft.xdd.service.XDDServiceException;
import org.craft.xdd.service.user.UserService;
import org.springframework.transaction.annotation.Transactional;

/**
 * The default implementation of <code>UserServie</code> interface
 * 
 * @author Frank Hu
 * @version 1.0, 2009/8/29
 */
public class UserServiceImpl extends AbstractService implements UserService {

	private UserDao userDao;

	private RoleDao roleDao;

	private PrivilegeDao privilegeDao;

	@Transactional(readOnly = false, rollbackFor = XDDServiceException.class)
	public User register(User newUser) throws XDDServiceException {
		if (newUser == null) {
			throw new NullPointerException("arg[newUser] is null!");
		}

		User u = userDao.read(newUser.getId());
		if (u != null && u.getState().equals(User.NORMAL)) {
			throw new XDDServiceException(XDDConstants.ERR_NAME_REPEAT);
		}

		if (u == null) {
			String password = UserDatabaseRealm.Digest(newUser.getId()
					+ newUser.getPassword(), "MD5");
			newUser.setPassword(password);
			userDao.create(newUser);
		} else if (u != null && u.getState().equals(User.CANCEL)) {
			u.setState(User.NORMAL);
			userDao.update(u);
		}
		return newUser;
	}

	@Transactional(readOnly = false, rollbackFor = XDDServiceException.class)
	public User login(User user) throws XDDServiceException {
		if (user == null) {
			throw new NullPointerException("arg[user] is null!");
		}

		// Check the user exist
		User u = userDao.read(user.getId());
		if (u == null || u.getState().equals(User.CANCEL)) {
			throw new XDDServiceException(XDDConstants.ERR_USER_NOT_EXIST);
		}

		// Check the password
		String encryptPwd = null;
		if (user.isEncrypt()) {
			encryptPwd = user.getPassword();
		} else {
			encryptPwd = UserDatabaseRealm.Digest(user.getId()
					+ user.getPassword(), "MD5");
		}
		if (!u.getPassword().equals(encryptPwd)) {
			throw new XDDServiceException(XDDConstants.ERR_PASSWORD_NOT_MATCH);
		}

		u.setLastLoginTime(new SimpleDateFormat("yyyyMMddHHmmss")
				.format(new Date()));
		userDao.update(u);
		return u;
	}

	@Transactional(readOnly = false, rollbackFor = XDDServiceException.class)
	public void modify(User user) throws XDDServiceException {
		userDao.update(user);
	}

	@Transactional(readOnly = false, rollbackFor = XDDServiceException.class)
	public void modify(String id, String oldPwd, String newPwd)
			throws XDDServiceException {
		User user = userDao.read(id);
		String cpwd = UserDatabaseRealm.Digest(id + oldPwd, "MD5");
		if (!cpwd.equals(user.getPassword())) {
			throw new XDDServiceException(XDDConstants.ERR_OLD_PASSWORD);
		}
		String npwd = UserDatabaseRealm.Digest(id + newPwd, "MD5");
		user.setPassword(npwd);
		userDao.update(user);
	}

	@Transactional(readOnly = false, rollbackFor = XDDServiceException.class)
	public void del(String id) throws XDDServiceException {
		User user = userDao.read(id);
		user.setState(User.CANCEL);
		userDao.update(user);
	}

	@Transactional(readOnly = false, rollbackFor = XDDServiceException.class)
	public void reset(String id) throws XDDServiceException {
		User user = userDao.read(id);
		String password = UserDatabaseRealm.Digest(user.getId() + "123456",
				"MD5");
		user.setPassword(password);
		userDao.update(user);
	}

	@Transactional(readOnly = false, rollbackFor = XDDServiceException.class)
	public void addRole(String name) throws XDDServiceException {
		Role role = new Role();
		role.setName(name);
		roleDao.create(role);
	}

	@Transactional(readOnly = false, rollbackFor = XDDServiceException.class)
	public void modifyRole(String id, String name) throws XDDServiceException {
		Role role = roleDao.read(id);
		role.setName(name);
		roleDao.update(role);
	}

	@Transactional(readOnly = false, rollbackFor = XDDServiceException.class)
	public void delRole(String id) throws XDDServiceException {
		Role role = roleDao.read(id);
		Set<User> users = role.getUsers();
		if (users != null && users.size() > 0) {
			throw new XDDServiceException(XDDConstants.ERR_ROLE_DEL);
		}
		roleDao.delete(role);
	}

	@Transactional(readOnly = false, rollbackFor = XDDServiceException.class)
	public void assignPrivilege(String rid, String pid)
			throws XDDServiceException {
		Role role = roleDao.read(rid);
		Privilege p = privilegeDao.read(pid);
		Set<Privilege> pset = role.getPrivilegeSet();
		pset.add(p);
		roleDao.update(role);
	}
	
	@Transactional(readOnly = false, rollbackFor = XDDServiceException.class)
	public void callbackPrivilege(String rid, String pid) throws XDDServiceException {
		Role role = roleDao.read(rid);
		Set<Privilege> pset = role.getPrivilegeSet();
		Privilege p = privilegeDao.read(pid);
		pset.remove(p);
		roleDao.update(role);
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public void setRoleDao(RoleDao roleDao) {
		this.roleDao = roleDao;
	}

	public void setPrivilegeDao(PrivilegeDao privilegeDao) {
		this.privilegeDao = privilegeDao;
	}

}
