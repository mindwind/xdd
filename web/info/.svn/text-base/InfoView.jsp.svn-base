<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title><s:property value="info.title" /></title>
		<link rel="stylesheet" type="text/css" href="../css/xdd.css" />
		<link rel="stylesheet" type="text/css" href="../css/mnavigator.css" />
	</head>

	<body>
		<div id="out">
			<div id="in">
				<s:include value="/common/MHeader.jsp" />

				<s:include value="/common/MNavigator.jsp" />

				<div class="info">
					<!-- title -->
					<div class="title">
						<s:property value="info.title" />
					</div>

					<!-- info attr -->
					<div class="info_attr">
						<s:text name="date" />
						<s:property value="pubDate" />
						&nbsp;&nbsp;
						<s:text name="from" />
						<s:property value="info.author" />
						&nbsp;&nbsp;
						<s:text name="audit" />
						<s:property value="info.auditor1" />
						&nbsp;&nbsp;
						<s:property value="info.auditor2" />
					</div>

					<!-- content -->
					<div class="content">
						<s:if test="info.imgUrl!=null">
							<p style="text-align: center"><img src='/xdd<s:property value="info.imgUrl"/>'></p>
						</s:if>
						<s:property value="info.content" escape="false" />
					</div>
				</div>

				<s:include value="/common/MFooter.jsp" />
			</div>
		</div>
	</body>
</html>
