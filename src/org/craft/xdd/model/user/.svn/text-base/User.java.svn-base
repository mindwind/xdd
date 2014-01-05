package org.craft.xdd.model.user;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Domain Entity Model - Org
 * 
 * @hibernate.class table="XDD_USER" dynamic-update="true" dynamic-insert="true"
 * 
 * @author Frank Hu
 * @version 1.0, 2009/8/29
 */
public class User implements Serializable {

	private static final long serialVersionUID = 900560447933235770L;

	// ---------------------------- entity field
	
	public static final String NORMAL = "O";
	
	public static final String CANCEL = "X";

	private String id;

	private String password;

	private String lastLoginTime;

	private String registerTime = new SimpleDateFormat("yyyyMMddHHmmss")
			.format(new Date());

	private String state = NORMAL;

	private Role role;

	private Org org;

	// ------------------------------ domain field

	private boolean encrypt = false;

	// ------------------------------ constructors

	public User() {
		super();
	}

	// ------------------------------ domain method

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
	 * @hibernate.property column="LAST_LOGIN_TIME" type="string" length="14"
	 *                     not-null="false"
	 * @return
	 */
	public String getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(String lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	/**
	 * @hibernate.property column="PASSWORD" type="string" length="32"
	 *                     not-null="true"
	 * @return
	 */
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @hibernate.property column="REGISTER_TIME" type="string" length="14"
	 *                     not-null="true"
	 * @return
	 */
	public String getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(String registerTime) {
		this.registerTime = registerTime;
	}

	/**
	 * @hibernate.property column="STATE" type="string" length="1"
	 *                     not-null="true"
	 * @return
	 */
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	/**
	 * @hibernate.many-to-one column="ROLE_ID"
	 *                        class="org.craft.xdd.model.user.Role"
	 *                        cascade="save-update" not-null="true"
	 *                        outer-join="auto"
	 * @return
	 */
	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
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

	public boolean isEncrypt() {
		return encrypt;
	}

	public void setEncrypt(boolean encrypt) {
		this.encrypt = encrypt;
	}

	public static class UserView {

		private String id;
		
		private String roleId;
		
		private String role;
		
		private String orgId;
		
		private String org;

		private String operation;

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

		public String getOrg() {
			return org;
		}

		public void setOrg(String org) {
			this.org = org;
		}

		public String getRole() {
			return role;
		}

		public void setRole(String role) {
			this.role = role;
		}

		public String getOrgId() {
			return orgId;
		}

		public void setOrgId(String orgId) {
			this.orgId = orgId;
		}

		public String getRoleId() {
			return roleId;
		}

		public void setRoleId(String roleId) {
			this.roleId = roleId;
		}

	}

}
