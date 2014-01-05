package org.craft.xdd.dao.info.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.craft.cowork.dao.GenericDaoHibernateImpl;
import org.craft.xdd.dao.info.InfoDao;
import org.craft.xdd.dao.support.InfoStat;
import org.craft.xdd.model.info.Info;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.transaction.annotation.Transactional;

/**
 * The implementation of <code>InfoDao</code> interface.
 * 
 * @author Frank Hu
 * @version 1.0, 2009/8/29
 */
public class InfoDaoHibernateImpl extends GenericDaoHibernateImpl<Info, String>
		implements InfoDao {

	public InfoDaoHibernateImpl(Class<Info> type) {
		super(type);
	}

	@Transactional(readOnly = true)
	public List<Info> read(String groupId, int state, int first, int max) {
		String hql = null;
		if (state == 100 && !groupId.equals("100")) {
			hql = "FROM Info i WHERE i.group.id = :groupId ORDER BY i.publishTime DESC";
		} else if (state != 100 && groupId.equals("100")) {
			hql = "FROM Info i WHERE i.state = :state ORDER BY i.publishTime DESC";
		} else if (state == 100 && groupId.equals("100")) {
			hql = "FROM Info i ORDER BY i.publishTime DESC";
		} else {
			hql = "FROM Info i WHERE i.group.id = :groupId AND i.state = :state ORDER BY i.publishTime DESC";
		}
		log.debug("<hql>: " + hql);
		log.debug("<dao>: groupId = " + groupId);
		log.debug("<dao>: state = " + state);
		log.debug("<dao>: first = " + first);
		log.debug("<dao>: max = " + max);

		Session session = getSession();
		Query q = session.createQuery(hql);
		q.setFirstResult(first);
		q.setMaxResults(max);
		if (state != 100) {
			q.setInteger("state", state);
		}
		if (!groupId.equals("100")) {
			q.setString("groupId", groupId);
		}
		List rt = q.list();
		log.debug("<dao>: rt.size = " + rt.size());
		
		List<Info> list = new ArrayList<Info>();
		for (Object o : rt) {
			list.add((Info) o);
		}
		return list;
	}

	public List<Info> read(String userId, String groupId, int state, int first,
			int max) {
		String hql = null;
		if (state == 100 && !groupId.equals("100")) {
			hql = "FROM Info i WHERE i.author = :user AND i.group.id = :groupId ORDER BY i.publishTime DESC";
		} else if (state != 100 && groupId.equals("100")) {
			hql = "FROM Info i WHERE i.author = :user AND i.state = :state ORDER BY i.publishTime DESC";
		} else if (state == 100 && groupId.equals("100")) {
			hql = "FROM Info i WHERE i.author = :user ORDER BY i.publishTime DESC";
		} else {
			hql = "FROM Info i WHERE i.author = :user AND i.group.id = :groupId AND i.state = :state ORDER BY i.publishTime DESC";
		}
		log.debug("<hql>: " + hql);

		Session session = getSession();
		Query q = session.createQuery(hql);
		q.setFirstResult(first);
		q.setMaxResults(max);
		q.setString("user", userId);
		if (state != 100) {
			q.setInteger("state", state);
		}
		if (!groupId.equals("100")) {
			q.setString("groupId", groupId);
		}
		List rt = q.list();
		List<Info> list = new ArrayList<Info>();
		for (Object o : rt) {
			list.add((Info) o);
		}
		return list;
	}

	public long count(String userId, String groupId, int state) {
		String hql = null;
		if (state == 100 && !groupId.equals("100")) {
			hql = "SELECT COUNT(*) FROM Info i WHERE i.author = :user AND i.group.id = :groupId ";
		} else if (state != 100 && groupId.equals("100")) {
			hql = "SELECT COUNT(*) FROM Info i WHERE i.author = :user AND i.state = :state";
		} else if (state == 100 && groupId.equals("100")) {
			hql = "SELECT COUNT(*) FROM Info i WHERE i.author = :user";
		} else {
			hql = "SELECT COUNT(*) FROM Info i WHERE i.author = :user AND i.group.id = :groupId AND i.state = :state";
		}
		log.debug("<hql>: " + hql);

		Session session = getSession();
		Query q = session.createQuery(hql);
		q.setString("user", userId);
		if (state != 100) {
			q.setInteger("state", state);
		}
		if (!groupId.equals("100")) {
			q.setString("groupId", groupId);
		}
		return (Long) q.uniqueResult();
	}

	public long count(String groupId, int state) {
		String hql = null;
		if (state == 100 && !groupId.equals("100")) {
			hql = "SELECT COUNT(*) FROM Info i WHERE i.group.id = :groupId ";
		} else if (state != 100 && groupId.equals("100")) {
			hql = "SELECT COUNT(*) FROM Info i WHERE i.state = :state";
		} else if (state == 100 && groupId.equals("100")) {
			hql = "SELECT COUNT(*) FROM Info i ";
		} else {
			hql = "SELECT COUNT(*) FROM Info i WHERE i.group.id = :groupId AND i.state = :state";
		}
		log.debug("<hql>: " + hql);

		Session session = getSession();
		Query q = session.createQuery(hql);
		if (state != 100) {
			q.setInteger("state", state);
		}
		if (!groupId.equals("100")) {
			q.setString("groupId", groupId);
		}
		return (Long) q.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	public List<String> readYearList() {
		String hql = "SELECT DISTINCT(substring(t.publishTime, 0, 4)) "
				+ "FROM Info t ORDER BY substring(t.publishTime, 0, 4) DESC";
		log.debug("<hql>: " + hql);

		Session session = getSession();
		Query q = session.createQuery(hql);
		List rt = q.list();
		List<String> list = new ArrayList<String>();
		list.addAll(rt);
		return list;
	}

	public List<InfoStat> stat(String year) {
		String sql1 = "SELECT DISTINCT(author) FROM xdd_info t WHERE t.state = 0";
		String sql2 = "SELECT count(*) FROM xdd_info t WHERE t.state = 0"
				+ "AND t.author = ? AND substr(t.publish_time, 0, 6) = ? ";
		String sql3 = "SELECT count(*) FROM xdd_info t WHERE (t.state = 0 OR t.state = -1)"
				+ "AND t.author = ? AND substr(t.publish_time, 0, 6) = ? ";
		log.debug("<sql>: " + sql1);
		log.debug("<sql>: " + sql2);
		log.debug("<sql>: " + sql3);

		List<InfoStat> isl = new ArrayList<InfoStat>();
		Session session = getSession();
		Connection conn = session.connection();
		try {
			List<String> users = new ArrayList<String>();
			PreparedStatement ps = conn.prepareStatement(sql1);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				users.add(rs.getString(1));
			}
			for (String u : users) {
				ps = conn.prepareStatement(sql2);
				ps.setString(1, u);
				List<Long> nums1 = new ArrayList<Long>(13);
				List<Long> nums2 = new ArrayList<Long>(13);
				for (int i = 1; i <= 13; i++) {
					if (i == 13) {
						ps.setString(2, year);
					} else {
						ps.setString(2, i < 10 ? year + "0" + i : year
								+ Integer.toString(i));
					}
					rs = ps.executeQuery();
					while (rs.next()) {
						nums1.add(rs.getLong(1));
					}
				}
				ps = conn.prepareStatement(sql3);
				ps.setString(1, u);
				for (int i = 1; i <= 13; i++) {
					if (i == 13) {
						ps.setString(2, year);
					} else {
						ps.setString(2, i < 10 ? year + "0" + i : year
								+ Integer.toString(i));
					}
					rs = ps.executeQuery();
					while (rs.next()) {
						nums2.add(rs.getLong(1));
					}
				}
				InfoStat is = new InfoStat();
				is.setUser(u);
				is.setV1(nums1.get(0) + "/" + nums2.get(0));
				is.setV2(nums1.get(1) + "/" + nums2.get(1));
				is.setV3(nums1.get(2) + "/" + nums2.get(2));
				is.setV4(nums1.get(3) + "/" + nums2.get(3));
				is.setV5(nums1.get(4) + "/" + nums2.get(4));
				is.setV6(nums1.get(5) + "/" + nums2.get(5));
				is.setV7(nums1.get(6) + "/" + nums2.get(6));
				is.setV8(nums1.get(7) + "/" + nums2.get(7));
				is.setV9(nums1.get(8) + "/" + nums2.get(8));
				is.setV10(nums1.get(9) + "/" + nums2.get(9));
				is.setV11(nums1.get(10) + "/" + nums2.get(10));
				is.setV12(nums1.get(11) + "/" + nums2.get(11));
				is.setTotal(nums1.get(12) + "/" + nums2.get(12));
				isl.add(is);
			}
		} catch (SQLException e) {
			throw new HibernateException(e);
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				throw new HibernateException(e);
			}
		}
		return isl;
	}

	public List<Info> read(String key, int first, int max) {
		String hql = "FROM Info i WHERE i.state = '0' AND i.title LIKE :key ORDER BY i.publishTime DESC";
		log.debug("<hql>: " + hql);

		Session session = getSession();
		Query q = session.createQuery(hql);
		q.setFirstResult(first);
		q.setMaxResults(max);
		q.setString("key", "%" + key + "%");
		List rt = q.list();
		List<Info> list = new ArrayList<Info>();
		for (Object o : rt) {
			list.add((Info) o);
		}
		return list;
	}

	public long count(String key) {
		String hql = "SELECT COUNT(*) FROM Info i WHERE i.state = '0' AND i.title LIKE :key";
		log.debug("<hql>: " + hql);

		Session session = getSession();
		Query q = session.createQuery(hql);
		q.setString("key", "%" + key + "%");

		return (Long) q.uniqueResult();
	}

	public List<Info> readBy(String parentGroupId, int first, int max) {
		String hql = "FROM Info i WHERE i.state = '0' AND i.group.parentGroup.id = :id ORDER BY i.publishTime DESC";
		log.debug("<hql>: " + hql);

		Session session = getSession();
		Query q = session.createQuery(hql);
		q.setFirstResult(first);
		q.setMaxResults(max);
		q.setString("id", parentGroupId);
		List rt = q.list();
		List<Info> list = new ArrayList<Info>();
		for (Object o : rt) {
			list.add((Info) o);
		}
		return list;
	}

	public long countBy(String parentGroupId) {
		String hql = "SELECT COUNT(*) FROM Info i WHERE i.state = '0' AND i.group.parentGroup.id = :id";
		log.debug("<hql>: " + hql);

		Session session = getSession();
		Query q = session.createQuery(hql);
		q.setString("id", parentGroupId);

		return (Long) q.uniqueResult();
	}

	public List<Info> read(String parentGroupId, String orgId, int first,
			int max) {
		String hql = "FROM Info i WHERE i.state = '0' AND i.group.parentGroup.id = :id AND i.org.id = :oid ORDER BY i.publishTime DESC";
		log.debug("<hql>: " + hql);

		Session session = getSession();
		Query q = session.createQuery(hql);
		q.setFirstResult(first);
		q.setMaxResults(max);
		q.setString("id", parentGroupId);
		q.setString("oid", orgId);
		List rt = q.list();
		List<Info> list = new ArrayList<Info>();
		for (Object o : rt) {
			list.add((Info) o);
		}
		return list;
	}

	public long countBy(String parentGroupId, String orgId) {
		String hql = "SELECT COUNT(*) FROM Info i WHERE i.state = '0' AND i.group.parentGroup.id = :id AND i.org.id = :oid";
		log.debug("<hql>: " + hql);

		Session session = getSession();
		Query q = session.createQuery(hql);
		q.setString("id", parentGroupId);
		q.setString("oid", orgId);

		return (Long) q.uniqueResult();
	}
}
