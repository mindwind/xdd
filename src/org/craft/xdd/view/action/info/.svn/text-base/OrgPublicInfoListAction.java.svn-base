package org.craft.xdd.view.action.info;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.interceptor.SessionAware;
import org.craft.xdd.XDDConstants;
import org.craft.xdd.model.info.Info;
import org.craft.xdd.model.info.InfoGroup;
import org.craft.xdd.model.info.Info.InfoView;
import org.craft.xdd.view.action.CommonAction;
import org.craft.xdd.view.action.support.PageBreak;

/**
 * Org public info list action.(公开信息列表-按机构区分)
 * 
 * @author Frank Hu
 * @version 1.0, 2009-11-8
 */
public class OrgPublicInfoListAction extends CommonAction implements SessionAware {

	private static final long serialVersionUID = 1L;

	private PageBreak pageBreak = new PageBreak();

	private int start = 0;

	private int limit = pageBreak.getPageItemNum();
	
	private String orgId;
	
	private String pid = XDDConstants.INFO_GROUP_ID_PUBLIC;
	
	private String orgName;

	private List<InfoView> list = new ArrayList<InfoView>();
	
	private InfoGroup ig = new InfoGroup();

	public OrgPublicInfoListAction() {
		super();
		log.debug("<action>: invoke default constructor");
	}

	/**
	 * Invoke this while url <code>listOrgPublicInfo.do</code> be requested
	 * 
	 * @return String
	 * @throws Exception
	 *             on any error
	 */
	public String execute() throws Exception {
		log.debug("<action>: invoke execute()");
		
		setOneList();
		setWeather();
		InfoGroup g = infoGroupDao.read(XDDConstants.INFO_GROUP_ID_PUBLIC);
		ig.setName(g.getName() + "-" + orgName);

		start = (pageBreak.getCurrPage() - 1) * pageBreak.getPageItemNum();
		List<Info> il = infoDao.read(pid, orgId, start, limit);
		for (Info i : il) {
			InfoView iv = new InfoView();
			iv.setId(i.getId());
			iv.setTime(convertDate_db2page(i.getPublishTime().substring(0, 8)));
			iv.setTitle(getTitle(i.getTitle()));
			iv.setGroup(i.getGroup().getName());
			iv.setAuthor(i.getAuthor());
			iv.setAuditor1(i.getAuditor1());
			iv.setAuditor2(i.getAuditor2());
			list.add(iv);
		}

		// Set page break parameters
		long total = infoDao.countBy(pid, orgId);
		pageBreak.setBaseLink("listOrgPublicInfo.do?orgId=" + orgId + "&orgName=" + orgName);
		pageBreak.setTotal(total);
		pageBreak.setPageList();

		return SUCCESS;
	}

	private String getTitle(String title) {
		String t = null;
		if (title.length() > 50) {
			t = title.substring(0, 50) + "...";
		} else {
			t = title;
		}
		return t;
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

	public PageBreak getPageBreak() {
		return pageBreak;
	}

	public void setPageBreak(PageBreak pageBreak) {
		this.pageBreak = pageBreak;
	}

	public String getOrgId() {
		return orgId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}

	public InfoGroup getIg() {
		return ig;
	}

	public void setIg(InfoGroup ig) {
		this.ig = ig;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

}
