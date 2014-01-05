package org.craft.cowork.dao;

import java.io.Serializable;

import org.craft.cowork.util.HibernateUtil;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateTemplate;

/**
 * The implementation of base dao interface
 * 
 * @author Frank Hu
 * @version 1.0, 2009/5/5
 */
public class BaseDaoHibernateImpl implements BaseDao {

	protected HibernateTemplate hibernateTemplate;

	protected Class type;

	public BaseDaoHibernateImpl() {
		super();
	}

	public BaseDaoHibernateImpl(Class type) {
		this.type = type;
	}

	public Serializable create(Object newInstance) {
		return (Serializable) getSession().save(newInstance);
	}

	public Object read(Serializable id) {
		return getSession().get(type, id);
	}

	public void update(Object persistentObject) {
		getSession().update(persistentObject);
	}

	public void delete(Object persistentObject) {
		getSession().delete(persistentObject);
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
	 * local <code>SessionFactory</code> and it's not depend the container
	 * env.
	 * 
	 * @return <code>Session</code>
	 */
	protected Session getLocalSession() {
		return HibernateUtil.currentSession();
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
}
