package org.craft.xdd.view.action.info;

import org.craft.cowork.util.StringUtil;
import org.craft.xdd.dao.info.InfoDao;
import org.craft.xdd.model.info.Info;
import org.craft.xdd.view.action.JsonAction;

/**
 * <code>Info</code> load action.
 * 
 * @author Frank Hu
 * @version 1.0, 2009-9-2
 */
public class InfoLoadAction extends JsonAction {

	private static final long serialVersionUID = 1L;

	private InfoDao infoDao;

	private String id;

	public InfoLoadAction() {
		super();
		log.debug("<action>: invoke default constructor");
	}

	/**
	 * Invoke this while url <code>loadInfo.do</code> be requested
	 * 
	 * @return String
	 * @throws Exception
	 *             on any error
	 */
	public String execute() throws Exception {
		log.debug("<action>: invoke execute()");
		try {
			Info i = infoDao.read(id);
			String s = "{title:'%1', pubTime:'%2', groupId:'%3', content:'%4'}";
			String c = i.getContent();
			if (c != null) {
				c = c.replaceAll("\r", "");
				c = c.replaceAll("\n", "");
				c = c.replaceAll("'", "&apos;");
//				c = c.replaceAll("\"", "&quot;");
			} else {
				c = "";
			}
			String[] v = new String[] { i.getTitle(),
					convertDate_db2page(i.getPublishTime().substring(0, 8)),
					i.getGroup().getId(), c };
			String json = StringUtil.getReplaceString(s, v);
			setJson(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JSON;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public InfoDao getInfoDao() {
		return infoDao;
	}

	public void setInfoDao(InfoDao infoDao) {
		this.infoDao = infoDao;
	}

}
