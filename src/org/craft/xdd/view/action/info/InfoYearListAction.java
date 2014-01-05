package org.craft.xdd.view.action.info;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

import org.craft.xdd.dao.info.InfoDao;
import org.craft.xdd.view.action.JsonAction;

/**
 * Info year list action.
 * 
 * @author Frank Hu
 * @version 1.0, 2009-9-14
 */
public class InfoYearListAction extends JsonAction {

	private static final long serialVersionUID = 1L;

	private InfoDao infoDao;

	public InfoYearListAction() {
		super();
		log.debug("<action>: invoke default constructor");
	}

	/**
	 * Invoke this while url <code>listInfoYear.do</code> be requested
	 * 
	 * @return String
	 * @throws Exception
	 *             on any error
	 */
	public String execute() throws Exception {
		log.debug("<action>: invoke execute()");

		List<String> yearList = infoDao.readYearList();
		List<String[]> l = new ArrayList<String[]>();
		for (String y : yearList) {
			String[] yarr = new String[] { y, y };
			l.add(yarr);
		}
		JSONArray ja = JSONArray.fromObject(l);
		setJson(ja.toString());
		return JSON;
	}

	public InfoDao getInfoDao() {
		return infoDao;
	}

	public void setInfoDao(InfoDao infoDao) {
		this.infoDao = infoDao;
	}

}
