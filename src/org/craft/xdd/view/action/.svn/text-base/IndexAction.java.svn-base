package org.craft.xdd.view.action;

import java.util.ArrayList;
import java.util.List;

import org.craft.xdd.dao.user.OrgDao;
import org.craft.xdd.model.info.Info;
import org.craft.xdd.model.info.InfoGroup;
import org.craft.xdd.model.info.Info.InfoView;
import org.craft.xdd.model.user.Org;

/**
 * Index action
 * 
 * @author Frank Hu
 * @version 1.0, 2009-9-10
 */
public class IndexAction extends CommonAction {

	private static final long serialVersionUID = 1L;
	
	private OrgDao orgDao;
	
	private List<Org> orgs1;
	
	private List<Org> orgs2;

	/** 热点聚焦 */
	private InfoView info = new InfoView();

	/** 热点新闻列表 */
	private List<InfoView> hlist = new ArrayList<InfoView>();

	/** 政府建设列表 */
	private List<InfoView> glist = new ArrayList<InfoView>();

	/** 通知公告列表 */
	private List<InfoView> nlist = new ArrayList<InfoView>();

	/** 经济建设列表 */
	private List<InfoView> elist = new ArrayList<InfoView>();

	/** 社会生活列表 */
	private List<InfoView> plist = new ArrayList<InfoView>();
	
	/** 图说喜德列表 */
	private List<InfoView> xlist = new ArrayList<InfoView>();

	public IndexAction() {
		super();
		log.debug("<action>: invoke default constructor");
	}

	/**
	 * Invoke this while url <code>index.do</code> be requested
	 * 
	 * @return String
	 * @throws Exception
	 *             on any error
	 */
	public String execute() throws Exception {
		log.debug("<action>: invoke execute()");
		setXlist();
		setOneList();
		setWeather();
		setDailyInfo();
		setHlist();
		setGlist();
		setNlist();
		setElist();
		setPlist();
		orgs1 = orgDao.read(Org.TYPE_B);
		orgs2 = orgDao.read(Org.TYPE_X);
		return SUCCESS;
	}
	
	private void setXlist() {
		List<Info> l = infoDao.read(InfoGroup.XD_GROUP_ID, Info.PASS, 0, 8);
		for (Info i : l) {
			InfoView iv = new InfoView();
			String t = i.getTitle();
			iv.setId(i.getId());
			iv.setTitle(t.length() < 22? t : t.substring(0, 22) + "...");
			iv.setTime(convertDate_db2page(i.getPublishTime().substring(0, 8)));
			xlist.add(iv);
		}
	}

	private void setPlist() {
		List<Info> l = infoDao.read(InfoGroup.PUB_GROUP_ID, Info.PASS, 0, 8);
		for (Info i : l) {
			InfoView iv = new InfoView();
			String t = i.getTitle();
			iv.setId(i.getId());
			iv.setTitle(t.length() < 18 ? t : t.substring(0, 18) + "...");
			iv.setTime(convertDate_db2page(i.getPublishTime().substring(0, 8)));
			plist.add(iv);
		}
	}

	private void setElist() {
		List<Info> l = infoDao
				.read(InfoGroup.ECONOMY_GROUP_ID, Info.PASS, 0, 8);
		for (Info i : l) {
			InfoView iv = new InfoView();
			String t = i.getTitle();
			iv.setId(i.getId());
			iv.setTitle(t.length() < 12 ? t : t.substring(0, 12) + "...");
			iv.setTime(convertDate_db2page(i.getPublishTime().substring(0, 8)));
			elist.add(iv);
		}
	}

	private void setNlist() {
		List<Info> l = infoDao.read(InfoGroup.NOTICE_GROUP_ID, Info.PASS, 0, 8);
		for (Info i : l) {
			InfoView iv = new InfoView();
			String t = i.getTitle();
			iv.setId(i.getId());
			iv.setTitle(t.length() < 18 ? t : t.substring(0, 18) + "...");
			iv.setTime(convertDate_db2page(i.getPublishTime().substring(0, 8)));
			nlist.add(iv);
		}
	}

	private void setGlist() {
		List<Info> l = infoDao.read(InfoGroup.GOV_GROUP_ID, Info.PASS, 0, 8);
		for (Info i : l) {
			InfoView iv = new InfoView();
			String t = i.getTitle();
			iv.setId(i.getId());
			iv.setTitle(t.length() < 12 ? t : t.substring(0, 12) + "...");
			iv.setTime(convertDate_db2page(i.getPublishTime().substring(0, 8)));
			glist.add(iv);
		}
	}

	private void setHlist() {
		List<Info> l = infoDao.read(InfoGroup.HOT_GROUP_ID, Info.PASS, 0, 8);
		for (Info i : l) {
			InfoView iv = new InfoView();
			String t = i.getTitle();
			iv.setId(i.getId());
			iv.setTitle(t.length() < 18 ? t : t.substring(0, 18) + "...");
			iv.setTime(convertDate_db2page(i.getPublishTime().substring(0, 8)));
			hlist.add(iv);
		}
	}

	private void setDailyInfo() {
		List<Info> l = infoDao.read(InfoGroup.DAILY_GROUP_ID, Info.PASS, 0, 1);
		if (l != null && l.size() > 0) {
			Info i = l.get(0);
			info.setId(i.getId());
			info.setTitle(i.getTitle());
			info
					.setTime(convertDate_db2page(i.getPublishTime().substring(
							0, 8)));
		}
	}

	public List<InfoView> getElist() {
		return elist;
	}

	public void setElist(List<InfoView> elist) {
		this.elist = elist;
	}

	public List<InfoView> getGlist() {
		return glist;
	}

	public void setGlist(List<InfoView> glist) {
		this.glist = glist;
	}

	public List<InfoView> getHlist() {
		return hlist;
	}

	public void setHlist(List<InfoView> hlist) {
		this.hlist = hlist;
	}

	public InfoView getInfo() {
		return info;
	}

	public void setInfo(InfoView info) {
		this.info = info;
	}

	public List<InfoView> getNlist() {
		return nlist;
	}

	public void setNlist(List<InfoView> nlist) {
		this.nlist = nlist;
	}

	public List<InfoView> getPlist() {
		return plist;
	}

	public void setPlist(List<InfoView> plist) {
		this.plist = plist;
	}

	public List<InfoView> getXlist() {
		return xlist;
	}

	public void setXlist(List<InfoView> xlist) {
		this.xlist = xlist;
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

	public OrgDao getOrgDao() {
		return orgDao;
	}

	public void setOrgDao(OrgDao orgDao) {
		this.orgDao = orgDao;
	}

}
