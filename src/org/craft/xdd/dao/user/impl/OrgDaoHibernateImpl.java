package org.craft.xdd.dao.user.impl;

import java.util.ArrayList;
import java.util.List;

import org.craft.cowork.dao.GenericDaoHibernateImpl;
import org.craft.xdd.dao.user.OrgDao;
import org.craft.xdd.model.user.Org;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 * The implementation of <code>OrgDao</code> interface.
 * 
 * @author Frank Hu
 * @version 1.0, 2009/9/7
 */
public class OrgDaoHibernateImpl extends GenericDaoHibernateImpl<Org, String>
		implements OrgDao {

	public OrgDaoHibernateImpl(Class<Org> type) {
		super(type);
	}

	public List<Org> read(char type) {
		String hql = "FROM Org o WHERE o.type = :type ORDER BY o.id ASC";
		log.debug("<hql>: " + hql);

		Session session = getSession();
		Query q = session.createQuery(hql);
		q.setCharacter("type", type);

		List rt = q.list();
		List<Org> list = new ArrayList<Org>();
		for (Object o : rt) {
			list.add((Org) o);
		}
		return list;
	}
}
