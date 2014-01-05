package org.craft.xdd.dao.user;

import java.util.List;

import org.craft.cowork.dao.GenericDao;
import org.craft.xdd.model.user.User;

/**
 * The <code>User</code> entity dao interface
 * 
 * @author Frank Hu
 * @version 1.0, 2009/8/29
 */
public interface UserDao extends GenericDao<User, String> {

	/**
	 * Read user with limit.
	 * 
	 * @return
	 */
	public List<User> read(int first, int max);
	
	/**
	 * Count all
	 * 
	 * @return
	 */
	public long count();

}