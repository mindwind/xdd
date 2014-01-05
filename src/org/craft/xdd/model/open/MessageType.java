package org.craft.xdd.model.open;

import java.io.Serializable;
import java.util.Set;

/**
 * Domain Entity Model - Message
 * 
 * @hibernate.class table="XDD_MESSAGE_TYPE" dynamic-update="true"
 *                  dynamic-insert="true"
 * 
 * @author Frank Hu
 * @version 1.0, 2011/3/14
 */
public class MessageType implements Serializable {

	private static final long serialVersionUID = -3525373860072523768L;

	private String id;
	private String name;
	private Set<Message> messages;

	public MessageType() {
		super();
	}
	
	/**
	 * @hibernate.id column="ID" generator-class="uuid.hex"
	 * @return
	 */
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	/**
	 * @hibernate.property column="NAME" type="string" length="10"
	 *                     not-null="true"
	 * @return
	 */
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	/**
	 * @hibernate.set table="XDD_MESSAGE" lazy="true" cascade="all" inverse="true"
	 * @hibernate.collection-key column="MESSAGE_TYPE_ID"
	 * @hibernate.collection-one-to-many class="org.craft.xdd.model.open.Message"
	 * 
	 * @return
	 */
	public Set<Message> getMessages() {
		return messages;
	}

	public void setMessages(Set<Message> messages) {
		this.messages = messages;
	}

}
