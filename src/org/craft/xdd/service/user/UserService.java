package org.craft.xdd.service.user;

import org.craft.cowork.service.BusinessService;
import org.craft.xdd.model.user.User;
import org.craft.xdd.service.XDDServiceException;

/**
 * User service
 * 
 * @author Frank Hu
 * @version 1.0, 2009/8/29
 */
public interface UserService extends BusinessService {

	/**
	 * Register a new user
	 * 
	 * @param newUser
	 * @return
	 * @throws PIPServiceException
	 */
	public User register(User newUser) throws XDDServiceException;

	/**
	 * Info login.
	 * 
	 * @param user
	 * @throws PIPServiceException
	 * @return Info entity model object
	 * 
	 */
	public User login(User user) throws XDDServiceException;

	/**
	 * Modify user.
	 * 
	 * @param user
	 * @throws XDDAuthException
	 */
	public void modify(User user) throws XDDServiceException;

	/**
	 * Del user
	 * 
	 * @param id
	 * @throws XDDAuthException
	 */
	public void del(String id) throws XDDServiceException;

	/**
	 * Moidfy user password
	 * 
	 * @param id
	 * @param oldPwd
	 * @param newPwd
	 * @throws XDDAuthException
	 */
	public void modify(String id, String oldPwd, String newPwd)
			throws XDDServiceException;

	/**
	 * Add role
	 * 
	 * @param name
	 * @throws XDDAuthException
	 */
	public void addRole(String name) throws XDDServiceException;

	/**
	 * Del role
	 * 
	 * @param id
	 * @throws XDDAuthException
	 */
	public void delRole(String id) throws XDDServiceException;

	/**
	 * Modify role
	 * 
	 * @param id
	 * @param name
	 * @throws XDDAuthException
	 */
	public void modifyRole(String id, String name) throws XDDServiceException;

	/**
	 * Reset user password
	 * 
	 * @param id
	 * @throws XDDAuthException
	 */
	public void reset(String id) throws XDDServiceException;

	/**
	 * Assign privilege
	 * 
	 * @param rid
	 * @param pid
	 * @throws XDDAuthException
	 */
	public void assignPrivilege(String rid, String pid)
			throws XDDServiceException;

	/**
	 * Callbakc privilege
	 * 
	 * @param rid
	 * @param pid
	 * @throws XDDAuthException
	 */
	public void callbackPrivilege(String rid, String pid)
			throws XDDServiceException;

}
