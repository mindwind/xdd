<%@ taglib uri="/struts-tags" prefix="s"%>

<div id="header">
	<div id="htext">
		<s:if test="#attr.htitle=='register'">
			<a href="login_input.do"><s:text name="login" /> </a>
		</s:if>
		<s:elseif test="#attr.htitle=='login'">
			<a href="http://www.scxd.gov.cn"><s:text name="main.page" /> </a>
		</s:elseif>
		<s:else>
			<b><s:property value="#session.user" /> </b>
			|
			<a href="javascript:modify_password();"><s:text name="modify.pwd" /> </a>
			|
			<a href="user/login_input.do?logout=true"><s:text name="logout" /> </a>
		</s:else>
	</div>
	<div id="banner">
		<s:if test="#attr.htitle==null">
			<s:text name="logo.text" />
		</s:if>
		<s:if test="#attr.htitle=='login'">
			<s:text name="login" />
		</s:if>
	</div>
</div>
