package org.craft.xdd.model.open;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Domain Entity Model - Message
 * 
 * @hibernate.class table="XDD_MESSAGE" dynamic-update="true"
 *                  dynamic-insert="true"
 * 
 * @author Frank Hu
 * @version 1.0, 2011/3/14
 */
public class Message implements Serializable {

	private static final long serialVersionUID = 3457583230052816109L;
	
	public static final int STATE_WAIT = 0;
	public static final int STATE_FINISH = 1;

	private String id;

	private String from;
	private String title;
	private String email;
	private String address;
	private String tel;
	private String fax;
	private String content;
	private String datetime = new SimpleDateFormat("yyyyMMddHHmmssSSS")
			.format(new Date());
	private int state = STATE_WAIT;
	private String result;
	private MessageType messageType;

	public Message() {
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
	 * @hibernate.property column="FROMNAME" type="string" length="10"
	 *                     not-null="true"
	 * @return
	 */
	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	/**
	 * @hibernate.property column="TITLE" type="string" length="64"
	 *                     not-null="true"
	 * @return
	 */
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * @hibernate.property column="EMAIL" type="string" length="64"
	 *                     not-null="true"
	 * @return
	 */
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @hibernate.property column="ADDRESS" type="string" length="128"
	 *                     not-null="true"
	 * @return
	 */
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @hibernate.property column="TEL" type="string" length="16"
	 *                     not-null="true"
	 * @return
	 */
	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	/**
	 * @hibernate.property column="FAX" type="string" length="16"
	 *                     not-null="false"
	 * @return
	 */
	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	/**
	 * @hibernate.property column="CONTENT" type="string" length="4000"
	 *                     not-null="true"
	 * @return
	 */
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	/**
	 * @hibernate.property column="RESULT" type="string" length="4000"
	 *                     not-null="false"
	 * @return
	 */
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	/**
	 * @hibernate.property column="DATETIME" type="string" length="17"
	 *                     not-null="true"
	 * @return
	 */
	public String getDatetime() {
		return datetime;
	}

	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}

	/**
	 * @hibernate.property column="STATE" type="int" not-null="true"
	 * @return
	 */
	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	/**
	 * @hibernate.many-to-one column="MESSAGE_TYPE_ID"
	 *                        class="org.craft.xdd.model.open.MessageType"
	 *                        cascade="save-update" not-null="false"
	 *                        outer-join="auto"
	 * @return
	 */
	public MessageType getMessageType() {
		return messageType;
	}

	public void setMessageType(MessageType messageType) {
		this.messageType = messageType;
	}

}
