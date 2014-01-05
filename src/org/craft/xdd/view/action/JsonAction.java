package org.craft.xdd.view.action;

import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

/**
 * Provide json support for action
 * 
 * 
 * @author Frank Hu
 * @version 1.0, 2009/8/29
 */
public abstract class JsonAction extends BaseAction {

	public static final String JSON = "json";

	public static final String JSON_SUCCESS = "{success:true}";

	public static final String JSON_FAILURE = "{success:false}";

	protected String json;

	protected String json(String desc, boolean succ) {
		if (succ) {
			return "{success:true,msg:'" + desc + "'}";
		} else {
			return "{success:false,error:'" + desc + "'}";
		}
	}

	protected String json(Map<String, String> map, boolean succ) {
		String json = null;
		if (succ) {
			json = "{success:true,";
		} else {
			return "{success:false,";
		}
		Set<Entry<String, String>> set = map.entrySet();
		for (Entry<String, String> entry : set) {
			String k = entry.getKey();
			String v = entry.getValue();
			json += k + ":'" + v + "',";
		}
		json = json.substring(0, json.length() - 1) + "}";
		return json;
	}

	public String getJson() {
		return json;
	}

	public void setJson(String json) {
		log.debug("<action>: invoke setJson() - " + json);
		this.json = json;
	}

}
