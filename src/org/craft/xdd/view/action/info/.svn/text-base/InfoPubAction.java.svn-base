package org.craft.xdd.view.action.info;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.struts2.interceptor.SessionAware;
import org.craft.xdd.XDDConstants;
import org.craft.xdd.dao.info.InfoGroupDao;
import org.craft.xdd.dao.user.UserDao;
import org.craft.xdd.model.info.Info;
import org.craft.xdd.model.user.Role;
import org.craft.xdd.model.user.User;
import org.craft.xdd.service.XDDServiceException;
import org.craft.xdd.service.info.InfoService;
import org.craft.xdd.view.action.JsonAction;

/**
 * Info pub action.
 * 
 * @author Frank Hu
 * @version 1.0, 2009-9-1
 */
public class InfoPubAction extends JsonAction implements SessionAware {

	private static final long serialVersionUID = 4403108848221339844L;

	private InfoGroupDao infoGroupDao;

	private UserDao userDao;

	private InfoService infoService;

	private String title;

	private String pubTime;

	private String groupId;

	private String infoEditor;

	private String uploadFileName;

	private File img;

	public InfoPubAction() {
		super();
		log.debug("<action>: invoke default constructor");
	}

	public String draft() throws Exception {
		try {
			if (!validate2()) {
				return JSON;
			}
			Info info = getInfo();
			if (isSpecialRole()) {
				info.setState(Info.PASS);
			} else {
				info.setState(Info.DFAFT);
			}
			infoService.add(info);
		} catch (XDDServiceException e) {
			setJson(json(getMessage(e), false));
			return JSON;
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw e;
		}
		setJson(JSON_SUCCESS);
		return JSON;
	}

	public String audit() throws Exception {
		try {
			if (!validate2()) {
				return JSON;
			}
			Info info = getInfo();
			if (isSpecialRole()) {
				info.setState(Info.PASS);
			} else {
				info.setState(Info.WAIT1);
			}
			infoService.add(info);
		} catch (XDDServiceException e) {
			setJson(json(getMessage(e), false));
			return JSON;
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw e;
		}
		setJson(JSON_SUCCESS);
		return JSON;
	}

	/** 判断是否是天气发布员特殊角色 */
	private boolean isSpecialRole() {
		String userId = (String) session.get(XDDConstants.USER_KEY);
		User user = userDao.read(userId);
		Role role = user.getRole();
		if (role.getId().trim().equals("4")) {
			return true;
		}
		return false;
	}

	private Info getInfo() {
		Info info = new Info();
		info.setTitle(title);
		info.setContent(infoEditor);
		info.setGroup(infoGroupDao.read(groupId));
		info.setAuthor((String) session.get(XDDConstants.USER_KEY));
		info.setImg(img);
		info.setFileName(uploadFileName);
		if (pubTime != null && pubTime.trim().length() > 0) {
			info.setPublishTime(convertDate_page2db(pubTime) + new SimpleDateFormat("HHmmss").format(new Date()));
		} else {
			info.setPublishTime(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));
		}

		log.debug("<action>: " + infoEditor);
		return info;
	}

	private boolean validate2() {
		log.debug("<action>: invoke validate2()");

		boolean b = true;
		if (valNull(title)) {
			setJson(json(getText(XDDConstants.ERR_TITLE_REQUIRED), false));
			b = false;
		}
		return b;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public File getImg() {
		return img;
	}

	public void setImg(File img) {
		this.img = img;
	}

	public String getInfoEditor() {
		return infoEditor;
	}

	public void setInfoEditor(String infoEditor) {
		this.infoEditor = infoEditor;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public InfoGroupDao getInfoGroupDao() {
		return infoGroupDao;
	}

	public void setInfoGroupDao(InfoGroupDao infoGroupDao) {
		this.infoGroupDao = infoGroupDao;
	}

	public InfoService getInfoService() {
		return infoService;
	}

	public void setInfoService(InfoService infoService) {
		this.infoService = infoService;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getPubTime() {
		return pubTime;
	}

	public void setPubTime(String pubTime) {
		this.pubTime = pubTime;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

}
