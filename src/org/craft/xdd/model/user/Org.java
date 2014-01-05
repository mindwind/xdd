package org.craft.xdd.model.user;

import java.io.Serializable;

/**
 * Domain Entity Model - Info
 * 
 * @hibernate.class table="XDD_ORG" dynamic-update="true" dynamic-insert="true"
 * 
 * @author Frank Hu
 * @version 1.0, 2009/8/29
 */
public class Org implements Serializable {

	private static final long serialVersionUID = 900560447933235770L;
	
	/** 机构类型-部门 */
	public static final char TYPE_B = 'B';
	
	/** 机构类型-乡镇 */
	public static final char TYPE_X = 'X';

	// ---------------------------- entity field

	private String id;

	private String name;

	private String type;

	// ------------------------------ constructors

	public Org() {
		super();
	}

	// ------------------------------ getter & setter

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
	 * @hibernate.property column="TYPE" type="string" length="1"
	 *                     not-null="false"
	 * @return
	 */
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
