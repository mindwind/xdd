<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title><s:text name="party" />
		</title>
		<link rel="stylesheet" type="text/css"
			href="../thirdparty/ext-3.0.0/resources/css/ext-all.css" />
		<link rel="stylesheet" type="text/css" href="../css/xdd.css" />
		<link rel="stylesheet" type="text/css" href="../css/mnavigator.css" />
		<link rel="stylesheet" type="text/css" href="../css/open.css" />
		<link rel="stylesheet" type="text/css" href="../css/tabs.css" />

		<script type="text/javascript"
			src="../thirdparty/ext-3.0.0/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../thirdparty/ext-3.0.0/ext-all.js"></script>
		<script type="text/javascript"
			src="../thirdparty/ext-3.0.0/src/locale/ext-lang-zh_CN.js"></script>
		<script type="text/javascript" src="../js/xdd-lang-zh_CN.js"></script>
		<script type="text/javascript" src="../js/open/tabs.js"></script>
		<script type="text/javascript" src="../js/open/party.js"></script>
	</head>

	<body>
		<div id="out">
			<div id="in">

				<s:include value="/common/MHeader.jsp" />
				<s:include value="/common/MNavigator.jsp" />

				<div id="party" class="container">
					<div id="west" class="open-left-panel">
						<s:include value="Party_West.jsp" />
					</div>

					<div id="east" class="open-right-panel">
						<s:include value="Party_East.jsp" />
					</div>
				</div>

				<s:include value="/common/MFooter.jsp" />

			</div>
		</div>
	</body>
</html>
