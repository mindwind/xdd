package org.craft.xdd.service.info;

import java.util.List;

import org.craft.cowork.service.BusinessService;
import org.craft.xdd.model.info.Info;
import org.craft.xdd.model.info.InfoGroup;
import org.craft.xdd.service.XDDServiceException;

/**
 * Info Service
 * 
 * @author Frank Hu
 * @version 1.0, 2009-9-1
 */
public interface InfoService extends BusinessService {

	/**
	 * List group by level
	 * 
	 * @param level
	 * @return
	 */
	public List<InfoGroup> listGroup(int level);

	/**
	 * Add info
	 * 
	 * @param info
	 * @throws XDDAuthException
	 */
	public void add(Info info) throws XDDServiceException;

	/**
	 * Edit info
	 * 
	 * @param info
	 * @throws XDDAuthException
	 */
	public void edit(Info info) throws XDDServiceException;

	/**
	 * Submit info for audit
	 * 
	 * @param id
	 *            info id
	 * @throws XDDAuthException
	 */
	public void submit(String id) throws XDDServiceException;

	/**
	 * Pass info for audit
	 * 
	 * @param infoId
	 * @param userId
	 * @throws XDDAuthException
	 */
	public void pass(String infoId, String userId) throws XDDServiceException;

	/**
	 * Deny info for audit
	 * 
	 * @param infoId
	 * @param userId
	 * @throws XDDAuthException
	 */
	public void deny(String infoId, String userId) throws XDDServiceException;
	
	/**
	 * Copy info
	 * 
	 * @param infoId
	 * @throws XDDServiceException
	 */
	public void copy(String infoId) throws XDDServiceException;

	/**
	 * Del info
	 * 
	 * @param id
	 * @param userId
	 * @throws XDDAuthException
	 */
	public void delete(String id, String userId) throws XDDServiceException;

	/**
	 * List info by group and state, when state=100 return all state info.
	 * 
	 * @param groupId
	 * @param state
	 * @return
	 */
	public List<Info> listInfo(String groupId, int state, int first, int max);

}
