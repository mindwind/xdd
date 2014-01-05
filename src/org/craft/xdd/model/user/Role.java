package org.craft.xdd.model.user;

import java.io.Serializable;
import java.util.Set;
import java.util.TreeSet;

/**
 * Domain Entity Model - Role
 * 
 * @hibernate.class table="XDD_ROLE" dynamic-update="true" dynamic-insert="true"
 * 
 * @author Frank Hu
 * @version 1.0, 2009/8/29
 */
public class Role implements Serializable {

	private static final long serialVersionUID = -4835713004855058019L;

	public static final String ADMIN = "0";

	public static final String PUBLISHER = "1";

	public static final String AUDITOR1 = "2";

	public static final String AUDITOR2 = "3";

	// ------------------------------ entity field

	private String id;

	private String name;

	private Set<User> users = new TreeSet<User>();

	private Set<Privilege> privilegeSet = new TreeSet<Privilege>();

	// ------------------------------ constructors

	public Role() {
	}

	public Role(String name) {
		this.name = name;
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
	 * @hibernate.property column="NAME" type="string" length="50"
	 *                     not-null="true"
	 * @return String
	 */
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @hibernate.set table="XDD_USER" lazy="true" cascade="all" inverse="true"
	 * @hibernate.collection-key column="ROLE_ID"
	 * @hibernate.collection-one-to-many class="org.craft.xdd.model.user.User"
	 * 
	 * @return
	 */
	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> userlist) {
		this.users = userlist;
	}

	/**
	 * @hibernate.set table="XDD_ROLE_PRIVILEGE" lazy="true"
	 *                cascade="save-update" inverse="false"
	 * @hibernate.collection-key column="ROLE_ID"
	 * @hibernate.collection-many-to-many class="org.craft.xdd.model.user.Privilege"
	 *                                    column="PRIVILEGE_ID"
	 * 
	 * @return
	 */
	public Set<Privilege> getPrivilegeSet() {
		return privilegeSet;
	}

	public void setPrivilegeSet(Set<Privilege> privilegeSet) {
		this.privilegeSet = privilegeSet;
	}

	public static class RoleView {
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

}
