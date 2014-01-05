package org.craft.xdd.model.info;

import java.io.Serializable;
import java.util.Set;
import java.util.TreeSet;

/**
 * Domain Entity Model - Info
 * 
 * @hibernate.class table="XDD_INFO_GROUP" dynamic-update="true"
 *                  dynamic-insert="true"
 * 
 * @author Frank Hu
 * @version 1.0, 2009/8/29
 */
public class InfoGroup implements Comparable<InfoGroup>, Serializable {

	private static final long serialVersionUID = 5420899610689870225L;

	/** 图说喜德 id */
	public static final String XD_GROUP_ID = "13";

	/** 滚动信息 id */
	public static final String ROLL_GROUP_ID = "22";

	/** 热点聚焦 id */
	public static final String DAILY_GROUP_ID = "21";

	/** 热点新闻 id */
	public static final String HOT_GROUP_ID = "23";

	/** 政府建设 id */
	public static final String GOV_GROUP_ID = "24";

	/** 通知公告 id */
	public static final String NOTICE_GROUP_ID = "25";

	/** 经济建设 id */
	public static final String ECONOMY_GROUP_ID = "26";

	/** 社会生活 id */
	public static final String PUB_GROUP_ID = "27";

	/** 天气预报 id */
	public static final String WEATHER_ID = "S_5";

	// ---------------------------- entity field

	private String id;

	private String name;

	private int groupLevel;

	private String type;

	private String link;

	/** 上级栏目 */
	private InfoGroup parentGroup = this;

	/** 子栏目集合 */
	private Set<InfoGroup> children = new TreeSet<InfoGroup>();

	// ------------------------------ constructors

	public InfoGroup() {
		super();
	}

	// ------------------------------ getter & setter

	public int compareTo(InfoGroup ig) {
		int result = -1;
		if (this.id != null) {
			result = Integer.parseInt(this.id) - Integer.parseInt(ig.getId());
		}
		return result;
	}

	public String getFullName() {
		return this.getParentGroup().getName() + "-" + this.getName();
	}

	/**
	 * @hibernate.id column="ID" generator-class="assigned"
	 * @return
	 */
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @hibernate.property column="GROUP_LEVEL" type="int" not-null="true"
	 * @return
	 */
	public int getGroupLevel() {
		return groupLevel;
	}

	public void setGroupLevel(int groupLevel) {
		this.groupLevel = groupLevel;
	}

	/**
	 * @hibernate.property column="NAME" type="string" length="50"
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
	 * @hibernate.property column="TYPE" type="string" length="10"
	 *                     not-null="true"
	 * @return
	 */
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	/**
	 * @hibernate.property column="LINK" type="string" length="100"
	 *                     not-null="false"
	 * @return
	 */
	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	/**
	 * @hibernate.set table="XDD_INFO_GROUP" lazy="true" cascade="all"
	 *                inverse="true" order-by="ID ASC"
	 * @hibernate.collection-key column="PARENT_ID"
	 * @hibernate.collection-one-to-many class="org.craft.xdd.model.info.InfoGroup"
	 * 
	 * @return
	 */
	public Set<InfoGroup> getChildren() {
		return children;
	}

	public void setChildren(Set<InfoGroup> children) {
		this.children = children;
	}

	/**
	 * @hibernate.many-to-one column="PARENT_ID"
	 *                        class="org.craft.xdd.model.info.InfoGroup"
	 *                        cascade="save-update" not-null="true"
	 *                        outer-join="auto"
	 * @return
	 */
	public InfoGroup getParentGroup() {
		return parentGroup;
	}

	public void setParentGroup(InfoGroup parentGroup) {
		this.parentGroup = parentGroup;
	}

}
