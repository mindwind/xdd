package org.craft.xdd.view.action.open;

import org.craft.xdd.view.action.CommonAction;

/**
 * Party action
 * 
 * @author Frank Hu
 * @version 1.0, 2009-9-19
 */
public class PartyAction extends CommonAction {

	private static final long serialVersionUID = -1820223657822102284L;

	public PartyAction() {
		super();
	}

	/**
	 * Invoke this while url <code>party.do</code> be requested
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
