package org.craft.xdd.view.action.info;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

import org.apache.struts2.interceptor.SessionAware;
import org.craft.xdd.XDDConstants;
import org.craft.xdd.dao.info.InfoDao;
import org.craft.xdd.dao.user.UserDao;
import org.craft.xdd.model.info.Info;
import org.craft.xdd.model.info.Info.InfoView;
import org.craft.xdd.model.user.Role;
import org.craft.xdd.model.user.User;
import org.craft.xdd.view.action.JsonAction;

/**
 * <code>Info</code> list action.
 * 
 * @author Frank Hu
 * @version 1.0, 2009-9-2
 */
public class InfoListAction extends JsonAction implements SessionAware {

	private static final long serialVersionUID = 1L;

	private InfoDao infoDao;

	private UserDao userDao;

	private String groupId;

	private String state;

	private String from;

	private int start = 0;

	private int limit = 10;

	public InfoListAction() {
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
		if (state == null || state.equals("")) {
			state = "100";
		}
		if (groupId == null || groupId.equals("")) {
			groupId = "100";
		}

		List<Info> il = null;
		long total = 0;
		if (from != null && from.equals("pub")) {
			String userId = (String) session.get(XDDConstants.USER_KEY);
			il = infoDao.read(userId, groupId, Integer.parseInt(state), start,
					limit);
			total = infoDao.count(userId, groupId, Integer.parseInt(state));
		} else if (from != null && from.equals("audit")) {
			il = infoDao.read(groupId, Integer.parseInt(state), start, limit);
			total = infoDao.count(groupId, Integer.parseInt(state));
		}
		List<InfoView> list = new ArrayList<InfoView>();
		for (Info i : il) {
			InfoView iv = new InfoView();
			iv.setId(i.getId());
			iv.setTime(convertDate_db2page(i.getPublishTime().substring(0, 8)));
			iv.setTitle(i.getTitle());
			iv.setGroup(i.getGroup().getName());
			iv.setAuthor(i.getAuthor());
			iv.setAuditor1(i.getAuditor1());
			iv.setAuditor2(i.getAuditor2());
			iv.setState(getStateDesc(i.getState()));
			iv.setOperation(getOperation(i.getState(), i.getId()));
			list.add(iv);
		}

		JSONArray ja = JSONArray.fromObject(list);
		String json = "{totalProperty:" + total + ",root:" + ja.toString()
				+ "}";
		setJson(json);
		return JSON;
	}

	private String getOperation(int state, String id) {
		String desc = "";
		String userId = (String) session.get(XDDConstants.USER_KEY);
		User user = userDao.read(userId);
		Role role = user.getRole();

		// 角色-发布人
		if (role.getId().equals(Role.PUBLISHER)) {
			if (state == Info.DFAFT) {
				desc = getText(XDDConstants.OPERATION_1).replaceAll("%id", id);
			} else if (state == Info.DENY) {
				desc = getText(XDDConstants.OPERATION_10).replaceAll("%id", id);
			} else {
				desc = getText(XDDConstants.OPERATION_2).replaceAll("%id", id);
			}
		}

		// 角色-初审人
		else if (role.getId().equals(Role.AUDITOR1)) {
			if (state == Info.WAIT1) {
				desc = getText(XDDConstants.OPERATION_3).replaceAll("%id", id);
			} else if (state == Info.TEMP) {
				desc = getText(XDDConstants.OPERATION_9).replaceAll("%id", id);
			} else {
				desc = getText(XDDConstants.OPERATION_2).replaceAll("%id", id);
			}
		}

		// 角色-终审人
		else if (role.getId().equals(Role.AUDITOR2)) {
			if (state == Info.WAIT1) {
				desc = getText(XDDConstants.OPERATION_2).replaceAll("%id", id);
			} else if (state == Info.WAIT2) {
				desc = getText(XDDConstants.OPERATION_3).replaceAll("%id", id);
			} else if (state == Info.PASS) {
				desc = getText(XDDConstants.OPERATION_4).replaceAll("%id", id);
			} else if (state == Info.DENY) {
				desc = getText(XDDConstants.OPERATION_2).replaceAll("%id", id);
			} else if (state == Info.TEMP) {
				desc = getText(XDDConstants.OPERATION_9).replaceAll("%id", id);
			}
		}

		// 角色-管理员
		else if (role.getId().equals(Role.ADMIN)) {
			if (from.equals("pub")) {
				if (state == Info.TEMP) {
					desc = getText(XDDConstants.OPERATION_9).replaceAll("%id",
							id);
				} else {
					desc = getText(XDDConstants.OPERATION_1).replaceAll("%id",
							id);
				}
			} else if (from.equals("audit")) {
				if (state == Info.TEMP) {
					desc = getText(XDDConstants.OPERATION_9).replaceAll("%id",
							id);
				} else {
					desc = getText(XDDConstants.OPERATION_3).replaceAll("%id",
							id);
				}
			}
		}

		return desc;
	}

	private String getStateDesc(int state) {
		String desc = "unknown";
		switch (state) {
		case Info.DFAFT:
			desc = getText(XDDConstants.INFO_STATE_DRAFT);
			break;
		case Info.WAIT1:
			desc = getText(XDDConstants.INFO_STATE_WAIT_1);
			break;
		case Info.WAIT2:
			desc = getText(XDDConstants.INFO_STATE_WAIT_2);
			break;
		case Info.PASS:
			desc = getText(XDDConstants.INFO_STATE_PASS);
			break;
		case Info.DENY:
			desc = getText(XDDConstants.INFO_STATE_DENY);
			break;
		case Info.TEMP:
			desc = getText(XDDConstants.INFO_STATE_TEMP);
			break;
		}
		return desc;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
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

	public InfoDao getInfoDao() {
		return infoDao;
	}

	public void setInfoDao(InfoDao infoDao) {
		this.infoDao = infoDao;
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

}
