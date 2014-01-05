package org.craft.xdd.dao.user.impl;

import java.util.ArrayList;
import java.util.List;

import org.craft.cowork.dao.GenericDaoHibernateImpl;
import org.craft.xdd.dao.user.UserDao;
import org.craft.xdd.model.user.User;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 * The implementation of <code>UserDao</code> interface.
 * 
 * @author Frank Hu
 * @version 1.0, 2009/8/29
 */
public class UserDaoHibernateImpl extends GenericDaoHibernateImpl<User, String>
		implements UserDao {

	public UserDaoHibernateImpl(Class<User> type) {
		super(type);
	}

	public List<User> read(int first, int max) {
		String hql = "FROM User u WHERE u.state != :state";
		log.debug("<hql>: " + hql);

		Session session = getSession();
		Query q = session.createQuery(hql);
		q.setFirstResult(first);
		q.setMaxResults(max);
		q.setString("state", User.CANCEL);
		List rt = q.list();
		List<User> list = new ArrayList<User>();
		for (Object o : rt) {
			list.add((User) o);
		}
		return list;
	}

	public long count() {
		String hql = "SELECT COUNT(*) FROM User u  WHERE u.state != :state";
		log.debug("<hql>: " + hql);
		
		Session session = getSession();
		Query q = session.createQuery(hql);
		q.setString("state", User.CANCEL);
		return (Long) q.uniqueResult();
	}

}
