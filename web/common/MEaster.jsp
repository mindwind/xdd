<%@ taglib uri="/struts-tags" prefix="s"%>

<a href="http://www.scxd.gov.cn:8082/Gpi.aspx" target="_blank"><img src="images/gov_pub.gif" border="0"></a>
<div class="box">
	<div style="padding-left:8px;padding-right:8px">
        <span style="float:left"><a href="open/online.do" target="_blank"><img src="images/zxsq.jpg" border="0"></a></span>
        <span style="float:right"><a href="open/online.do" target="_blank"><img src="images/xzsq.jpg" border="0"></a></span>
    </div>
    <div style="clear:both;text-align:left">
	    <span class="mlink">
	        <img src="images/olink.gif" border="0">
	        <a href="http://www.lsz.gov.cn/3/3.aspx?id=a2d47cde-43be-40d0-871f-c6e45fad635f" target="_blank">
	        <s:text name="link.1" /></a>
	    </span>
	    <br>
	    <span class="mlink">
	    	<img src="images/olink.gif" border="0">
	        <a href="http://www.lsz.gov.cn/3/3.aspx?id=2361b738-a458-4340-9cf8-90eb8eb2cb1e" target="_blank">
	        <s:text name="link.2" /></a>
	    </span>
	    <br>
	    <span class="mlink">
	    	<img src="images/olink.gif" border="0">
	        <a href="http://www.lsz.gov.cn/3/3.aspx?id=00d395f6-2b22-4939-8dc8-e39ccb425221" target="_blank">
	        <s:text name="link.3" /></a>
	    </span>
    </div>
    <div style="padding-left:8px;padding-right:8px;margin-top:5px">
    	<span><a href="open/message_input.do" target="_blank"><img src="images/message_box.png" border="0"></a></span>
    	<span><a href="open/message_show.do" target="_blank"><img src="images/message_query.png" border="0"></a></span>
    </div>
</div>
<img src="images/org.jpg" border="0"><div class="box">
	<s:iterator value="orgs1" status="index">
		<s:if test="#index.index == 0">
		</s:if>
		<s:elseif test="#index.index % 3 == 0">
			<br />
		</s:elseif>
		<span style="width:70;text-align:center">
			<span class="mlink">
				<a href='info/listOrgPublicInfo.do?pid=S_1&orgId=<s:property value="id" />&orgName=<s:property value="name" />' target="_blank">
					<s:property value="name" />
				</a>
			</span>
		</span>
	</s:iterator>
	
	<br />
	
	<s:iterator value="orgs2" status="index">
		<s:if test="#index.index % 2 == 0">
			<br />
		</s:if>
		<span style="width:90;text-align:center">
			<span class="mlink">
				<a href='info/listOrgPublicInfo.do?pid=S_1&orgId=<s:property value="id" />&orgName=<s:property value="name" />' target="_blank">
					<s:property value="name" />
				</a>
			</span>
		</span>
	</s:iterator>
</div>
<img src="images/ps.jpg" border="0"><div class="box">
	<span class="mlink"><a href="info/viewInfo.do?infoId=SYS_29" target="_blank"><s:text
				name="srv.hy" /> </a> </span>
	<span class="mlink"><a href="info/viewInfo.do?infoId=SYS_30" target="_blank"><s:text
				name="srv.jyj" /> </a> </span>
	<br>
	<span class="mlink"><a href="info/viewInfo.do?infoId=SYS_31" target="_blank"><s:text
				name="srv.sy" /> </a> </span>
	<span class="mlink"><a href="info/viewInfo.do?infoId=SYS_32" target="_blank"><s:text
				name="srv.zf" /> </a> </span>
	<br>
	<span class="mlink"><a href="info/viewInfo.do?infoId=SYS_33" target="_blank"><s:text
				name="srv.jy" /> </a> </span>
	<span class="mlink"><a href="info/viewInfo.do?infoId=SYS_34" target="_blank"><s:text
				name="srv.ns" /> </a> </span>
	<br>
	<span class="mlink"><a href="info/viewInfo.do?infoId=SYS_35" target="_blank"><s:text
				name="srv.wh" /> </a> </span>
	<span class="mlink"><a href="info/viewInfo.do?infoId=SYS_36" target="_blank"><s:text
				name="srv.ws" /> </a> </span>
	<br>
	<span class="mlink"><a href="info/viewInfo.do?infoId=SYS_37" target="_blank"><s:text
				name="srv.shbz" /> </a> </span>
	<span class="mlink"><a href="info/viewInfo.do?infoId=SYS_38" target="_blank"><s:text
				name="srv.hjgl" /> </a> </span>
	<br>
	<span class="mlink"><a href="info/viewInfo.do?infoId=SYS_39" target="_blank"><s:text
				name="srv.crj" /> </a> </span>
	<span class="mlink"><a href="info/viewInfo.do?infoId=SYS_40" target="_blank"><s:text
				name="srv.swbz" /> </a> </span>
	<br>
	<span class="mlink"><a href="info/viewInfo.do?infoId=SYS_41" target="_blank"><s:text
				name="srv.by" /> </a> </span>
	<span class="mlink"><a href="info/viewInfo.do?infoId=SYS_42" target="_blank"><s:text
				name="srv.qt" /> </a> </span>
</div>
<img src="images/es.jpg" border="0"><div class="box">
	<span class="mlink"><a href="info/viewInfo.do?infoId=SYS_43" target="_blank"><s:text
				name="srv.slbg" /> </a> </span>
	<span class="mlink"><a href="info/viewInfo.do?infoId=SYS_43" target="_blank"><s:text
				name="srv.gsgl" /> </a> </span>
	<span class="mlink"><a href="info/viewInfo.do?infoId=SYS_43" target="_blank"><s:text
				name="srv.ldbz" /> </a> </span>
	<br>
	<span class="mlink"><a href="info/viewInfo.do?infoId=SYS_43" target="_blank"><s:text
				name="srv.njns" /> </a> </span>
	<span class="mlink"><a href="info/viewInfo.do?infoId=SYS_43" target="_blank"><s:text
				name="srv.zscq" /> </a> </span>
	<span class="mlink"><a href="info/viewInfo.do?infoId=SYS_43" target="_blank"><s:text
				name="srv.zzrz" /> </a> </span>
	<br>
	<span class="mlink"><a href="info/viewInfo.do?infoId=SYS_43l" target="_blank"><s:text
				name="srv.aqfh" /> </a> </span>
	<span class="mlink"><a href="info/viewInfo.do?infoId=SYS_43" target="_blank"><s:text
				name="srv.nsfw" /> </a> </span>
	<span class="mlink"><a href="info/viewInfo.do?infoId=SYS_43" target="_blank"><s:text
				name="srv.jsgl" /> </a> </span>
	<br>
	<span class="mlink"><a href="info/viewInfo.do?infoId=SYS_43" target="_blank"><s:text
				name="srv.dwjl" /> </a> </span>
	<span class="mlink"><a href="info/viewInfo.do?infoId=SYS_43" target="_blank"><s:text
				name="srv.zljc" /> </a> </span>
	<span class="mlink"><a href="info/viewInfo.do?infoId=SYS_43" target="_blank"><s:text
				name="srv.pczx" /> </a> </span>
	<br>
	<span class="mlink"><a href="info/viewInfo.do?infoId=SYS_43" target="_blank"><s:text
				name="srv.rlzy" /> </a> </span>
	<span class="mlink"><a href="info/viewInfo.do?infoId=SYS_43" target="_blank"><s:text
				name="srv.swhd" /> </a> </span>
	<span class="mlink"><a href="info/viewInfo.do?infoId=SYS_43" target="_blank"><s:text
				name="srv.zhqt" /> </a> </span>
</div>
<img src="images/shzx.jpg" border="0"><div class="box">
	<span class="mlink"><img src="images/shzx/fj.gif" border="0" style="margin-right:4px"><a href="http://www.ctrip.com/" target="_blank"><s:text
				name="srv.hbxx" /> </a> </span>
	<span class="mlink"><img src="images/shzx/hc.jpg" border="0" style="margin-right:4px"><a href="http://destguides.ctrip.com/Destinations/train/trainsearch.aspx" target="_blank"><s:text
				name="srv.hcsk" /> </a> </span>
	<br>
	<span class="mlink"><img src="images/shzx/qch.gif" border="0" style="margin-right:4px"><a href="info/viewInfo.do?infoId=SYS_45" target="_blank"><s:text
				name="srv.qcky" /> </a> </span>
	<span class="mlink"><img src="images/shzx/gllk.gif" border="0" style="margin-right:4px"><a href="info/viewInfo.do?infoId=SYS_44" target="_blank"><s:text
				name="srv.gllk" /> </a> </span>
	<br>
	<span class="mlink"><img src="images/shzx/jingqsf.jpg" border="0" style="margin-right:4px"><a href="info/viewInfo.do?infoId=SYS_46" target="_blank"><s:text
				name="srv.ykxz" /> </a> </span>
	<span class="mlink"><img src="images/shzx/senhbk.jpg" border="0" style="margin-right:4px"><a href="http://baike.baidu.com/" target="_blank"><s:text
				name="srv.shbk" /> </a> </span>
	<br>
	<span class="mlink"><img src="images/shzx/bg.gif" border="0" style="margin-right:4px"><a href="http://hotels.ctrip.com/Domestic/SearchHotel.aspx" target="_blank"><s:text
				name="srv.bgfd" /> </a> </span>
	<span class="mlink"><img src="images/shzx/call.gif" border="0" style="margin-right:4px"><a href="http://www.114chn.com/tel.htm" target="_blank"><s:text
				name="srv.cydh" /> </a> </span>
</div>
<img src="images/xxl.jpg" border="0" style="margin: 3 0 0 0">
<img src="images/hby.jpg" border="0" style="margin: 1 0 0 0">
<img src="images/wq.jpg" border="0" style="margin: 1 0 0 0">

