<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title><s:text name="login" />
		</title>
		<link rel="stylesheet" type="text/css"
			href="../thirdparty/ext-3.0.0/resources/css/ext-all.css" />
		<link rel="stylesheet" type="text/css" href="../css/common.css" />
		<link rel="stylesheet" type="text/css" href="../css/header.css" />
		<link rel="stylesheet" type="text/css" href="../css/footer.css" />
		<link rel="stylesheet" type="text/css" href="../css/login.css" />
		<script type="text/javascript"
			src="../thirdparty/ext-3.0.0/adapter/ext/ext-base.js"></script>
		<script type="text/javascript"
			src="../thirdparty/ext-3.0.0/ext-all.js"></script>
		<script type="text/javascript"
			src="../thirdparty/ext-3.0.0/src/locale/ext-lang-zh_CN.js"></script>
		<script type="text/javascript" src="../js/xdd-lang-zh_CN.js"></script>
		<script type="text/javascript" src="../js/user/user_login.js"></script>
	</head>

	<body>
		<s:include value="/common/Header.jsp" />

		<div id="center">
			<div id="service_intro_img">
				<img src="../images/service_intro.jpg" alt="service">
			</div>
		</div>

		<div id="east">
		</div>

		<s:include value="/common/Footer.jsp" />
	</body>
</html>
