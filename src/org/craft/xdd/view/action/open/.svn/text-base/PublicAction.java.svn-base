package org.craft.xdd.view.action.open;

import java.util.List;

import org.craft.xdd.dao.user.OrgDao;
import org.craft.xdd.model.user.Org;
import org.craft.xdd.view.action.CommonAction;

/**
 * Public action
 * 
 * @author Frank Hu
 * @version 1.0, 2009-11-07
 */
public class PublicAction extends CommonAction {

	private static final long serialVersionUID = -1820223657822102284L;
	
	private OrgDao orgDao;
	
	private List<Org> orgs1;
	
	private List<Org> orgs2;

	public PublicAction() {
		super();
	}

	/**
	 * Invoke this while url <code>public.do</code> be requested
	 * 
	 * @return String
	 * @throws Exception
	 *             on any error
	 */
	public String execute() throws Exception {
		log.debug("<action>: invoke execute()");
		
		this.setOneList();
		this.setWeather();
		
		orgs1 = orgDao.read(Org.TYPE_B);
		orgs2 = orgDao.read(Org.TYPE_X);
		
		return SUCCESS;
	}

	public OrgDao getOrgDao() {
		return orgDao;
	}

	public void setOrgDao(OrgDao orgDao) {
		this.orgDao = orgDao;
	}

	public List<Org> getOrgs1() {
		return orgs1;
	}

	public void setOrgs1(List<Org> orgs1) {
		this.orgs1 = orgs1;
	}

	public List<Org> getOrgs2() {
		return orgs2;
	}

	public void setOrgs2(List<Org> orgs2) {
		this.orgs2 = orgs2;
	}

}
