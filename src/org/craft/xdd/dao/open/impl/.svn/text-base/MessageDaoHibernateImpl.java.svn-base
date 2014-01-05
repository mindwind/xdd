package org.craft.xdd.dao.open.impl;

import java.util.ArrayList;
import java.util.List;

import org.craft.cowork.dao.GenericDaoHibernateImpl;
import org.craft.xdd.dao.open.MessageDao;
import org.craft.xdd.model.open.Message;
import org.hibernate.Query;
import org.hibernate.Session;

@SuppressWarnings("rawtypes")
public class MessageDaoHibernateImpl extends
		GenericDaoHibernateImpl<Message, String> implements MessageDao {

	public MessageDaoHibernateImpl(Class<Message> type) {
		super(type);
	}

	public List<Message> read(String title, int state, int first, int max) {
		String hql;
		if (state != -1) {
			hql = "FROM "
					+ Message.class.getName()
					+ " as m "
					+ "WHERE m.title LIKE ? AND m.state = ? ORDER BY m.datetime DESC";
		} else {
			hql = "FROM " + Message.class.getName() + " as m "
					+ "WHERE m.title LIKE ? ORDER BY m.datetime DESC";
		}
		log.debug("<hql>: " + hql);

		Session session = getSession();
		Query q = session.createQuery(hql);
		q.setFirstResult(first);
		q.setMaxResults(max);
		q.setString(0, title + "%");
		if (state != -1) {
			q.setInteger(1, state);
		}

		List rt = q.list();
		List<Message> list = new ArrayList<Message>();
		for (Object o : rt) {
			list.add((Message) o);
		}
		return list;
	}

	public Long count(String title, int state) {
		String hql;
		if (state != -1) {
			hql = "SELECT COUNT(*) FROM " + Message.class.getName() + " as m "
					+ "WHERE m.title LIKE ? AND m.state = ?";
		} else {
			hql = "SELECT COUNT(*) FROM " + Message.class.getName() + " as m "
					+ "WHERE m.title LIKE ?";
		}
		log.debug("<hql>: " + hql);

		Session session = getSession();
		Query q = session.createQuery(hql);
		q.setString(0, title + "%");
		if (state != -1) {
			q.setInteger(1, state);
		}

		return (Long) q.uniqueResult();
	}

	public List<Message> read(String datetime, int first, int max) {
		String hql;
		boolean is = false;
		if (datetime != null && datetime.equals("all")) {
			hql = "FROM " + Message.class.getName() + " as m "
					+ "ORDER BY m.datetime DESC";
		} else {
			is = true;
			hql = "FROM " + Message.class.getName() + " as m "
					+ "WHERE m.datetime = ? ORDER BY m.datetime DESC";
		}
		log.debug("<hql>: " + hql);

		Session session = getSession();
		Query q = session.createQuery(hql);
		q.setFirstResult(first);
		q.setMaxResults(max);

		if (is) {
			q.setString(0, datetime);
		}
		List rt = q.list();
		List<Message> list = new ArrayList<Message>();
		for (Object o : rt) {
			list.add((Message) o);
		}
		return list;
	}

	public Long count(String datetime) {
		String hql;
		boolean is = false;
		if (datetime != null && datetime.equals("all")) {
			hql = "SELECT COUNT(*) FROM " + Message.class.getName();
		} else {
			is = true;
			hql = "SELECT COUNT(*) FROM " + Message.class.getName() + " as m "
					+ "WHERE m.datetime = ?";
		}
		log.debug("<hql>: " + hql);

		Session session = getSession();
		Query q = session.createQuery(hql);
		if (is) {
			q.setString(0, datetime);
		}

		return (Long) q.uniqueResult();
	}
}
