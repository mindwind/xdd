package org.craft.xdd.view.action.info;

import org.craft.xdd.model.info.Info;
import org.craft.xdd.view.action.CommonAction;

/**
 * Info view action
 * 
 * @author Frank Hu
 * @version 1.0, 2009-9-4
 */
public class InfoViewAction extends CommonAction {

	private static final long serialVersionUID = 1L;

	private String infoId;

	private Info info;

	private String pubDate;

	public InfoViewAction() {
		super();
		log.debug("<action>: invoke default constructor");
	}

	/**
	 * Invoke this while url <code>viewInfo.do</code> be requested
	 * 
	 * @return String
	 * @throws Exception
	 *             on any error
	 */
	public String execute() throws Exception {
		log.debug("<action>: invoke execute()");
		setOneList();
		setWeather();
		info = infoDao.read(infoId);
		pubDate = convertDate_db2page(info.getPublishTime());
		return SUCCESS;
	}

	public Info getInfo() {
		return info;
	}

	public void setInfo(Info info) {
		this.info = info;
	}

	public String getInfoId() {
		return infoId;
	}

	public void setInfoId(String infoId) {
		this.infoId = infoId;
	}

	public String getPubDate() {
		return pubDate;
	}

	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}

}
