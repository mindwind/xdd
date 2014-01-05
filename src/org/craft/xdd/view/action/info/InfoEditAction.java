package org.craft.xdd.view.action.info;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.craft.xdd.XDDConstants;
import org.craft.xdd.dao.info.InfoDao;
import org.craft.xdd.dao.info.InfoGroupDao;
import org.craft.xdd.model.info.Info;
import org.craft.xdd.service.XDDServiceException;
import org.craft.xdd.service.info.InfoService;
import org.craft.xdd.view.action.JsonAction;

/**
 * <code>Info</code> edit action.
 * 
 * @author Frank Hu
 * @version 1.0, 2009-9-2
 */
public class InfoEditAction extends JsonAction {

	private static final long serialVersionUID = 1L;

	private InfoDao infoDao;

	private InfoGroupDao infoGroupDao;

	private InfoService infoService;

	private String id;

	private String title;

	private String groupId;

	private String infoEditor2;

	private String uploadFileName;

	private String pubTime;

	private File img;

	public InfoEditAction() {
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
			if (!validate2()) {
				return JSON;
			}
			Info i = infoDao.read(id);
			setInfo(i);
			infoService.edit(i);
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

	private void setInfo(Info info) {
		info.setTitle(title);
		info.setContent(infoEditor2);
		info.setGroup(infoGroupDao.read(groupId));
		info.setImg(img);
		info.setFileName(uploadFileName);
		if (pubTime != null && pubTime.trim().length() > 0) {
			info.setPublishTime(convertDate_page2db(pubTime)
					+ new SimpleDateFormat("HHmmss").format(new Date()));
		}

		log.debug("<action>: " + infoEditor2);
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getInfoEditor2() {
		return infoEditor2;
	}

	public void setInfoEditor2(String infoEditor) {
		this.infoEditor2 = infoEditor;
	}

	public InfoService getInfoService() {
		return infoService;
	}

	public void setInfoService(InfoService infoService) {
		this.infoService = infoService;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
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

	public String getPubTime() {
		return pubTime;
	}

	public void setPubTime(String pubTime) {
		this.pubTime = pubTime;
	}

}
