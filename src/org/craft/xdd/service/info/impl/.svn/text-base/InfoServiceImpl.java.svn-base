package org.craft.xdd.service.info.impl;

import java.io.File;
import java.util.Date;
import java.util.List;

import org.craft.cowork.util.FileUtil;
import org.craft.xdd.XDDConstants;
import org.craft.xdd.dao.info.InfoDao;
import org.craft.xdd.dao.info.InfoGroupDao;
import org.craft.xdd.dao.user.UserDao;
import org.craft.xdd.model.info.Info;
import org.craft.xdd.model.info.InfoGroup;
import org.craft.xdd.model.user.Role;
import org.craft.xdd.model.user.User;
import org.craft.xdd.service.AbstractService;
import org.craft.xdd.service.XDDServiceException;
import org.craft.xdd.service.info.InfoService;
import org.springframework.transaction.annotation.Transactional;

/**
 * The default implementation of <code>InfoService</code> interface
 * 
 * @author Frank Hu
 * @version 1.0, 2009/8/29
 */
public class InfoServiceImpl extends AbstractService implements InfoService {

	private InfoGroupDao infoGroupDao;

	private InfoDao infoDao;

	private UserDao userDao;

	@Transactional(readOnly = true)
	public List<InfoGroup> listGroup(int level) {
		return infoGroupDao.read(level);
	}

	@Transactional(readOnly = false, rollbackFor = XDDServiceException.class)
	public void add(Info info) throws XDDServiceException {
		try {
			File img = info.getImg();
			if (img != null) {
				String saveName = new Date().getTime()
						+ FileUtil.suffix(info.getFileName());
				File dst = new File(XDDConstants.UPLOAD_PATH + "/cover/"
						+ saveName);
				FileUtil.copy(img, dst);
				info.setImgUrl("/upload/cover/" + saveName);
			}

			// 增加信息发布人所属组织机构 2009/11/07
			User u = userDao.read(info.getAuthor());
			info.setOrg(u.getOrg());
			infoDao.create(info);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new XDDServiceException(XDDConstants.ERR_SYSTEM);
		}
	}

	@Transactional(readOnly = false, rollbackFor = XDDServiceException.class)
	public void edit(Info info) throws XDDServiceException {
		try {
			File img = info.getImg();
			if (img != null) {
				String saveName = new Date().getTime()
						+ FileUtil.suffix(info.getFileName());
				File dst = new File(XDDConstants.UPLOAD_PATH + "/cover/"
						+ saveName);
				FileUtil.copy(img, dst);
				info.setImgUrl("/upload/cover/" + saveName);
			}
			infoDao.update(info);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new XDDServiceException(XDDConstants.ERR_SYSTEM);
		}
	}

	@Transactional(readOnly = false, rollbackFor = XDDServiceException.class)
	public void submit(String id) throws XDDServiceException {
		Info info = infoDao.read(id);
		int state = info.getState();

		// 状态[草稿]或[退回]的信息可提交审核
		if (state != Info.DFAFT && state != Info.DENY) {
			throw new XDDServiceException(XDDConstants.ERR_INFO_STATE);
		}

		info.setState(Info.WAIT1);
		infoDao.update(info);
	}

	@Transactional(readOnly = false, rollbackFor = XDDServiceException.class)
	public void pass(String infoId, String userId) throws XDDServiceException {
		Info info = infoDao.read(infoId);
		User user = userDao.read(userId);
		check4pass(info, user);
		if (info.getState() == Info.WAIT1) {
			info.setState(Info.WAIT2);
			info.setAuditor1(userId);
		} else if (info.getState() == Info.WAIT2) {
			info.setState(Info.PASS);
			info.setAuditor2(userId);
		}
		infoDao.update(info);
	}

	@Transactional(readOnly = false, rollbackFor = XDDServiceException.class)
	public void deny(String infoId, String userId) throws XDDServiceException {
		Info info = infoDao.read(infoId);
		User user = userDao.read(userId);
		check4deny(info, user);
		info.setState(Info.DENY);
		infoDao.update(info);
	}

	@Transactional(readOnly = false, rollbackFor = XDDServiceException.class)
	public void copy(String infoId) throws XDDServiceException {
		Info i = infoDao.read(infoId);
		i.setState(Info.DENY);
		infoDao.update(i);
		Info ni = new Info();
		ni.setTitle(i.getTitle());
		ni.setAuditor1(i.getAuditor1());
		ni.setAuditor2(i.getAuditor2());
		ni.setAuthor(i.getAuthor());
		ni.setContent(i.getContent());
		ni.setGroup(i.getGroup());
		ni.setImgLinkUrl(i.getImgLinkUrl());
		ni.setImgUrl(i.getImgUrl());
		ni.setPublishTime(i.getPublishTime());
		ni.setState(Info.TEMP);
		infoDao.create(ni);
	}

	private void check4pass(Info info, User user) throws XDDServiceException {
		int state = info.getState();
		Role role = user.getRole();

		// 状态[待初审]或[待终审]的信息可通过审核
		if (state != Info.WAIT1 && state != Info.WAIT2) {
			throw new XDDServiceException(XDDConstants.ERR_INFO_STATE);
		}

		// 用户角色和信息状态匹配检查
		if (state == Info.WAIT1 && !role.getId().equals(Role.AUDITOR1)
				&& !role.getId().equals(Role.ADMIN)) {
			throw new XDDServiceException(XDDConstants.ERR_OPERATION);
		}
		if (state == Info.WAIT2 && !role.getId().equals(Role.AUDITOR2)
				&& !role.getId().equals(Role.ADMIN)) {
			throw new XDDServiceException(XDDConstants.ERR_OPERATION);
		}
	}

	private void check4deny(Info info, User user) throws XDDServiceException {
		int state = info.getState();
		Role role = user.getRole();

		// 状态[待初审]、[待终审]、[通过审核]的信息可被退回
		if (state != Info.WAIT1 && state != Info.WAIT2 && state != Info.PASS) {
			throw new XDDServiceException(XDDConstants.ERR_INFO_STATE);
		}

		// 用户角色和信息状态匹配检查
		if (state == Info.WAIT1 && !role.getId().equals(Role.AUDITOR1)
				&& !role.getId().equals(Role.ADMIN)) {
			throw new XDDServiceException(XDDConstants.ERR_OPERATION);
		}
		if (state == Info.WAIT2 && !role.getId().equals(Role.AUDITOR2)
				&& !role.getId().equals(Role.ADMIN)) {
			throw new XDDServiceException(XDDConstants.ERR_OPERATION);
		}
		if (state == Info.PASS && !role.getId().equals(Role.AUDITOR2)
				&& !role.getId().equals(Role.ADMIN)) {
			throw new XDDServiceException(XDDConstants.ERR_OPERATION);
		}
	}

	@Transactional(readOnly = false, rollbackFor = XDDServiceException.class)
	public void delete(String id, String userId) throws XDDServiceException {
		Info info = infoDao.read(id);
		User user = userDao.read(userId);
		Role role = user.getRole();
		int state = info.getState();

		// 只有处于[草稿]状态的信息可以删除 系统管理员可删除[审核退回]状态信息
		if (state == Info.DFAFT) {
			infoDao.delete(info);
		} else if (state == Info.DENY && role.getId().equals(Role.ADMIN)) {
			infoDao.delete(info);
		} else {
			throw new XDDServiceException(XDDConstants.ERR_INFO_STATE);
		}
	}

	@Transactional(readOnly = true)
	public List<Info> listInfo(String groupId, int state, int first, int max) {
		return infoDao.read(groupId, state, first, max);
	}

	public void setInfoGroupDao(InfoGroupDao infoGroupDao) {
		this.infoGroupDao = infoGroupDao;
	}

	public void setInfoDao(InfoDao infoDao) {
		this.infoDao = infoDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

}
