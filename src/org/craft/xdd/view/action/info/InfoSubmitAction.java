package org.craft.xdd.view.action.info;

import org.craft.xdd.service.XDDServiceException;
import org.craft.xdd.service.info.InfoService;
import org.craft.xdd.view.action.JsonAction;

/**
 * Info submit action.
 * 
 * @author Frank Hu
 * @version 1.0, 2009-9-5
 */
public class InfoSubmitAction extends JsonAction {

	private static final long serialVersionUID = 1L;

	private InfoService infoService;

	private String id;

	public InfoSubmitAction() {
		super();
		log.debug("<action>: invoke default constructor");
	}

	/**
	 * Invoke this while url <code>submitInfo.do</code> be requested
	 * 
	 * @return String
	 * @throws Exception
	 *             on any error
	 */
	public String execute() throws Exception {
		log.debug("<action>: invoke execute()");
		try {
			infoService.submit(id);
		} catch (XDDServiceException e) {
			setJson(json(getMessage(e), false));
			return JSON;
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw e;
		}
		setJson(JSON_SUCCESS);
		return JSON;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public InfoService getInfoService() {
		return infoService;
	}

	public void setInfoService(InfoService infoService) {
		this.infoService = infoService;
	}

}
