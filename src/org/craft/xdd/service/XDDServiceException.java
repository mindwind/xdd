package org.craft.xdd.service;

import org.craft.cowork.service.ServiceException;


/**
 * Service exception for xdd module
 * 
 * @author Frank Hu
 * @version 1.0, 2009/5/5
 */
public class XDDServiceException extends ServiceException {
	
	private static final long serialVersionUID = 5828761525720795253L;

	private String errorKey;

	public XDDServiceException(String errorKey) {
		this.errorKey = errorKey;
	}

	public String toString() {
		return errorKey;
	}

	public String getMessage() {
		return toString();
	}

	public String getErrorKey() {
		return errorKey;
	}

}
