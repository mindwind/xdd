package org.craft.xdd.view.action.info;

import java.util.List;

import net.sf.json.JSONArray;

import org.craft.xdd.dao.info.InfoDao;
import org.craft.xdd.dao.support.InfoStat;
import org.craft.xdd.view.action.JsonAction;

/**
 * Info stat action
 * 
 * @author Frank Hu
 * @version 1.0, 2009-9-14
 */
public class InfoStatAction extends JsonAction {

	private static final long serialVersionUID = -2672083016392089318L;

	private InfoDao infoDao;

	private String year;

	/**
	 * Invoke this while url <code>statInfo.do</code> be requested
	 * 
	 * @return String
	 * @throws Exception
	 *             on any error
	 */
	public String execute() throws Exception {
		log.debug("<action>: invoke execute()");

		List<InfoStat> l = infoDao.stat(year);
		JSONArray ja = JSONArray.fromObject(l);
		setJson(ja.toString());
		return JSON;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public InfoDao getInfoDao() {
		return infoDao;
	}

	public void setInfoDao(InfoDao infoDao) {
		this.infoDao = infoDao;
	}

}
