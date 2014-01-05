package org.craft.xdd.dao.open.impl;

import org.craft.cowork.dao.GenericDaoHibernateImpl;
import org.craft.xdd.dao.open.MessageTypeDao;
import org.craft.xdd.model.open.MessageType;

public class MessageTypeDaoHibernateImpl extends
		GenericDaoHibernateImpl<MessageType, String> implements MessageTypeDao {

	public MessageTypeDaoHibernateImpl(Class<MessageType> type) {
		super(type);
	}

}
