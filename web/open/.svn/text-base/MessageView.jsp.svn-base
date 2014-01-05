<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title><s:text name="message.query" /></title>
		<link rel="stylesheet" type="text/css"
			href="../thirdparty/ext-3.0.0/resources/css/ext-all.css" />
		<link rel="stylesheet" type="text/css" href="../css/xdd.css" />
		<link rel="stylesheet" type="text/css" href="../css/mnavigator.css" />
		<link rel="stylesheet" type="text/css" href="../css/open.css" />
		<link rel="stylesheet" type="text/css" href="../css/ext-web-grid-xdd.css" />

		<script type="text/javascript"
			src="../thirdparty/ext-3.0.0/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../thirdparty/ext-3.0.0/ext-all.js"></script>
		<script type="text/javascript"
			src="../thirdparty/ext-3.0.0/src/locale/ext-lang-zh_CN.js"></script>
		<script type="text/javascript" src="../js/xdd-lang-zh_CN.js"></script>
		<script type="text/javascript" src="../js/xdd-base.js"></script>
		<script type="text/javascript" src="../js/open/message_list.js"></script>
	</head>

	<body>
		<div id="out">
			<div id="in">
				<s:include value="/common/MHeader.jsp" />
				<s:include value="/common/MNavigator.jsp" />
				
				<div id="message" class="container">
					<div id="west" class="open-left-panel">
						<s:include value="Party_West.jsp" />
					</div>

					<div id="east" class="open-right-panel">
						<table class="table" width="97%" cellspacing="0" style="margin:6 0 0 0">
							<tbody>
								<tr>
									<th class="th"><s:text name="message.title" /></th>
									<td class="td" colspan="5"><s:property value="message.title" escape="false" /></td>
								</tr>
								<tr>
									<th class="th"><s:text name="message.code" /></th>
									<td class="td"><s:property value="message.datetime" escape="false" /></td>
									<th class="th"><s:text name="message.datetime" /></th>
									<td class="td"><s:property value="formatDatetime" escape="false" /></td>
									<th class="th"><s:text name="message.type" /></th>
									<td class="td"><s:property value="message.messageType.name" escape="false" /></td>
								</tr>
							</tbody>
						</table>
						
						<table class="table" width="97%" cellspacing="0" style="margin:15 0 0 0">
							<tbody>
								<tr>
									<th class="th"><s:text name="message.content" /></th>
								</tr>
								<tr>
									<td class="td">
										<div style="padding:10;line-height:20px;">
											<s:property value="message.content" escape="false" />
										</div>
									</td>
								</tr>
								<tr>
									<th class="th"><s:text name="message.result" /></th>
								</tr>
								<tr>
									<td class="td">
										<div style="padding:10;line-height:20px;">
											<s:property value="message.result" escape="false" />
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						
						<s:if test="listType=='detail'">
							<table class="table" width="97%" cellspacing="0" style="margin:15 0 0 0">
								<tbody>
									<tr>
										<th class="th"><s:text name="message.sender" /></th>
										<td class="td"><s:property value="message.from" escape="false" /></td>
										<th class="th"><s:text name="message.email" /></th>
										<td class="td"><s:property value="message.email" escape="false" /></td>
									</tr>
									<tr>
										<th class="th"><s:text name="message.tel" /></th>
										<td class="td"><s:property value="message.tel" escape="false" /></td>
										<th class="th"><s:text name="message.fax" /></th>
										<td class="td"><s:property value="message.fax" escape="false" /></td>
									</tr>
									<tr>
										<th class="th"><s:text name="message.address" /></th>
										<td class="td" colspan="3"><s:property value="message.address" escape="false" /></td>
									</tr>
								</tbody>
							</table>
						</s:if>
					</div>
				</div>
				
				<s:include value="/common/MFooter.jsp" />
			</div>
		</div>
		
	</body>
</html>