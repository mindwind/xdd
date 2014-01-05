package org.craft.xdd.view.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.craft.xdd.XDDConstants;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * Login interceptor.
 * 
 * @author Frank Hu
 * @version 1.0, 2008/1/2
 */
public class LoginInterceptor extends AbstractInterceptor {

	private static final long serialVersionUID = -5920636978599256795L;

	private static final Logger log = Logger.getLogger(LoginInterceptor.class);

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
		Map session = invocation.getInvocationContext().getSession();
		String user = (String) session.get(XDDConstants.USER_KEY);
		String namespace = invocation.getProxy().getNamespace();
		String actionName = namespace + "/"
				+ invocation.getProxy().getActionName();
		log.debug("<interceptor>: action name=[" + actionName + "]");

		String result = null;
		if (isEscape(actionName)) {
			log.debug("<interceptor>: escaped");
			result = invocation.invoke();
		} else {
			if (user == null) {
				log.debug("<interceptor>: forward to login page");
				HttpServletResponse response = ServletActionContext
						.getResponse();
				HttpServletRequest request = ServletActionContext.getRequest();
				String url = request.getContextPath() + "/user/login_input.do";
				String script = "<script language='javascript'>top.location='"
						+ url + "'</script>";
				response.getWriter().write(script);
			} else {
				log.debug("<interceptor>: ignore");
				result = invocation.invoke();
			}
		}
		return result;
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
