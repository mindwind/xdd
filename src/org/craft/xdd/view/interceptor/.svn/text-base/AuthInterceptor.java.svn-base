package org.craft.xdd.view.interceptor;

import java.util.Map;

import org.apache.log4j.Logger;
import org.craft.cowork.util.StringUtil;
import org.craft.xdd.XDDConstants;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * Privilege interceptor.
 * 
 * @author Frank Hu
 * @version 1.0, 2009/9/13
 */
public class AuthInterceptor extends AbstractInterceptor {

	private static final long serialVersionUID = -6941878425011094964L;

	private static final Logger log = Logger.getLogger(AuthInterceptor.class);

	private static final String[] ESCAPES = new String[] { "/user/login",
			"//index", "/info/viewInfo", "/info/listGroupInfo",
			"/info/listRollInfo", "/info/searchInfo", "/open/online",
			"/open/party", "/open/public", "/info/listPublicInfo",
			"/info/listOrgPublicInfo", "/open/message_input",
			"/open/message_list", "/open/message_show", "/open/message_view",
			"/open/message_add", "/open/messageType_list", "/info/info_list" };

	@SuppressWarnings("rawtypes")
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		String namespace = invocation.getProxy().getNamespace();
		String actionName = namespace + "/"
				+ invocation.getProxy().getActionName();
		log.debug("<interceptor>: action name=[" + actionName + "]");

		String result = null;
		if (isEscape(actionName)) {
			log.debug("<interceptor>: escaped");
			result = invocation.invoke();
		} else {
			Map session = invocation.getInvocationContext().getSession();
			String uid = (String) session.get(XDDConstants.USER_KEY);
			String[] ps = (String[]) session.get(XDDConstants.PRIVILEGE);
			boolean flag = false;
			if (isCheck(ps, actionName)) {
				String[] ups = (String[]) session.get(uid);
				flag = StringUtil.contains(ups, actionName, true);
				if (!flag) {
					log.debug("<interceptor>: auth rejected");
					result = "auth";
				} else {
					log.debug("<interceptor>: auth passed");
					result = invocation.invoke();
				}
			} else {
				log.debug("<interceptor>: ignore");
				result = invocation.invoke();
			}
		}
		return result;
	}

	private boolean isCheck(String[] ps, String actionName) {
		return StringUtil.contains(ps, actionName, true);
	}

	private boolean isEscape(String actionName) {
		boolean b = false;
		for (int i = 0; i < ESCAPES.length; i++) {
			if (actionName.startsWith(ESCAPES[i])) {
				b = true;
				break;
			}
		}
		return b;
	}

}
