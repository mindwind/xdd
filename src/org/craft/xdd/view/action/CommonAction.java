package org.craft.xdd.view.action;

import java.util.List;

import org.craft.xdd.dao.info.InfoDao;
import org.craft.xdd.dao.info.InfoGroupDao;
import org.craft.xdd.model.info.Info;
import org.craft.xdd.model.info.InfoGroup;
import org.craft.xdd.model.info.Info.InfoView;

/**
 * Common function support for action
 * 
 * 
 * @author Frank Hu
 * @version 1.0, 2009/9/16
 */
public abstract class CommonAction extends JsonAction {

	protected InfoDao infoDao;

	protected InfoGroupDao infoGroupDao;

	/** 天气预报 */
	protected InfoView weather = new InfoView();

	/** 一级栏目列表 */
	protected List<InfoGroup> oneList;

	protected void setOneList() {
		oneList = infoGroupDao.read(0);
	}

	protected void setWeather() {
		Info info = null;
		List<Info> l = infoDao.read(InfoGroup.WEATHER_ID, Info.PASS, 0, 1);
		if (l != null && l.size() > 0) {
			info = l.get(0);
			String title = info.getTitle();
			weather.setId(info.getId());
			weather.setTitle(title);
		}
	}

	public List<InfoGroup> getOneList() {
		return oneList;
	}

	public void setOneList(List<InfoGroup> oneList) {
		this.oneList = oneList;
	}

	public InfoView getWeather() {
		return weather;
	}

	public void setWeather(InfoView weather) {
		this.weather = weather;
	}

	public InfoDao getInfoDao() {
		return infoDao;
	}

	public void setInfoDao(InfoDao infoDao) {
		this.infoDao = infoDao;
	}

	public InfoGroupDao getInfoGroupDao() {
		return infoGroupDao;
	}

	public void setInfoGroupDao(InfoGroupDao infoGroupDao) {
		this.infoGroupDao = infoGroupDao;
	}

}
