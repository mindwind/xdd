package org.craft.cowork.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.craft.cowork.service.HQLQueryService;
import org.craft.cowork.service.QueryService;
import org.craft.cowork.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

/**
 * The implementation of generic dao interface
 * 
 * @author Frank Hu
 * @version 1.0, 2009/5/5
 */
public abstract class GenericDaoHibernateImpl<T, PK extends Serializable>
		implements GenericDao<T, PK> {

	protected HibernateTemplate hibernateTemplate;

	protected Logger log = Logger.getLogger(getClass());

	private Class<T> type;

	public GenericDaoHibernateImpl(Class<T> type) {
		this.type = type;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public PK create(T newInstance) {
		return (PK) getSession().save(newInstance);
	}

	@SuppressWarnings("unchecked")
	@Transactional(readOnly = true)
	public T read(PK id) {
		return (T) getSession().get(type, id);
	}

	@SuppressWarnings("unchecked")
	@Transactional(readOnly = true)
	public T read(PK id, Session session) {
		return (T) session.get(type, id);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Transactional(readOnly = true)
	public List<T> read(Class T) {
		String hql = "FROM " + T.getName() + " t ORDER BY t.id ASC";
		log.debug("<hql>: " + hql);

		Session session = getSession();
		Query q = session.createQuery(hql);
		List rt = q.list();
		List<T> list = new ArrayList<T>();
		for (Object o : rt) {
			list.add((T) o);
		}
		return list;
	}

	@Transactional
	public void update(T persistentObject) {
		getSession().update(persistentObject);
	}

	@Transactional
	public void delete(T persistentObject) {
		getSession().delete(persistentObject);
	}

	/**
	 * Count by query.
	 * 
	 * @param query
	 * @return
	 */
	@Transactional(readOnly = true)
	public long count(QueryService qs) {
		String hql = "SELECT COUNT(*) " + qs.toQueryString();
		log.debug("<hql>: " + hql);

		Query q = ((HQLQueryService) qs).asQuery(getSession(), hql);
		return (Long) q.uniqueResult();
	}

	/**
	 * Get the hibernate <code>Session</code> object binding current thread.
	 * This method uses the spring hinernateTemplate binding to produce session
	 * object, it may need to be use in container env according to the spring
	 * configuation.
	 * 
	 * @return <code>Session</code>
	 */
	protected Session getSession() {
		return hibernateTemplate.getSessionFactory().getCurrentSession();
	}

	/**
	 * Get the hibernate <code>Session</code> object, which are provided by
	 * local <code>SessionFactory</code> and it's not depend the container env.
	 * 
	 * @return <code>Session</code>
	 */
	protected Session getSessionLocal() {
		return HibernateUtil.currentSession();
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

}
