package org.craft.xdd.model.user;

import java.io.Serializable;

/**
 * Domain Entity Model - Privilege
 * 
 * @hibernate.class table="XDD_PRIVILEGE" dynamic-update="true"
 *                  dynamic-insert="true"
 * 
 * @author Frank Hu
 * @version 1.0, 2007/8/29
 */
public class Privilege implements Serializable {

	private static final long serialVersionUID = 3148772061577930102L;

	// ----------------------------- entity field

	private String id;

	private String privilegePoint;

	/** Description of the privilege */
	private String remark;

	/** Type of the privilege */
	private String type;

	// ------------------------------ constructors

	public Privilege() {
		super();
	}

	public Privilege(String privilegePoint) {
		this.privilegePoint = privilegePoint;
	}

	// ------------------------------ getter & setter

	/**
	 * @hibernate.id column="ID" generator-class="uuid.hex"
	 * @return String
	 */
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @hibernate.property column="TYPE" type="string" length="10"
	 *                     not-null="true"
	 * @return String
	 */
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	/**
	 * @hibernate.property column="PRIVILEGE_POINT" type="string" length="150"
	 *                     not-null="true"
	 * @return String
	 */
	public String getPrivilegePoint() {
		return privilegePoint;
	}

	public void setPrivilegePoint(String privilegePoint) {
		this.privilegePoint = privilegePoint;
	}

	/**
	 * @hibernate.property column="REMARK" type="string" length="100"
	 *                     not-null="true"
	 * @return String
	 */
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public static class PrivilegeView {
		private String id;

		private String name;

		private String operation;

		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getOperation() {
			return operation;
		}

		public void setOperation(String operation) {
			this.operation = operation;
		}
	}

	@Override
	public int hashCode() {
		final int PRIME = 31;
		int result = 1;
		result = PRIME * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		final Privilege other = (Privilege) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

}
