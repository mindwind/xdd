package org.craft.xdd.view.action.open;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

import org.craft.xdd.dao.open.MessageTypeDao;
import org.craft.xdd.model.open.MessageType;
import org.craft.xdd.view.action.JsonAction;

/**
 * Message type action
 * 
 * @author Frank Hu
 * @version 1.0, 2011/3/16
 */
public class MessageTypeAction extends JsonAction {

	private static final long serialVersionUID = 4313869270885811436L;

	private MessageTypeDao messageTypeDao;

	public MessageTypeAction() {
		super();
	}

	public String list() {
		List<MessageType> types = messageTypeDao.read(MessageType.class);
		List<String[]> list = new ArrayList<String[]>();
		for (MessageType t : types) {
			String[] sarr = new String[] { t.getId(), t.getName() };
			list.add(sarr);
		}
		JSONArray ja = JSONArray.fromObject(list);
		setJson(ja.toString());

		return JSON;
	}

	public MessageTypeDao getMessageTypeDao() {
		return messageTypeDao;
	}

	public void setMessageTypeDao(MessageTypeDao messageTypeDao) {
		this.messageTypeDao = messageTypeDao;
	}

}
