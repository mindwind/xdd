<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title><s:property value="ig.name" /></title>
		<link rel="stylesheet" type="text/css" href="../css/xdd.css" />
		<link rel="stylesheet" type="text/css" href="../css/mnavigator.css" />
		<link rel="stylesheet" type="text/css"
			href="../thirdparty/pagebreak-1.0.0/struts2/PageBreak-style.css" />
	</head>

	<body>
		<div id="out">
			<div id="in">
				<s:include value="/common/MHeader.jsp" />

				<s:include value="/common/MNavigator.jsp" />

				<div id="groupInfoList">
					<s:iterator value="list">
						<div class="info_box">
							<a href='viewInfo.do?infoId=<s:property value="id" />'><s:property
									value="title" /> </a>
							<span><s:property value="time" /> </span>
						</div>
					</s:iterator>
				</div>
				<s:include
					value="/thirdparty/pagebreak-1.0.0/struts2/PageBreakStruts2.jsp" />

				<s:include value="/common/MFooter.jsp" />
			</div>
		</div>
	</body>
</html>
