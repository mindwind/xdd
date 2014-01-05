package org.craft.xdd.view.action.info;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

import org.apache.struts2.interceptor.SessionAware;
import org.craft.xdd.XDDConstants;
import org.craft.xdd.dao.info.InfoGroupDao;
import org.craft.xdd.dao.user.UserDao;
import org.craft.xdd.model.info.InfoGroup;
import org.craft.xdd.model.user.Role;
import org.craft.xdd.model.user.User;
import org.craft.xdd.service.info.InfoService;
import org.craft.xdd.view.action.JsonAction;

/**
 * <code>InfoGroup</code> list action.
 * 
 * @author Frank Hu
 * @version 1.0, 2009-9-1
 */
/**
 * @author Administrator
 * @version 1.0, 2010-8-5
 */
/**
 * @author Administrator
 * @version 1.0, 2010-8-5
 */
public class InfoGroupListAction extends JsonAction implements SessionAware {

	private static final long serialVersionUID = 8395178628959366021L;

	private InfoService infoService;

	private UserDao userDao;

	private InfoGroupDao infoGroupDao;

	private int level;

	public InfoGroupListAction() {
		super();
		log.debug("<action>: invoke default constructor");
	}

	/**
	 * Invoke this while url <code>listInfoGroup.do</code> be requested
	 * 
	 * @return String
	 * @throws Exception
	 *             on any error
	 */
	public String execute() throws Exception {
		log.debug("<action>: invoke execute()");

		// 角色[天气发布员]只显示天气预报栏目,其他角色显示全部栏目

		List<InfoGroup> gl = loadGroups();
		List<String[]> list = new ArrayList<String[]>();
		for (InfoGroup ig : gl) {
			String fname = ig.getParentGroup().getName() + "-->" + ig.getName();
			String[] sarr = new String[] { ig.getId(), fname };
			list.add(sarr);
		}
		JSONArray ja = JSONArray.fromObject(list);
		setJson(ja.toString());

		return JSON;
	}

	private List<InfoGroup> loadGroups() {
		List<InfoGroup> gl = new ArrayList<InfoGroup>();
		String userId = (String) session.get(XDDConstants.USER_KEY);
		User user = userDao.read(userId);
		Role role = user.getRole();
		if (role.getId().trim().equals("4")) {
			// 天气发布员
			InfoGroup ig = infoGroupDao.read("S_5");
			gl.add(ig);
		} else {
			gl = infoService.listGroup(level);
		}

		return gl;
	}

	public void setInfoService(InfoService infoService) {
		this.infoService = infoService;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public void setInfoGroupDao(InfoGroupDao infoGroupDao) {
		this.infoGroupDao = infoGroupDao;
	}

}
