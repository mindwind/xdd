package org.craft.xdd.dao.info;

import java.util.List;

import org.craft.cowork.dao.GenericDao;
import org.craft.xdd.dao.support.InfoStat;
import org.craft.xdd.model.info.Info;

/**
 * The <code>Info</code> entity dao interface
 * 
 * @author Frank Hu
 * @version 1.0, 2009/8/29
 */
public interface InfoDao extends GenericDao<Info, String> {

	/**
	 * Read info by group and state, when state=100 return all state info.
	 * 
	 * @param groupId
	 * @param state
	 * @param first
	 * @param max
	 * @return
	 */
	public List<Info> read(String groupId, int state, int first, int max);

	/**
	 * Read info by user, group and state, when state=100 return all state info.
	 * 
	 * @param userId
	 * @param groupId
	 * @param state
	 * @param first
	 * @param max
	 * @return
	 */
	public List<Info> read(String userId, String groupId, int state, int first,
			int max);

	/**
	 * Count by group and state, when state=100 return all state info.
	 * 
	 * @param groupId
	 * @param state
	 * @return
	 */
	public long count(String groupId, int state);
	
	/**
	 * Count by user, group and state, when state=100 return all state info.
	 * 
	 * @param userId
	 * @param groupId
	 * @param state
	 * @return
	 */
	public long count(String userId, String groupId, int state);

	/**
	 * Read info by key and state, when state=100 return all state info.
	 * 
	 * @param groupId
	 * @param first
	 * @param max
	 * @return
	 */
	public List<Info> read(String key, int first, int max);

	/**
	 * Count by key
	 * 
	 * @param key
	 * @return
	 */
	public long count(String key);

	/**
	 * Read info year list.
	 * 
	 * @return
	 */
	public List<String> readYearList();

	/**
	 * Stat info
	 * 
	 * @param year
	 * @return
	 */
	public List<InfoStat> stat(String year);
	
	/**
	 * Read Info by parent group
	 * 
	 * @param parentGroupId 
	 * @param first
	 * @param max
	 * @return
	 */
	public List<Info> readBy(String parentGroupId, int first, int max);
	
	/**
	 * Count by parent group
	 * 
	 * @param parentGroupId
	 * @return
	 */
	public long countBy(String parentGroupId);
	
	/**
	 * Read Info by parent group and org
	 * 
	 * @param parentGroupId
	 * @param orgId
	 * @param first
	 * @param max
	 * @return
	 */
	public List<Info> read(String parentGroupId, String orgId, int first, int max);
	
	/**
	 * Count by parent group and org
	 * 
	 * @param parentGroupId
	 * @param orgId
	 * @return
	 */
	public long countBy(String parentGroupId, String orgId);

}