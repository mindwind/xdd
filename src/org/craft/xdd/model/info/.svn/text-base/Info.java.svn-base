package org.craft.xdd.model.info;

import java.io.File;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.craft.xdd.model.user.Org;

/**
 * Domain Entity Model - Info
 * 
 * @hibernate.class table="XDD_INFO" dynamic-update="true" dynamic-insert="true"
 * 
 * @author Frank Hu
 * @version 1.0, 2009/8/29
 */
public class Info implements Serializable {

	private static final long serialVersionUID = 900560447933235770L;

	// ---------------------------- entity field

	public static final int DFAFT = 3;

	public static final int WAIT1 = 2;

	public static final int WAIT2 = 1;

	public static final int PASS = 0;

	public static final int DENY = -1;

	public static final int TEMP = -2;

	private String id;

	private String title;

	private String author;

	private String publishTime = new SimpleDateFormat("yyyyMMddHHmmss")
			.format(new Date());

	private String content;

	/** 状态： 3-草稿 2-待初审 1-待终审 0-审核通过 -1-审核不通过 */
	private int state = DFAFT;

	private String auditor1;

	private String auditor2;

	private String imgLinkUrl;

	private String imgUrl;

	private InfoGroup group;
	
	private Org org;

	// ------------------------------ domain field

	private File img;

	private String fileName;

	// ------------------------------ constructors

	public Info() {
		super();
	}

	// ------------------------------ domain method

	// ------------------------------ getter & setter

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
	 * @hibernate.property column="AUDITOR1" type="string" length="32"
	 *                     not-null="false"
	 * @return
	 */
	public String getAuditor1() {
		return auditor1;
	}

	public void setAuditor1(String auditor1) {
		this.auditor1 = auditor1;
	}

	/**
	 * @hibernate.property column="AUDITOR2" type="string" length="32"
	 *                     not-null="false"
	 * @return
	 */
	public String getAuditor2() {
		return auditor2;
	}

	public void setAuditor2(String auditor2) {
		this.auditor2 = auditor2;
	}

	/**
	 * @hibernate.property column="AUTHOR" type="string" length="32"
	 *                     not-null="true"
	 * @return
	 */
	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	/**
	 * @hibernate.property column="CONTENT" type="text" not-null="false"
	 * 
	 * @return
	 */
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * @hibernate.property column="IMG_LINK_URL" type="string" length="150"
	 *                     not-null="false"
	 * @return
	 */
	public String getImgLinkUrl() {
		return imgLinkUrl;
	}

	public void setImgLinkUrl(String imgLinkUrl) {
		this.imgLinkUrl = imgLinkUrl;
	}

	/**
	 * @hibernate.property column="IMG_URL" type="string" length="100"
	 *                     not-null="false"
	 * @return
	 */
	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	/**
	 * @hibernate.property column="PUBLISH_TIME" type="string" length="14"
	 *                     not-null="true"
	 * @return
	 */
	public String getPublishTime() {
		return publishTime;
	}

	public void setPublishTime(String publishTime) {
		this.publishTime = publishTime;
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
	 * @hibernate.property column="TITLE" type="string" length="150"
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
	 * @hibernate.many-to-one column="GROUP_ID"
	 *                        class="org.craft.xdd.model.info.InfoGroup"
	 *                        cascade="save-update" not-null="false"
	 *                        outer-join="auto"
	 * @return
	 */
	public InfoGroup getGroup() {
		return group;
	}

	public void setGroup(InfoGroup group) {
		this.group = group;
	}
	
	/**
	 * @hibernate.many-to-one column="ORG_ID"
	 *                        class="org.craft.xdd.model.user.Org"
	 *                        cascade="save-update" not-null="true"
	 *                        outer-join="auto"
	 * @return
	 */
	public Org getOrg() {
		return org;
	}

	public void setOrg(Org org) {
		this.org = org;
	}

	public File getImg() {
		return img;
	}

	public void setImg(File img) {
		this.img = img;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public static class InfoView {
		private String id;

		private String time;

		private String title;

		private String group;

		private String author;

		private String state;

		private String auditor1;

		private String auditor2;

		private String operation;
		
		private String imgLinkUrl;
		
		private String imgUrl;
		
		private String org;

		public String getAuditor1() {
			return auditor1;
		}

		public void setAuditor1(String auditor1) {
			this.auditor1 = auditor1;
		}

		public String getAuditor2() {
			return auditor2;
		}

		public void setAuditor2(String auditor2) {
			this.auditor2 = auditor2;
		}

		public String getAuthor() {
			return author;
		}

		public void setAuthor(String author) {
			this.author = author;
		}

		public String getGroup() {
			return group;
		}

		public void setGroup(String group) {
			this.group = group;
		}

		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

		public String getOperation() {
			return operation;
		}

		public void setOperation(String operation) {
			this.operation = operation;
		}

		public String getState() {
			return state;
		}

		public void setState(String state) {
			this.state = state;
		}

		public String getTime() {
			return time;
		}

		public void setTime(String time) {
			this.time = time;
		}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public String getImgLinkUrl() {
			return imgLinkUrl;
		}

		public void setImgLinkUrl(String imgLinkUrl) {
			this.imgLinkUrl = imgLinkUrl;
		}

		public String getImgUrl() {
			return imgUrl;
		}

		public void setImgUrl(String imgUrl) {
			this.imgUrl = imgUrl;
		}

		public String getOrg() {
			return org;
		}

		public void setOrg(String org) {
			this.org = org;
		}
	
	}

}
