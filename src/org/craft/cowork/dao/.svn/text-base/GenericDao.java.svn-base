package org.craft.cowork.dao;

import java.io.Serializable;
import java.util.List;

import org.craft.cowork.service.QueryService;
import org.craft.cowork.service.Service;

/**
 * Generic dao interface.
 * 
 * @author Frank Hu
 * @version 1.0, 2007/7/20
 */
public interface GenericDao<T, ID extends Serializable> extends Service {

	/**
	 * Persist the given object
	 * 
	 * @param t
	 *            object to be persisted
	 * @return the object identifier
	 */
	public ID create(T t);

	/**
	 * Return the persistent instance of the given entity class with the given
	 * identifier, or null if there is no such persistent instance.
	 * 
	 * @param id
	 * @return a persistent instance or null
	 */
	public T read(ID id);

	/**
	 * Return a list of persistent instance with no condition.
	 * 
	 * @param entity
	 * @return a list of persistent instance
	 */
	public List<T> read(Class T);

	/**
	 * Update the persistent instance with the identifier of the given detached
	 * instance.
	 * 
	 * @param object
	 *            a instance containing updated state
	 */
	public void update(T t);

	/**
	 * Remove a persistent instance from the datastore.
	 * 
	 * @param object
	 *            the instance to be removed
	 */
	public void delete(T t);

	/**
	 * Count by query.
	 * 
	 * @param qs
	 * @return long
	 */
	public long count(QueryService qs);

}
