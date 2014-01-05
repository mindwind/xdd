package org.craft.cowork.dao;

import java.io.Serializable;

import org.craft.cowork.service.Service;

/**
 * Base dao interface.
 * 
 * @author Hu Feng
 * @version 1.0, 2008/2/1
 */
public interface BaseDao extends Service {

	/**
	 * Persist the given object
	 * 
	 * @param object
	 *            object to be persisted
	 * @return the object identifier
	 */
	public Serializable create(Object object);

	/**
	 * Return the persistent instance of the given entity class with the given
	 * identifier, or null if there is no such persistent instance.
	 * 
	 * @param id
	 * @return a persistent instance or null
	 */
	public Object read(Serializable id);

	/**
	 * Update the persistent instance with the identifier of the given detached
	 * instance.
	 * 
	 * @param object
	 *            a instance containing updated state
	 */
	public void update(Object object);

	/**
	 * Remove a persistent instance from the datastore.
	 * 
	 * @param object
	 *            the instance to be removed
	 */
	public void delete(Object object);

}
