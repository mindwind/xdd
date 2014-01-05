package org.craft.xdd.dao.open;

import java.util.List;

import org.craft.cowork.dao.GenericDao;
import org.craft.xdd.model.open.Message;

/**
 * The <code>Message</code> entity dao interface
 * 
 * @author Feng Hu
 * @version 1.0, 2011/3/16
 */
public interface MessageDao extends GenericDao<Message, String> {

	/**
	 * Read message by title and state
	 * 
	 * @param title
	 * @param first
	 * @param max
	 * @param state
	 *            if (state==-1) ignore this
	 * @return
	 */
	public List<Message> read(String title, int state, int first, int max);

	/**
	 * Count by title and state
	 * 
	 * @param title
	 * @param state
	 * @return
	 */
	public Long count(String title, int state);

	/**
	 * Read message by datetime(query code)
	 * 
	 * @param datetime
	 *            if (datetime == "all") ignore this
	 * @param first
	 * @param max
	 * @return
	 */
	public List<Message> read(String datetime, int first, int max);

	/**
	 * Count by datetime
	 * 
	 * @param datetime
	 *            if (datetime == "all") ignore this
	 * @return
	 */
	public Long count(String datetime);
}
