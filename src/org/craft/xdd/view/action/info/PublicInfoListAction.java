package org.craft.xdd.view.action.info;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

import org.apache.struts2.interceptor.SessionAware;
import org.craft.xdd.XDDConstants;
import org.craft.xdd.dao.info.InfoDao;
import org.craft.xdd.model.info.Info;
import org.craft.xdd.model.info.Info.InfoView;
import org.craft.xdd.view.action.JsonAction;

/**
 * Public info list action. (公开信息列表)
 * 
 * @author Frank Hu
 * @version 1.0, 2009-11-07
 */
public class PublicInfoListAction extends JsonAction implements SessionAware {

	private static final long serialVersionUID = 4524497349003578549L;

	private InfoDao infoDao;

	private int start = 0;

	private int limit = 10;

	private List<InfoView> list = new ArrayList<InfoView>();

	public PublicInfoListAction() {
		super();
		log.debug("<action>: invoke default constructor");
	}

	/**
	 * Invoke this while url <code>listPublicInfo.do</code> be requested
	 * 
	 * @return String
	 * @throws Exception
	 *             on any error
	 */
	public String execute() throws Exception {
		log.debug("<action>: invoke execute()");

		List<Info> il = infoDao.readBy(XDDConstants.INFO_GROUP_ID_PUBLIC, start, limit);
		List<InfoView> list = new ArrayList<InfoView>();
		for (Info i : il) {
			InfoView iv = new InfoView();
			iv.setId(i.getId());
			iv.setTime(convertDate_db2page(i.getPublishTime().substring(0, 8)));
			iv.setTitle("<a href='../info/viewInfo.do?infoId=" + i.getId()
					+ "' target='_blank'>" + i.getTitle() + "</a>");
			iv.setGroup(i.getGroup().getName());
			iv.setOrg(i.getOrg() != null ? i.getOrg().getName() : "");
			list.add(iv);
		}
		long total = infoDao.countBy(XDDConstants.INFO_GROUP_ID_PUBLIC);
		JSONArray ja = JSONArray.fromObject(list);
		String json = "{totalProperty:" + total + ",root:" + ja.toString()
				+ "}";
		setJson(json);

		return JSON;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public List<InfoView> getList() {
		return list;
	}

	public void setList(List<InfoView> list) {
		this.list = list;
	}

	public InfoDao getInfoDao() {
		return infoDao;
	}

	public void setInfoDao(InfoDao infoDao) {
		this.infoDao = infoDao;
	}

}
