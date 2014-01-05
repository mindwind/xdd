package org.craft.xdd.view.action.open;

import org.craft.xdd.view.action.CommonAction;

/**
 * Online action
 * 
 * @author Frank Hu
 * @version 1.0, 2009-8-29
 */
public class OnlineAction extends CommonAction {

	private static final long serialVersionUID = -1820223657822102284L;

	public OnlineAction() {
		super();
	}

	/**
	 * Invoke this while url <code>online.do</code> be requested
	 * 
	 * @return String
	 * @throws Exception
	 *             on any error
	 */
	public String execute() throws Exception {
		log.debug("<action>: invoke execute()");
		
		this.setOneList();
		this.setWeather();
		
		return SUCCESS;
	}

}
