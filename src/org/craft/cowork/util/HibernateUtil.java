package org.craft.cowork.util;

import java.util.ResourceBundle;

import org.hibernate.FlushMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 * Hibernate Tool class
 * 
 * @author Frank Hu
 * @version 1.0, 2008-6-13
 */
public class HibernateUtil {

	private static final ResourceBundle RESOUCE = ResourceBundle
			.getBundle("org.craft.cowork.util.HibernateUtil");

	private static final SessionFactory sessionFactory;

	public static final ThreadLocal session = new ThreadLocal();

	static {
		String resouce = RESOUCE.getString("hibernate.config.resource");
		if (resouce == null || resouce.trim().length() == 0) {
			sessionFactory = new Configuration().configure()
					.buildSessionFactory();
		} else {
			sessionFactory = new Configuration().configure(resouce)
					.buildSessionFactory();
		}
	}

	/**
	 * Get session with current thread
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static Session currentSession() {
		Session s = (Session) session.get();
		if (s == null) {
			s = sessionFactory.openSession();
			s.setFlushMode(FlushMode.COMMIT);
			session.set(s);
		}
		return s;
	}

	/**
	 * Close session with current thread. End the session by releasing the JDBC
	 * connection and cleaning up.
	 */
	@SuppressWarnings("unchecked")
	public static void closeSession() {
		Session s = (Session) session.get();
		session.set(null);
		if (s != null && s.isOpen()) {
			s.close();
		}
	}

	/**
	 * Begin a unit of work and return the associated <tt>Transaction</tt>
	 * object. If a new underlying transaction is required, begin the
	 * transaction. Otherwise continue the new work in the context of the
	 * existing underlying transaction. The class of the returned
	 * <tt>Transaction</tt> object is determined by the property
	 * <tt>hibernate.transaction_factory</tt>.
	 * 
	 * @return a Transaction instance
	 * @see Transaction
	 */
	public static Transaction beginTransaction() {
		return currentSession().beginTransaction();
	}

}
