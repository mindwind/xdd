package org.craft.xdd.view.action.user;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

import org.craft.xdd.dao.user.OrgDao;
import org.craft.xdd.model.user.Org;
import org.craft.xdd.view.action.JsonAction;

/**
 * <code>Org</code> list action.
 * 
 * @author Frank Hu
 * @version 1.0, 2009/9/7
 */
public class OrgListAction extends JsonAction {

	private static final long serialVersionUID = 8395178628959366021L;

	private OrgDao orgDao;

	public OrgListAction() {
		super();
		log.debug("<action>: invoke default constructor");
	}

	/**
	 * Invoke this while url <code>listOrg.do</code> be requested
	 * 
	 * @return String
	 * @throws Exception
	 *             on any error
	 */
	public String execute() throws Exception {
		log.debug("<action>: invoke execute()");

		List<Org> ol = orgDao.read(Org.class);
		List<String[]> list = new ArrayList<String[]>();
		for (Org org : ol) {
			String[] sarr = new String[] { org.getId(), org.getName() };
			list.add(sarr);
		}
		JSONArray ja = JSONArray.fromObject(list);
		setJson(ja.toString());

		return JSON;
	}

	public OrgDao getOrgDao() {
		return orgDao;
	}

	public void setOrgDao(OrgDao orgDao) {
		this.orgDao = orgDao;
	}

}
