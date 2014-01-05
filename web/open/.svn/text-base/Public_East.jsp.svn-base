<%@ taglib uri="/struts-tags" prefix="s"%>

<div id="tabs3">
	<div class="menu1box">
		<div id="tip2"></div>
		<ul id="menu1">
			<li onmouseover="nowtab1(0)">
				<s:text name="public.tab.0" />
			</li>
			<li onmouseover="nowtab1(1)">
				<s:text name="public.tab.1" />
			</li>
			<li onmouseover="nowtab1(2)">
				<s:text name="public.tab.2" />
			</li>
		</ul>
	</div>
	<div id="tab" class="tab2">
		<div id="tab0">
			<s:iterator value="orgs1" status="index">
				<s:if test="#index.index % 3 == 0">
					 <br />
				</s:if>
				
				<span style="margin: 0 25 0 0"> <span
					style="width:60;text-align:center"><s:property value="name" />
				</span> <a href="../info/viewInfo.do?infoId=SYS_47"
					target="_blank"><img src="../images/gk_zn.gif"
							align="absmiddle" /> </a> <a
					href="../info/viewInfo.do?infoId=SYS_48" target="_blank"><img
							src="../images/gk_ml.gif" align="absmiddle" /> </a> <a
					href='../info/listOrgPublicInfo.do?orgId=<s:property value="id" />&orgName=<s:property value="name" />'
					target="_blank"><img src="../images/gk_nr.gif"
							align="absmiddle" /> </a> </span>
			</s:iterator>
		</div>
		<div id="tab1" style="display: none">
			<s:iterator value="orgs2" status="index">
				<s:if test="#index.index % 3 == 0">
					<br />
					<br />
				</s:if>
				<span style="margin: 0 25 0 0"> <span
					style="width:60;text-align:center"><s:property value="name" />
				</span> <a href="../info/viewInfo.do?infoId=SYS_47"
					target="_blank"><img src="../images/gk_zn.gif"
							align="absmiddle" /> </a> <a
					href="../info/viewInfo.do?infoId=SYS_48" target="_blank"><img
							src="../images/gk_ml.gif" align="absmiddle" /> </a> <a
					href='../info/listOrgPublicInfo.do?orgId=<s:property value="id" />orgName=<s:property value="name" />'
					target="_blank"><img src="../images/gk_nr.gif"
							align="absmiddle" /> </a> </span>
			</s:iterator>
		</div>
		<div id="tab2" style="display: none">
			<div id="public_grid"></div>
		</div>
	</div>

</div>


