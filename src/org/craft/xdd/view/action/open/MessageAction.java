package org.craft.xdd.view.action.open;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.interceptor.SessionAware;
import org.craft.cowork.util.StringUtil;
import org.craft.xdd.XDDConstants;
import org.craft.xdd.dao.open.MessageDao;
import org.craft.xdd.dao.open.MessageTypeDao;
import org.craft.xdd.model.open.Message;
import org.craft.xdd.model.open.MessageType;
import org.craft.xdd.service.XDDServiceException;
import org.craft.xdd.view.action.CommonAction;

import com.opensymphony.xwork2.ModelDriven;

/**
 * Message action
 * 
 * @author Frank Hu
 * @version 1.0, 2011/3/15
 */
public class MessageAction extends CommonAction implements
		ModelDriven<Message>, SessionAware {

	private static final long serialVersionUID = -1820223657822102284L;

	private MessageDao messageDao;
	private MessageTypeDao messageTypeDao;

	private DateFormat viewDTF = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private DateFormat saveDTF17 = new SimpleDateFormat("yyyyMMddHHmmssSSS");

	private Message message = new Message();
	private String stateStr;
	private String vcode;
	private String messageTypeId;
	private String qcode;
	private String listType;
	private String formatDatetime;
	private int start = 0;
	private int limit = 10;

	public MessageAction() {
		super();
	}

	public String view() throws Exception {
		this.setOneList();

		Message msg = messageDao.read(message.getId());
		message = msg;
		formatDatetime = viewDTF
				.format(saveDTF17.parseObject(msg.getDatetime()));

		return "view";
	}

	public String load() throws Exception {
		Message msg = messageDao.read(message.getId());
		JSONObject jo = new JSONObject();
		jo.put("id", msg.getId());
		jo.put("title", msg.getTitle());
		jo.put("name", msg.getFrom());
		jo.put("datetime",
				viewDTF.format(saveDTF17.parseObject(msg.getDatetime())));
		jo.put("type", msg.getMessageType().getName());
		jo.put("state", getStateDesc(msg.getState()));
		jo.put("result", msg.getResult());

		JSONArray ja = new JSONArray();
		ja.add(jo);
		setJson(ja.toString());
		return JSON;
	}

	public String handle() throws Exception {
		Message msg = messageDao.read(message.getId());
		String result = message.getResult();
		if (result != null && result.trim().length() > 0) {
			msg.setState(Message.STATE_FINISH);
		} else {
			msg.setState(Message.STATE_WAIT);
		}
		msg.setResult(result);
		messageDao.update(msg);

		setJson(JSON_SUCCESS);
		return JSON;
	}

	public String remove() throws Exception {
		Message msg = messageDao.read(message.getId());
		messageDao.delete(msg);
		setJson(JSON_SUCCESS);
		return JSON;
	}

	public String input() throws Exception {
		this.setOneList();

		return INPUT;
	}

	public String show() throws Exception {
		this.setOneList();

		return "show";
	}

	public String add() throws Exception {
		try {
			checkVcode();
			MessageType type = messageTypeDao.read(messageTypeId);
			message.setMessageType(type);
			messageDao.create(message);
		} catch (XDDServiceException e) {
			setJson(json(getMessage(e), false));
			return JSON;
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw e;
		}
		setJson(json(
				getText(XDDConstants.MESSAGE_SUCC_TIP) + message.getDatetime(),
				true));
		return JSON;
	}

	public String list() throws Exception {
		int state = 0;
		if (stateStr == null || stateStr.equals("")) {
			state = -1;
		} else {
			state = Integer.parseInt(stateStr);
		}

		List<Message> messages = null;
		long total = 0;
		if (listType != null && listType.equals("express")) {
			if (qcode != null && qcode.trim().length() > 0) {
				messages = messageDao.read(qcode, start, limit);
				total = messageDao.count(qcode);
			} else {
				messages = messageDao.read("all", start, limit);
				total = messageDao.count("all");
			}
		} else {
			messages = messageDao.read(message.getTitle(), state, start, limit);
			total = messageDao.count(message.getTitle(), state);
		}

		JSONArray ja = new JSONArray();
		for (Message msg : messages) {
			JSONObject jo = new JSONObject();
			jo.put("id", msg.getId());
			jo.put("title", StringUtil.getReplaceString(
					getText(XDDConstants.MESSAGE_VIEW_LINK),
					new String[] { msg.getId(), msg.getTitle() }));
			jo.put("name", msg.getFrom());
			jo.put("datetime",
					viewDTF.format(saveDTF17.parseObject(msg.getDatetime())));
			jo.put("type", msg.getMessageType().getName());
			jo.put("state", getStateDesc(msg.getState()));
			jo.put("code", msg.getDatetime());
			ja.add(jo);
		}

		String json = "{totalProperty:" + total + ",root:" + ja.toString()
				+ "}";
		setJson(json);

		return JSON;

	}

	private String getStateDesc(int state) {
		String desc = "unknown";
		switch (state) {
		case Message.STATE_WAIT:
			desc = getText(XDDConstants.MESSAGE_STATE_WAIT);
			break;
		case Message.STATE_FINISH:
			desc = getText(XDDConstants.MESSAGE_STATE_FINISH);
			break;
		}
		return desc;
	}

	private void checkVcode() throws XDDServiceException {
		log.debug("<action>: vcode from request = " + vcode);
		if (vcode == null || vcode.trim().length() == 0) {
			throw new XDDServiceException(XDDConstants.ERR_VCODE);
		}

		// URL url = getClass().getResource("/cache/ehcache.xml");
		// Cache cache =
		// CacheManager.create(url).getCache(Constants.CACHE_VCODE);
		// String vc = (String) cache.get(Constants.VCODE +
		// this.getRequest().getSession().getId()).getValue();
		log.debug("<action>: session id = "
				+ this.getRequest().getSession().getId());
		String vc = (String) session.get(XDDConstants.VCODE);
		log.debug("<action>: vcode from cache = " + vc);

		if (vc == null || !vc.equals(vcode.toLowerCase().trim())) {
			throw new XDDServiceException(XDDConstants.ERR_VCODE);
		}
		session.remove(XDDConstants.VCODE);
		// cache.remove(Constants.VCODE);

	}

	public String getVcode() {
		return vcode;
	}

	public void setVcode(String vcode) {
		this.vcode = vcode;
	}

	public Message getModel() {
		return message;
	}

	public String getStateStr() {
		return stateStr;
	}

	public void setStateStr(String stateStr) {
		this.stateStr = stateStr;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public String getMessageTypeId() {
		return messageTypeId;
	}

	public void setMessageTypeId(String messageTypeId) {
		this.messageTypeId = messageTypeId;
	}

	public MessageDao getMessageDao() {
		return messageDao;
	}

	public void setMessageDao(MessageDao messageDao) {
		this.messageDao = messageDao;
	}

	public MessageTypeDao getMessageTypeDao() {
		return messageTypeDao;
	}

	public void setMessageTypeDao(MessageTypeDao messageTypeDao) {
		this.messageTypeDao = messageTypeDao;
	}

	public String getQcode() {
		return qcode;
	}

	public void setQcode(String qcode) {
		this.qcode = qcode;
	}

	public String getListType() {
		return listType;
	}

	public void setListType(String listType) {
		this.listType = listType;
	}

	public String getFormatDatetime() {
		return formatDatetime;
	}

	public void setFormatDatetime(String formatDatetime) {
		this.formatDatetime = formatDatetime;
	}

	public Message getMessage() {
		return message;
	}

	public void setMessage(Message message) {
		this.message = message;
	}

}
