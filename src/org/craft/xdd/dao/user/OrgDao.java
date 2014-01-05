package org.craft.xdd.dao.user;

import java.util.List;

import org.craft.cowork.dao.GenericDao;
import org.craft.xdd.model.user.Org;

/**
 * The <code>Org</code> entity dao interface
 * 
 * @author Frank Hu
 * @version 1.0, 2009/9/7
 */
public interface OrgDao extends GenericDao<Org, String> {

	/**
	 * Read org by type
	 * 
	 * @param type
	 * @return
	 */
	public List<Org> read(char type);

}