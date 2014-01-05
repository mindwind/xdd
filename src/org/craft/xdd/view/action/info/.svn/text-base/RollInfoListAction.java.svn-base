package org.craft.xdd.view.action.info;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

import org.apache.struts2.interceptor.SessionAware;
import org.craft.xdd.dao.info.InfoDao;
import org.craft.xdd.model.info.Info;
import org.craft.xdd.model.info.InfoGroup;
import org.craft.xdd.model.info.Info.InfoView;
import org.craft.xdd.view.action.JsonAction;

/**
 * Roll info list action.
 * 
 * @author Frank Hu
 * @version 1.0, 2009-9-10
 */
public class RollInfoListAction extends JsonAction implements SessionAware {

	private static final long serialVersionUID = 1L;

	private InfoDao infoDao;

	public RollInfoListAction() {
		super();
		log.debug("<action>: invoke default constructor");
	}

	/**
	 * Invoke this while url <code>listInfo.do</code> be requested
	 * 
	 * @return String
	 * @throws Exception
	 *             on any error
	 */
	public String execute() throws Exception {
		log.debug("<action>: invoke execute()");

		List<Info> il = infoDao.read(InfoGroup.ROLL_GROUP_ID, Info.PASS, 0, 5);
		List<InfoView> list = new ArrayList<InfoView>();
		for (Info i : il) {
			InfoView iv = new InfoView();
			String t = i.getTitle();
			iv.setTitle(t.length() < 17 ? t : t.substring(0, 17) + "...");
			iv.setImgUrl(i.getImgUrl().substring(1));
			iv.setImgLinkUrl("info/viewInfo.do?infoId=" + i.getId());
			list.add(iv);
		}

		JSONArray ja = JSONArray.fromObject(list);
		String json = "{success:true,msg:" + ja.toString() + "}";
		setJson(json);
		return JSON;
	}

	public InfoDao getInfoDao() {
		return infoDao;
	}

	public void setInfoDao(InfoDao infoDao) {
		this.infoDao = infoDao;
	}

}
