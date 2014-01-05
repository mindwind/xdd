package org.craft.xdd.dao.info.impl;

import java.util.ArrayList;
import java.util.List;

import org.craft.cowork.dao.GenericDaoHibernateImpl;
import org.craft.xdd.dao.info.InfoGroupDao;
import org.craft.xdd.model.info.InfoGroup;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 * The implementation of <code>InfoGroupDao</code> interface.
 * 
 * @author Frank Hu
 * @version 1.0, 2009/8/29
 */
public class InfoGroupDaoHibernateImpl extends
		GenericDaoHibernateImpl<InfoGroup, String> implements InfoGroupDao {

	public InfoGroupDaoHibernateImpl(Class<InfoGroup> type) {
		super(type);
	}

	public List<InfoGroup> read(int level) {
		String hql = "FROM InfoGroup ig WHERE ig.groupLevel = :level ORDER BY ig.id ASC";
		log.debug("<hql>: " + hql);

		Session session = getSession();
		Query q = session.createQuery(hql);
		q.setInteger("level", level);
		List rt = q.list();
		List<InfoGroup> list = new ArrayList<InfoGroup>();
		for (Object o : rt) {
			list.add((InfoGroup) o);
		}
		return list;
	}

}
