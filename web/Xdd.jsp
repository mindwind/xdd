<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title><s:text name="index.title" /></title>
		
		<link rel="stylesheet" type="text/css" href="css/xdd.css" />
		<link rel="stylesheet" type="text/css" href="css/mnavigator.css" />
		<link rel="stylesheet" type="text/css" href="css/xdd-switch.css" />
		
		<script type="text/javascript" src="thirdparty/jquery-1.3.2/jquery-1.3.2.min.js"></script>
		<script type="text/javascript" src="js/xdd.js"></script>
		<script type="text/javascript" src="js/xdd-switch.js"></script>
	</head>
	<body>
		<div id="out">
			<div id="in">
				<s:include value="/common/MHeader.jsp" />

				<s:include value="/common/MNavigator.jsp" />
				
				<div style="margin-top: 2px;border-bottom: 1px solid #ffcc66">
					<a href="http://www.zzgsc.gov.cn/info/index/513432000" target="_blank"><img src="http://www.zzgsc.gov.cn/images/urlImg.jpg" border=0/></a>
				</div>
				<table style="margin-top: 10px;margin-left:auto;margin-right:auto">
					<tbody>
						<tr>
							<td width="300" valign="top">
								<div id=lantern>
									<div id=lanternMain>
										<div id=lanternImg>
											<div
												style="Z-INDEX: 100; WIDTH: 300px; BORDER-BOTTOM: #ffffff 1px solid; POSITION: absolute; TOP: 221px; HEIGHT: 2px">
												<img id=lanternPoint style="POSITION: absolute"
													src="images/lanternpoint.gif" />
											</div>
										</div>
									</div>
									<div id=lanternNavy></div>
								</div>
								<div id="ft_link">
									
									<a href="http://www.gov.cn/zxft/index.htm" target="_blank"><img
											src="images/zyft.jpg" border=0> </a>
									<a href="http://www.sc.gov.cn/hdjl/zxft/" target="_blank"><img
											src="images/scft.jpg" border=0> </a>
									<!-- 
								    <a href="http://www.zzgsc.gov.cn/info/index/513432000" target="_blank"><img width=300 src="http://www.zzgsc.gov.cn/images/urlImg.jpg"/></a>
								    -->
								</div>
							</td>
							<td width="455" align="center">
								<div id="daily">
									<h2>
										<a href='info/viewInfo.do?infoId=<s:property value="info.id" />' target="_blank"><s:property
												value="info.title" /> </a>
									</h2>
								</div>
								<div id="hlist">
									<s:iterator value="hlist">
										<div class="info_box">
											<a href='info/viewInfo.do?infoId=<s:property value="id" />' target="_blank"><s:property
													value="title" /> </a>
											<span><s:property value="time" /> </span>
										</div>
									</s:iterator>
									<div class="more">
										<a href='info/listGroupInfo.do?gid=23'><s:text name="more" />
										</a>
									</div>
								</div>
							</td>
							<td width="222" valign="top" rowspan="7">
								<s:include value="/common/MEaster.jsp" />
							</td>
						</tr>
						
						<tr>
							<td colspan="2">
								<marquee scrollDelay=150 direction="left" width=700 onmouseout=this.start() onmouseover=this.stop()>
									<div id="weather">
										<a href="/xdd/info/viewInfo.do?infoId=<s:property value="weather.id" />" target="_blank">
											<s:property value="weather.title" />
										</a>
									</div>
								</marquee>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div id="xlist" class="box1">
									<div class="info_group">
										<h2>
											<s:text name="title.0" />
										</h2>
										<span class="more"><a
											href='info/listGroupInfo.do?gid=13'><s:text name="more" />
										</a> </span>
									</div>
									<div style="clear:both">
									<div>
										<div style="margin:9 0 0 10;float:left;">
											<img src="images/xd.jpg" width="300" height="200" style="filter:Alpha(opacity=100,finishOpacity=0,style=2)">
										</div>
										<div style="float:right;width:405">
											<s:iterator value="xlist">
												<div class="info_box">
													<a href='info/viewInfo.do?infoId=<s:property value="id" />' target="_blank"><s:property
															value="title" /> </a>
													<span><s:property value="time" /> </span>
												</div>
											</s:iterator>
										</div>
										<div style="clear:both">
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<object
									codeBase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0
									height=111 width="100%"
									classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000>
									<param name="movie" value="flash/mywh.swf">
									<param name="quality" value="high">
									<embed height="111"
										pluginspage="http://www.macromedia.com/go/getflashplayer"
										quality="high" src="flash/mywh.swf"
										type="application/x-shockwave-flash" width="100%">
									</embed>
								</object>
							</td>
							<td></td>
						</tr>
						<tr>
							<td style="width:373">
								<div id="glist" class="box">
									<div class="info_group">
										<h2>
											<s:text name="title.1" />
										</h2>
										<span class="more"><a
											href='info/listGroupInfo.do?gid=24'><s:text name="more" />
										</a> </span>
									</div>
									<s:iterator value="glist">
										<div class="info_box">
											<a href='info/viewInfo.do?infoId=<s:property value="id" />' target="_blank"><s:property
													value="title" /> </a>
											<span><s:property value="time" /> </span>
										</div>
									</s:iterator>
								</div>
							</td>
							<td>
								<div id="nlist" class="box">
									<div class="info_group">
										<h2>
											<s:text name="title.2" />
										</h2>
										<span class="more"><a
											href='info/listGroupInfo.do?gid=25'><s:text name="more" />
										</a> </span>
									</div>
									<s:iterator value="nlist">
										<div class="info_box">
											<a href='info/viewInfo.do?infoId=<s:property value="id" />' target="_blank"><s:property
													value="title" /> </a>
											<span><s:property value="time" /> </span>
										</div>
									</s:iterator>
								</div>
							</td>
							<td>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<object
									codeBase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0
									height=145 width="100%"
									classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000>
									<param name="movie" value="flash/qj.swf">
									<param name="quality" value="high">
									<embed height="145"
										pluginspage="http://www.macromedia.com/go/getflashplayer"
										quality="high" src="flash/qj.swf"
										type="application/x-shockwave-flash" width="100%">
									</embed>
								</object>
							</td>
							<td></td>
						</tr>
						<tr>
							<td>
								<div id="elist" class="box">
									<div class="info_group">
										<h2>
											<s:text name="title.3" />
										</h2>
										<span class="more"><a
											href='info/listGroupInfo.do?gid=26'><s:text name="more" />
										</a> </span>
									</div>
									<s:iterator value="elist">
										<div class="info_box">
											<a href='info/viewInfo.do?infoId=<s:property value="id" />' target="_blank"><s:property
													value="title" /> </a>
											<span><s:property value="time" /> </span>
										</div>
									</s:iterator>
								</div>
							</td>
							<td>
								<div id="plist" class="box">
									<div class="info_group">
										<h2>
											<s:text name="title.4" />
										</h2>
										<span class="more"><a
											href='info/listGroupInfo.do?gid=27'><s:text name="more" />
										</a> </span>
									</div>
									<s:iterator value="plist">
										<div class="info_box">
											<a href='info/viewInfo.do?infoId=<s:property value="id" />' target="_blank"><s:property
													value="title" /> </a>
											<span><s:property value="time" /> </span>
										</div>
									</s:iterator>
								</div>
							</td>
							<td>
							</td>
						</tr>
					</tbody>
				</table>

				<s:include value="/common/MFooter.jsp" />
			</div>
		</div>
	</body>
</html>
