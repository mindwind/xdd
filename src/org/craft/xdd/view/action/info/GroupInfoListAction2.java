package org.craft.xdd.view.action.info;

import org.apache.struts2.interceptor.SessionAware;
import org.craft.xdd.model.info.InfoGroup;
import org.craft.xdd.view.action.CommonAction;

/**
 * Group info list action version 2
 * 
 * @author Frank Hu
 * @version 1.0, 2011-3-25
 */
public class GroupInfoListAction2 extends CommonAction implements SessionAware {

	private static final long serialVersionUID = 1L;

	private String gid;

	private String groupFullName;

	public GroupInfoListAction2() {
		super();
		log.debug("<action>: invoke default constructor");
	}

	/**
	 * Invoke this while url <code>listGroupInfo.do</code> be requested
	 * 
	 * @return String
	 * @throws Exception
	 *             on any error
	 */
	public String execute() throws Exception {
		setOneList();

		InfoGroup ig = infoGroupDao.read(gid);
		groupFullName = ig.getFullName();

		return SUCCESS;
	}

	public String getGid() {
		return gid;
	}

	public void setGid(String gid) {
		this.gid = gid;
	}

	public String getGroupFullName() {
		return groupFullName;
	}

	public void setGroupFullName(String groupFullName) {
		this.groupFullName = groupFullName;
	}

}
