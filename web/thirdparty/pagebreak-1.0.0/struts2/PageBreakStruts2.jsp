<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<div id="pageBox">
	<div id="total">
		<s:text name="page.break.total" />:&nbsp;
		<s:property value="pageBreak.total" />
		<s:text name="page.break.item" />
		&nbsp;
		<s:text name="page.break.all" />
		<s:property value="pageBreak.pageNum" />
		<s:text name="page.break.page" />
	</div>

	<div id="pageList" align="right">
		<s:if test="pageBreak.prePageFlag">
			<span id="prePage"><a
				href='<s:property value="pageBreak.prePage" />'>&lt;&lt;</a> </span>
		</s:if>
		<s:iterator value="pageBreak.pageList">
			<s:if test="linkFlag">
				<span id="pageItem"><a href='<s:property value="href" />'><s:property
							value="idx" /> </a> </span>
			</s:if>
			<s:else>
				<span id="pageItem"><s:property value="idx" />
				</span>
			</s:else>
		</s:iterator>
		<s:if test="pageBreak.nextPageFlag">
			<span id="nextPage"><a
				href='<s:property value="pageBreak.nextPage" />'>&gt;&gt;</a> </span>
		</s:if>
	</div>
</div>