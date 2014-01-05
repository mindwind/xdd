package org.craft.xdd.service;

import java.util.Locale;
import java.util.ResourceBundle;

import org.apache.log4j.Logger;
import org.craft.cowork.service.Service;

/**
 * Provide abstract common function support for servie implementation, as
 * follows:
 * <li> logger
 * <li> Locale support
 * 
 * @author Frank Hu
 * @version, 2009/8/29
 */
public abstract class AbstractService implements Service {

	protected final Logger log = Logger.getLogger(getClass());

	protected Locale locale = Locale.CHINA;
	
	protected ResourceBundle resource = ResourceBundle.getBundle(
			"config.xdd.Constants", locale);

	public Locale getLocale() {
		return locale;
	}

	public void setLocale(Locale locale) {
		this.locale = locale;
	}

}
