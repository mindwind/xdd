<%@ taglib uri="/struts-tags" prefix="s"%>

<div class="mnavigator">
	<s:iterator value="oneList">
		<div class="linkout1" onmouseover="this.className='linkin1';"
			onmouseout="this.className='linkout1';">
			<a href='<s:property value="link" />' style="display:inline-block;width:80px;"><s:property value="name" /></a>
			<s:if test="null!=children && !children.isEmpty()">
				<div>
					<span> <s:iterator value="children">
							<a
								href='/xdd/info/listGroupInfo.do?gid=<s:property value="id" />'><s:property
									value="name"/> </a>
							<br>
							<hr style="border:1px dashed; height:1px; color:#ffcc66;">
						</s:iterator> </span>
				</div>
			</s:if>
		</div>
	</s:iterator>
	<form id="search" action="/xdd/info/searchInfo.do" method="post" style="float:left;margin-left:5px">
	    <input type="text" name="key" size="30" value="" id="search_key"/>
		<s:submit value='%{getText("search")}' align="left" />
	</form>
</div>
