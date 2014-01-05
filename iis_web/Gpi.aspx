<%@ page language="C#" autoeventwireup="true" inherits="Gpi, App_Web_yvgvleqn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<Script language="c#" >
       function GetTitleStr(object SrcStr)
        {
            string str;
            str = SrcStr.ToString();
            if (SrcStr.ToString().Length > 10)
            {
                str = SrcStr.ToString().Substring(0, 10 - 1) + "..";
                return str;
            }

            else
            {
                return str;

            }

        }
    </script>
    <script type="text/javascript">
    function searchContent()
	{
		window.open("Search.aspx?keyword=" + escape(document.all.keyword.value) + "&deptId=" + document.all.department.value + "&year=" + document.all.dateTime.value);
	}
    </script>
<title>
<%
    if (System.Configuration.ConfigurationManager.ConnectionStrings["GPItitle"] != null)
        Response.Write(ConfigurationManager.ConnectionStrings["GPItitle"].ConnectionString);
    else
        Response.Write("信息填报目录");
        
 %>
</title>
<link href="css/style_xxgk2010.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
  <table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr>
      <td align="center"><table width="990" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" background="images/20100728wj_xxgk_04.jpg"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td align="left"><a href="http://www.lsz.gov.cn">凉山州人民政府门户网站</a>   &nbsp;&nbsp;&nbsp;<a href="http://www.sc.gov.cn/10954/">省政府信息公开专栏</a>&nbsp;</td>
              <td align="right"><script language="JavaScript" type="text/javascript">

                                var today = new Date();
                                function initArray() {
                                    this.length = initArray.arguments.length;
                                    for (var i = 0; i < this.length; i++) this[i + 1] = initArray.arguments[i]
                                }
                                var d = new initArray("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
                                document.write("<font color=\"#626262\" class=\"h12xgao24\"> ", today.getYear(), "年", today.getMonth() + 1, "月", today.getDate(), "日", "&nbsp;", d[today.getDay() + 1], "</font>");
                            </script></td>
            </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
  </table>
  <table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr>
      <td align="center"><img src="images/20100728wj_xxgk_08.jpg" width="990" height="131" /></td>
    </tr>
    <tr>
      <td height="29" align="center" style="background:url(images/20100728wj_xxgk_09.jpg) no-repeat center; " >
<DIV style=" OVERFLOW: hidden; LINE-HEIGHT: 24px; HEIGHT: 28px">
                  <DIV>
                  <DIV id=googleRS class="xxgk_bai14">保障公民、法人和其他组织的知情权、参与权、监督权<BR>提高政府工作透明度<BR></DIV>
                  <SCRIPT type=text/javascript>
<!--
(function(){var pthis=this;this.$=function(a){if(document.getElementById){return eval('document.getElementById("'+a+'")')}else{if(document.layers){return eval("document.layers['"+a+"']")}else{return eval("document.all."+a)}}};this.SinaDotMarquee=function(id,h,s,d){var apthis=this;var t;var p=false;var o=pthis.$(id);o.style.overflow="hidden";o.style.height=h+"px";o.style.lineHeight=h+"px";o.innerHTML+=o.innerHTML;o.onmouseover=function(){p=true};o.onmouseout=function(){p=false};o.scrollTop=0;this.doScroll=function(){t=setInterval(apthis.scrolling,s);if(!p){o.scrollTop+=2}};this.scrolling=function(){if(o.scrollTop%h!=0){o.scrollTop+=2;if(o.scrollTop>=o.scrollHeight/2){o.scrollTop=0}}else{clearInterval(t);setTimeout(apthis.doScroll,d)}};setTimeout(apthis.doScroll,d)};try{var SinaDotMarquee01=new SinaDotMarquee("googleRS",24,50,4000)}catch(e){}})();
//-->
</SCRIPT>
                  </DIV></DIV>
	  </td>
    </tr>
  </table>
  <table width="1000" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr>
      <td><table width="990" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="16" background="images/20100728wj_xxgk_11.jpg">&nbsp;</td>
        </tr>
      </table></td>
    </tr>
  </table>  
  <table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr>
      <td align="center"><table width="990" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="199" rowspan="2" align="center" valign="top"><table width="100%" border="0" cellpadding="12" cellspacing="1" bgcolor="#CCCCCC">
                <tr>
                  <td align="center" valign="middle" background="images/20100728wj_xxgk_46.jpg" bgcolor="#FFFFFF"><table width="165" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="26" align="center" background="images/20100728wj_xxgk_53.jpg"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="xxgk_nav14">
                            <tr>
                              <td align="center">&nbsp;&nbsp;<a href="http://www.lsz.gov.cn/xxgk-bzjz/c2e7c98a-0cd0-4aea-aaab-f2313baf5aa7" target="_blank">政府信息公开条例</a></td>
                            </tr>
                        </table></td>
                      </tr>
					    <tr>
                        <td height="12" align="center"><img src="images/20100728wj_xxgk_54.jpg" width="165" height="2" /></td>
                      </tr>
                      <tr>
                        <td height="26" align="center" background="images/20100728wj_xxgk_53.jpg"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="xxgk_nav14">
                            <tr>
                              <td align="center">&nbsp;&nbsp;<a href="http://www.lsz.gov.cn/xxgk-bzjz" target="_blank">信息公开制度文件</a></td>
                            </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td height="12" align="center"><img src="images/20100728wj_xxgk_54.jpg" width="165" height="2" /></td>
                      </tr>
                      <tr>
                        <td height="26" align="center" background="images/20100728wj_xxgk_53.jpg"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="xxgk_nav14">
                            <tr>
                              <td align="center">&nbsp;&nbsp;<a href="http://www.lsz.gov.cn/xxgk/aa6519c9-a7f8-470f-a260-a9a62fa38d98" target="_blank">政府信息公开指南</a></td>
                            </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td height="12" align="center"><img src="images/20100728wj_xxgk_54.jpg" width="165" height="2" /></td>
                      </tr>
                      <tr>
                        <td height="26" align="center" background="images/20100728wj_xxgk_53.jpg"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="xxgk_nav14">
                            <tr>
                              <td align="center">&nbsp;&nbsp;<a href="http://www.lsz.gov.cn/xxgk-gkml/ec9c1b99-8251-4863-b626-1b3282aadb02" target="_blank">政府信息公开目录</a></td>
                            </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td height="12" align="center"><img src="images/20100728wj_xxgk_54.jpg" width="165" height="2" /></td>
                      </tr>
                      <tr>
                        <td height="26" align="center" background="images/20100728wj_xxgk_53.jpg"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="xxgk_nav14">
                            <tr>
                              <td align="center">&nbsp;<a href="http://www.lsz.gov.cn/xxgk-xxgknb" target="_blank">&nbsp;政府信息公开年报</a></td>
                            </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td height="12" align="center"><img src="images/20100728wj_xxgk_54.jpg" width="165" height="2" /></td>
                      </tr>
                      <tr>
                        <td height="26" align="center" background="images/20100728wj_xxgk_53.jpg"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="xxgk_nav14">
                            <tr>
                              <td align="center">&nbsp;&nbsp;<a href="http://xxgk.lsz.gov.cn/more2009-yishenqing.aspx" target="_blank">依 申 请 公 开</a></td>
                            </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td height="12" align="center"><img src="images/20100728wj_xxgk_54.jpg" width="165" height="2" /></td>
                      </tr>
					   <tr>
                        <td height="26" align="center" background="images/20100728wj_xxgk_53.jpg"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="xxgk_nav14">
                            <tr>
                              <td align="center">&nbsp;&nbsp;<a href="http://12345.lsz.gov.cn/write.aspx" target="_blank">政府信息公开意见箱</a></td>
                            </tr>
                        </table></td>
                      </tr>
					 
                  </table></td>
                </tr>
              </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="8"></td>
                </tr>
              </table>
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td align="center" valign="middle"><script src="Scripts/lefttree_bs.js" type="text/javascript"></script>
                      <div class="leftnav">
                        <div class="mainnav"><span id="menu">
                          <h3 id="sqfw" style="border-top:none;">
                            <div style="float:left; width:35px;"><img src="images/bsfw_sy_14.jpg" alt="" name="sqfw" id="Img1" /></div>
                            <div style="float:left; margin-top:10px;">按主题分类</div>
                            <div style="float:right; "><img src="images/bsfw_sy_17.jpg" width="44" height="30" /></div>
                          </h3>
                          <ul  >
                            <div style="height:8px;">&nbsp;</div>
                            <script language="javascript" type="text/javascript">
function generateTree_zfxxgk_leftBottom()
{

	var obj = new ActiveXObject("Microsoft.XMLHTTP"), re = new RegExp("(\\(|（).*(）|\\))|[0-9a-z]", "gim");
	obj.open("get", "Config/gpiColumns.xml", false);
	obj.send();
	var doc = obj.responseXML.selectNodes("root/column/column"), str = "", name = "", img = "", columnId = "";
	for(var i = 0; i < doc.length; i++)
	{
		var childs = getChildColumn_zfxxgk_leftBottom(doc[i], 2);
		name = doc[i].selectSingleNode("@name").text;
		columnId = doc[i].selectSingleNode("@id").text;
		name = "<a href=\"www.sc.gov.cn/10954/gpiSearch/Search.shtml?columnId=" + columnId + "\">" + name.replace(re, "") + "</a>";
		if(childs != "") img = "<span style=\"cursor:pointer;\" onclick=\"showChilds_zfxxgk_leftBottom(this);\"><img src=\"images/a.jpg\" alt=\"\" /></span> ";
		else img = "<span style=\"cursor:pointer;\"><img src=\"images/-.jpg\" alt=\"\" /></span> ";
		str += "<div>\r\n" + img + name + "\r\n" + childs + "</div>\r\n";
	}
//	document.write("<div align=\"left\" style=\"overflow:auto;\">" + str + "</div>");
	//alert(str);
}

function getChildColumn_zfxxgk_leftBottom(doc, level)
{
	var str = "", re = new RegExp("(\\(|（).*(）|\\))|[0-9a-z]", "gim");
	var columns = doc.selectNodes("column");
	if(columns.length > 0)
	{
		str = "<div style=\"display:none;\";>\r\n";
		for(var i = 0; i < columns.length; i++)
		{
			var childs = getChildColumn_zfxxgk_leftBottom(columns[i], level + 1), img = "&nbsp;&nbsp;"
				, columnName = columns[i].selectSingleNode("@name").text, space = ""
				, columnId = columns[i].selectSingleNode("@id").text;
			if(childs != "") img = "<span style=\"cursor:pointer;\" onclick=\"showChilds_zfxxgk_leftBottom(this);\"><img src=\"images/a.jpg\" alt=\"\" /></span> ";
			for(var j = 1; j < level; j++) space += "&nbsp;&nbsp;"
			columnName = "<a href=\"www.sc.gov.cn/10954/gpiSearch/Search.shtml?columnId=" + columnId + "\">" + columnName.replace(re, "") + "</a>";
			str += "<div>\r\n" + space + img + columnName + "\r\n" + childs + "</div>\r\n";
		}
		str += "</div>";
	}
	
	return str;
}

function showChilds_zfxxgk_leftBottom(obj)
{
	var childObj = obj.parentNode.getElementsByTagName("div")[0];
	if(childObj.style.display == "none")
	{
		childObj.style.display = "block";
		obj.getElementsByTagName("img")[0].src = "images/-.jpg";
	}
	else
	{
		childObj.style.display = "none";
		obj.getElementsByTagName("img")[0].src = "images/a.jpg";
	}
}

//generateTree_zfxxgk_leftBottom();

</script>
  <%=new Channel().GetAllChannel() %>
                          </ul>
                          <h3>
                            <div style="float:left; width:35px;"><img alt="" src="images/bsfw_sy_14.jpg" id="Img2" /></div>
                            <div style="float:left; margin-top:10px;">按体载分类</div>
                            <div style="float:right; "><img src="images/bsfw_sy_17.jpg" width="44" height="30" /></div>
                          </h3>
                          <ul id="dzh">
                            <div style="height:8px;">&nbsp;</div>
                            <div align="left" style="line-height:20px;">
                            <div><a href="#" onclick="this.href='Search.aspx?columnName=' + escape('命令');">命令</a></div>
<div><a href="#" onclick="this.href='Search.aspx?columnName=' + escape('决定');">决定</a></div>
<div><a href="#" onclick="this.href='Search.aspx?columnName=' + escape('公告');">公告</a></div>
<div><a href="#" onclick="this.href='Search.aspx?columnName=' + escape('通告');">通告</a></div>
<div><a href="#" onclick="this.href='Search.aspx?columnName=' + escape('通知');">通知</a></div>
<div><a href="#" onclick="this.href='Search.aspx?columnName=' + escape('通报');">通报</a></div>
<div><a href="#" onclick="this.href='Search.aspx?columnName=' + escape('议案');">议案</a></div>
<div><a href="#" onclick="this.href='Search.aspx?columnName=' + escape('报告');">报告</a></div>
<div><a href="#" onclick="this.href='Search.aspx?columnName=' + escape('请示');">请示</a></div>
<div><a href="#" onclick="this.href='Search.aspx?columnName=' + escape('批复');">批复</a></div>
<div><a href="#" onclick="this.href='Search.aspx?columnName=' + escape('意见');">意见</a></div>
<div><a href="#" onclick="this.href='Search.aspx?columnName=' + escape('函');">函</a></div>
<div><a href="#" onclick="this.href='Search.aspx?columnName=' + escape('会议纪要');">会议纪要</a></div>

							</div>
                          </ul>
                          <h3>
                            <div style="float:left; width:35px;"><img alt="" src="images/bsfw_sy_14.jpg" id="Img3" /></div>
                            <div style="float:right; "><img src="images/bsfw_sy_17.jpg" width="44" height="30" /></div>
                            <div style="float:left; margin-top:10px;">按服务对象分类</div>
                          </h3>
                          <ul>
                            <div style="height:8px;">&nbsp;</div>
                            <div align="left" style="line-height:20px;">
                            <div ><a href="#" onclick="this.href='Search.aspx?docType=' + escape('公民');">公民</a></div>
<div><a href="#" onclick="this.href='Search.aspx?docType=' + escape('企业');">企业</a></div>

							</div>
                          </ul>
                        </span></div>
                      </div></td>
                </tr>
              </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="8"></td>
                </tr>
            </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
              <tr>
                <td align="center" bgcolor="#FFFFFF">&nbsp;</td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="8"></td>
              </tr>
            </table>
            </td>
          <td width="8" rowspan="2" align="center" valign="top">&nbsp;</td>
          <td align="center" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
              <tr>
                <td align="center" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="60"><img src="images/20100728wj_xxgk_12.jpg" width="60" height="44" /></td>
                            <td align="left" background="images/20100728wj_xxgk_14.jpg"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                  <td align="left" class="xxgk_H14c">最新公开信息</td>
                                  <td align="right"><a href="#" target="_blank">更多&gt;&gt;</a></td>
                                </tr>
                            </table></td>
                            <td width="57"><img src="images/20100728wj_xxgk_16.jpg" width="57" height="44" /></td>
                          </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td align="center"><table width="98%" border="0" cellspacing="5" cellpadding="0">
                          <%=GetTopMsg()%>
                          
                      </table></td>
                    </tr>
                </table></td>
              </tr>
            </table>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="8"></td>
                </tr>
              </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
                <tr>
                  <td align="center" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="60"><img src="images/20100728wj_xxgk_12.jpg" width="60" height="44" /></td>
                              <td align="left" background="images/20100728wj_xxgk_14.jpg"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td align="left" class="xxgk_H14c">信息公开制度规定</td>
                                    <td align="right"><a href="http://www.lsz.gov.cn/xxgk-bzjz" target="_blank">更多&gt;&gt;</a></td>
                                  </tr>
                              </table></td>
                              <td width="57"><img src="images/20100728wj_xxgk_16.jpg" width="57" height="44" /></td>
                            </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td align="center"><table width="98%" border="0" cellspacing="5" cellpadding="0">
                            <tr>
                              <td colspan="2" align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="20" height="24" align="left"><img src="images/20100728wj_xxgk_50.jpg" width="11" height="11" /></td>
                                    <td><strong><a href="http://www.lsz.gov.cn/Detail/xxgk-bzjz/2361b738-a458-4340-9cf8-90eb8eb2cb1e" target="_blank">凉山州政府信息主动公开办法</a></strong></td>
                                  </tr>
                              </table></td>
                            </tr>
                            <tr>
                              <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="20" height="24" align="left"><img src="images/20100728wj_xxgk_50.jpg" width="11" height="11" /></td>
                                    <td><strong><a href="http://www.lsz.gov.cn/Detail/xxgk-bzjz/00d395f6-2b22-4939-8dc8-e39ccb425221" target="_blank">凉山州政府信息依申请公开办法</a></strong></td>
                                  </tr>
                              </table></td>
                              <td width="286" align="left" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="19" height="24" align="left"><img src="images/20100728wj_xxgk_50.jpg" width="11" height="11" /></td>
                                    <td width="245"><strong><a href="http://www.lsz.gov.cn/Detail/xxgk-bzjz/56be92d2-9b3c-43e6-82af-2512c7eba0b3" target="_blank">凉山州行政机关公文类信息公开审核办法</a></strong></td>
                                  </tr>
                              </table></td>
                            </tr>
                            <tr>
                              <td width="266" align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="20" height="24" align="left"><img src="images/20100728wj_xxgk_50.jpg" width="11" height="11" /></td>
                                    <td><strong><a href="http://www.lsz.gov.cn/Detail/xxgk-bzjz/23a1ec26-cfcc-4a05-931d-6d2ee9e52cea" target="_blank">凉山州政府信息公开目标管理考核办法</a></strong></td>
                                  </tr>
                              </table></td>
                              <td align="left" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="20" height="24" align="left"><img src="images/20100728wj_xxgk_50.jpg" width="11" height="11" /></td>
                                    <td><strong><a href="http://www.lsz.gov.cn/Detail/xxgk-bzjz/4f1e873a-8efc-4ca2-9d96-abbca36c3eba" target="_blank">凉山州违反政府信息公开规定行为的责任追究办法</a></strong></td>
                                  </tr>
                              </table></td>
                            </tr>
                        </table></td>
                      </tr>
                  </table></td>
                </tr>
              </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="8"></td>
                </tr>
              </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
              <tr>
                <td align="center" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="60"><img src="images/20100728wj_xxgk_12.jpg" width="60" height="44" /></td>
                            <td align="left" background="images/20100728wj_xxgk_14.jpg"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                  <td align="left" class="xxgk_H14c">县级部门信息公开目录</td>
                                  <td align="right"><a href="#" target="_blank">更多&gt;&gt;</a></td>
                                </tr>
                            </table></td>
                            <td width="57"><img src="images/20100728wj_xxgk_16.jpg" width="57" height="44" /></td>
                          </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td align="center" valign="top"><table width="100%" border="0" cellspacing="6" cellpadding="0">
                          <tr>
                            <td height="8" align="center"><table width="100%" border="0" cellpadding="7" cellspacing="1" bgcolor="#ffe7cc">
                                <tr>
                                  <td width="25%" align="left" bgcolor="#FFFFFF"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /><a href="GPI/index.aspx?dept=92339213" target="_blank"> 政府办</a></td>
                                  <td width="25%" align="left" bgcolor="#fff6ed"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /><a href="GPI/index.aspx?dept=92339292" target="_blank"> 发改委</a></td>
                                  <td width="25%" align="left" bgcolor="#FFFFFF"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /><a href="GPI/index.aspx?dept=92339293" target="_blank"> 经信局</a></td>
                                  <td align="left" bgcolor="#FFF6ED"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339294" target="_blank">教育局</a></td>
                                </tr>
                                <tr>
                                  <td align="left" bgcolor="#FFFFFF"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339295" target="_blank"> 公安局 </a></td>
                                  <td align="left" bgcolor="#fff6ed"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339296" target="_blank"> 监察局</a></td>
                                  <td align="left" bgcolor="#FFFFFF"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /><a href="GPI/index.aspx?dept=92339297" target="_blank">  民政局</a></td>
                                  <td align="left" bgcolor="#FFF6ED"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339298" target="_blank"> 司法局</a></td>
                                </tr>
                                <tr>
                                  <td align="left" bgcolor="#FFFFFF"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339299" target="_blank"> 财政局</a></td>
                                  <td align="left" bgcolor="#fff6ed"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /><a href="GPI/index.aspx?dept=92339300" target="_blank"> 人力资源和社会保障局</a></td>
                                  <td align="left" bgcolor="#FFFFFF"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339301" target="_blank"> 国土资源局</a></td>
                                  <td align="left" bgcolor="#FFF6ED"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /><a href="GPI/index.aspx?dept=92339302" target="_blank"> 规划建设住房保障局</a></td>
                                </tr>
                                <tr>
                                  <td align="left" bgcolor="#FFFFFF"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /><a href="GPI/index.aspx?dept=92339303 target="_blank">  交通运输局</a> </td>
                                  <td align="left" bgcolor="#fff6ed"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /><a href="GPI/index.aspx?dept=92339304" target="_blank"> 水务局 </a></td>
                                  <td align="left" bgcolor="#FFFFFF"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339305" target="_blank"> 畜牧科技局</a> </td>
                                  <td align="left" bgcolor="#FFF6ED"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339306" target="_blank"> 林业局</a> </td>
                                </tr>
                                <tr>
                                  <td align="left" bgcolor="#FFFFFF"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /><a href="GPI/index.aspx?dept=92339307" target="_blank">  卫生局</a> </td>
                                  <td align="left" bgcolor="#fff6ed"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339308" target="_blank"> 文化旅游局</a> </td>
                                  <td align="left" bgcolor="#FFFFFF"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339309" target="_blank"> 人口计生局 </a></td>
                                  <td align="left" bgcolor="#FFF6ED"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339310" target="_blank"> 审计局</a></td>
                                </tr>
                                <tr>
                                  <td align="left" bgcolor="#FFFFFF"><p><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339311" target="_blank"> 统计局</a> </p> </td>
                                  <td align="left" bgcolor="#fff6ed"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339312" target="_blank"> 安全生产监督局</a> </td>
                                  <td align="left" bgcolor="#FFFFFF"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /><a href="GPI/index.aspx?dept=92339313" target="_blank">  扶贫和移民工作局</a></td>
                                  <td align="left" bgcolor="#FFF6ED"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339314" target="_blank"> 食品药品监督局 </a></td>
                                </tr>
                                <tr>
                                  <td align="left" bgcolor="#FFFFFF"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /><a href="GPI/index.aspx?dept=92339318" target="_blank">  环保局</a> </td>
                                  <td align="left" bgcolor="#fff6ed"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /><a href="GPI/index.aspx?dept=92339319" target="_blank">  档案局</a></td>
                                  <td align="left" bgcolor="#FFFFFF"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339320" target="_blank"> 广播电影电视体育局 </a></td>
                                  <td align="left" bgcolor="#FFF6ED"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339321" target="_blank"> 防震减灾局 </a></td>
                                </tr>
                                <tr>
                                  <td align="left" bgcolor="#FFFFFF"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339322" target="_blank"> 招商引资局 </a></td>
                                  <td align="left" bgcolor="#fff6ed"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339323" target="_blank"> 气象局 </a></td>
                                  <td align="left" bgcolor="#FFFFFF"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339324" target="_blank"> 粮食局 </a></td>
                                  <td align="left" bgcolor="#FFF6ED"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339325" target="_blank"> 政务中心</a> </td>
                                </tr>
                                <tr>
                                  <td align="left" bgcolor="#FFFFFF"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339326" target="_blank"> 县志办 </a></td>
                                  <td align="left" bgcolor="#fff6ed"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /><a href="GPI/index.aspx?dept=92339327" target="_blank"> 国税局</a></td>
                                  <td align="left" bgcolor="#FFFFFF"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /><a href="GPI/index.aspx?dept=92339328" target="_blank"> 地税局</a></td>
                                  <td align="left" bgcolor="#FFF6ED"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /><a href="GPI/index.aspx?dept=92339329" target="_blank"> 质监局</a></td>
                                </tr>
                                <tr>
                                  <td align="left" bgcolor="#FFFFFF"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339330" target="_blank"> 工商局 </a></td>
                                </tr>
                            </table></td>
                          </tr>
                      </table></td>
                    </tr>
                </table></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="8"></td>
                </tr>
              </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
                <tr>
                  <td align="center" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="60"><img src="images/20100728wj_xxgk_12.jpg" width="60" height="44" /></td>
                              <td align="left" background="images/20100728wj_xxgk_14.jpg"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td align="left" class="xxgk_H14c">乡镇政府信息公开目录</td>
                                    <td align="right"><a href="#" target="_blank">更多&gt;&gt;</a></td>
                                  </tr>
                              </table></td>
                              <td width="57"><img src="images/20100728wj_xxgk_16.jpg" width="57" height="44" /></td>
                            </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td align="center" valign="top"><table width="100%" border="0" cellspacing="6" cellpadding="0">
                            <tr>
                              <td height="8" align="center"><table width="100%" border="0" cellpadding="7" cellspacing="1" bgcolor="#ffe7cc">
                                  <tr>
                                    <td width="25%" align="left" bgcolor="#FFFFFF"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339261" target="_blank">光明镇</a></td>
                                    <td width="25%" align="left" bgcolor="#fff6ed"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339262" target="_blank">鲁基乡</a></td>
                                    <td width="25%" align="left" bgcolor="#FFFFFF"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339263" target="_blank">热柯依达乡</a></td>
                                    <td align="left" bgcolor="#FFF6ED"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339264" target="_blank">冕山镇</a></td>
                                  </tr>
                                  <tr>
                                    <td align="left" bgcolor="#FFFFFF"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339265" target="_blank">则约乡</a></td>
                                    <td align="left" bgcolor="#fff6ed"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339266" target="_blank">沙马拉达乡</a></td>
                                    <td align="left" bgcolor="#FFFFFF"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339274" target="_blank">东河乡</a></td>
                                    <td align="left" bgcolor="#FFF6ED"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339275" target="_blank">乐武乡</a></td>
                                  </tr>
                                  <tr>
                                    <td align="left" bgcolor="#FFFFFF"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339276" target="_blank">拉克乡</a></td>
                                    <td align="left" bgcolor="#fff6ed"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339277" target="_blank">洛哈镇</a></td>
                                    <td align="left" bgcolor="#FFFFFF"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339278" target="_blank">额尼乡</a></td>
                                    <td align="left" bgcolor="#FFF6ED"><p><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339279" target="_blank">且托乡</a></td>
                                  </tr>
                                  <tr>
                                    <td align="left" bgcolor="#FFFFFF"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339280" target="_blank">两河口镇</a></td>
                                    <td align="left" bgcolor="#fff6ed"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339281" target="_blank">博洛拉达乡</a></td>
                                    <td align="left" bgcolor="#FFFFFF"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339282" target="_blank">贺波洛乡</a></td>
                                    <td align="left" bgcolor="#FFF6ED"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339283" target="_blank">尼波镇</a></td>
                                  </tr>
                                  <tr>
                                    <td align="left" bgcolor="#FFFFFF"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339284" target="_blank">依洛乡</a></td>
                                    <td align="left" bgcolor="#fff6ed"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339285" target="_blank">李子乡</a></td>
                                    <td align="left" bgcolor="#FFFFFF"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339286" target="_blank">巴久乡</a></td>
                                    <td align="left" bgcolor="#FFF6ED"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339287" target="_blank">西河乡</a></td>
                                  </tr>
                                  <tr>
                                    <td align="left" bgcolor="#FFFFFF"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339288" target="_blank">红莫镇</a></td>
                                    <td align="left" bgcolor="#fff6ed"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339289" target="_blank">北山乡</a></td>
                                    <td align="left" bgcolor="#FFFFFF"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339290" target="_blank">洛莫乡</a></td>
                                    <td align="left" bgcolor="#FFF6ED"><img src="images/20100728wj_xxgk_66.jpg" width="10" height="10" /> <a href="GPI/index.aspx?dept=92339291" target="_blank">米市镇</a></td>
                                  </tr>
                              </table></td>
                            </tr>
                        </table></td>
                      </tr>
                  </table></td>
                </tr>
            </table></td>
          <td width="8" align="center" valign="top">&nbsp;</td>
          <td width="192" align="center" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#df6f00">
              <tr>
                <td align="center" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td align="center"><img src="images/20100728wj_xxgk_18.jpg" width="190" height="25" /></td>
                    </tr>
                  </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td align="center" valign="top" style="background:url(images/20100728wj_xxgk_26.jpg) repeat-x center top;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td height="8"></td>
                            </tr>
                          </table>
                            <table width="98%" border="0" cellspacing="6" cellpadding="0">
                              <tr>
                                <td width="60" height="28" align="right" class="xxgkH12">关键词&nbsp;</td>
                                <td align="left"><input name="keyword" id="keyword" type="text" class="xxgkInput" />                                </td>
                              </tr>
                              <tr>
                                <td height="28" align="right" class="xxgkH12">范&nbsp;&nbsp;围&nbsp;</td>
                                <td align="left"><select name="department" class="xxgkInput" id="department" runat="server">
                                    <option value="0">全部</option>
                                </select></td>
                              </tr>
                              <tr>
                                <td height="28" align="right" class="xxgkH12">时&nbsp;&nbsp;间&nbsp;</td>
                                <td align="left"><select name="dateTime" class="xxgkInput" runat="server" id="dateTime">
                                   
                                  </select>                                </td>
                              </tr>
                              <tr>
                                <td colspan="2" align="center" height="5"></td>
                              </tr>
                              <tr>
                                <td height="30" colspan="2" align="center" valign="top"><input name="button" type="button"  onclick="searchContent();" style="cursor:pointer;" class="xxgkButton" id="button" value="   开始搜索" />
                                  &nbsp;
                                  <input name="button2" type="submit" class="xxgkButton" id="button2" style="display:none;" value="   高级搜索" /></td>
                              </tr>
                          </table></td>
                      </tr>
                  </table></td>
              </tr>
            </table>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="8"></td>
                </tr>
              </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#df6f00">
                <tr>
                  <td align="center" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td align="center"><img src="images/20100728wj_xxgk_43.jpg" width="190" height="25" /></td>
                      </tr>
                    </table>
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td align="center" valign="top" style="background:url(images/20100728wj_xxgk_26.jpg) repeat-x center top;"><table width="100%" border="0" cellspacing="10" cellpadding="0">
                              <tr>
                                <td align="center" valign="top"><table width="165" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
                                    <tr>
                                      <td height="8" align="center" bgcolor="#FFFFFF">&nbsp;</td>
                                    </tr>
                                  </table>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td height="8"></td>
                                      </tr>
                                    </table>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td height="28" align="center" background="images/20100728wj_xxgk_62.jpg" class="xxgkC12"><a href="http://www.lsz.gov.cn/xxgk/3336" target="_blank">州政府新闻发布会</a></td>
                                      </tr>
                                      <tr>
                                        <td align="center" height="10"></td>
                                      </tr>
                                      <tr>
                                        <td height="28" align="center" background="images/20100728wj_xxgk_62.jpg" class="xxgkC12"><a href="#" target="_blank">州级部门新闻发布会</a></td>
                                      </tr>
                                      <tr>
                                        <td align="center" height="10"></td>
                                      </tr>
                                      <tr>
                                        <td height="28" align="center" background="images/20100728wj_xxgk_62.jpg" class="xxgkC12"><a href="#" target="_blank">县(市)政府新闻发布会</a></td>
                                      </tr>
                                  </table></td>
                              </tr>
                          </table></td>
                        </tr>
                    </table></td>
                </tr>
              </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="8"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#df6f00">
              <tr>
                <td align="center" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td align="center">&nbsp;</td>
                    </tr>
                  </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td align="center" valign="top" style="background:url(images/20100728wj_xxgk_26.jpg) repeat-x center top;"><table width="100%" border="0" cellspacing="6" cellpadding="0">
                            <tr>
                              <td align="center" valign="top">&nbsp;</td>
                            </tr>
                        </table></td>
                      </tr>
                  </table></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="8"></td>
                </tr>
              </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td align="center" valign="middle"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#df6f00">
                    <tr>
                      <td align="center" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="25" align="center" bgcolor="#F2F2F2">重点领域信息公开</td>
                          </tr>
                        </table>
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td align="center" valign="top" ><table width="100%" border="0" cellspacing="5" cellpadding="0">
                                  <tr>
                                    <td align="center" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#ffe7cc">
                                        <tr>
                                          <td height="22" align="center" bgcolor="#FFFFFF"><a href="http://www.lsz.gov.cn/xxgk-msgc">民生工程</a> </td>
                                          <td align="center" bgcolor="#FFF6ED"><a href="http://www.lsz.gov.cn/xxgk-fpgc">扶贫工程</a></td>
                                          <td align="center" bgcolor="#FFFFFF"><a href="http://www.lsz.gov.cn/xxgk-zhcj/">灾后重建</a></td>
                                        </tr>
                                        <tr>
                                          <td height="22" align="center" bgcolor="#FFFFFF"><a href="http://www.lsz.gov.cn/xxgk/2746/1/23">移民安置</a></td>
                                          <td align="center" bgcolor="#FFF6ED"><a href="http://www.lsz.gov.cn/xxgk-tagchildinfo/3941/1/11">教育助学</a></td>
                                          <td align="center" bgcolor="#FFFFFF"><a href="http://www.lsz.gov.cn/xxgk-tagchildinfo/3943/1/11">医疗卫生</a></td>
                                        </tr>
                                        <tr>
                                          <td height="22" align="center" bgcolor="#FFFFFF"><a href="http://www.lsz.gov.cn/xxgk-tagchildinfo/3942/1/11">社会保障</a></td>
                                          <td align="center" bgcolor="#FFF6ED"><a href="http://www.lsz.gov.cn/xxgk-tagchildinfo/3938/1/11">促进就业</a></td>
                                          <td align="center" bgcolor="#FFFFFF"><a href="http://www.lsz.gov.cn/xxgk-tagchildinfo/3944/1/11">住房保障</a></td>
                                        </tr>
                                        <tr>
                                          <td height="22" align="center" bgcolor="#FFFFFF"><a href="http://www.lsz.gov.cn/xxgk-tagchildinfo/3946/1/5">生态环境</a></td>
                                          <td align="center" bgcolor="#FFF6ED"><a href="http://www.lsz.gov.cn/2010zt-znhn">惠农政策</a></td>
                                          <td align="center" bgcolor="#FFFFFF"><a href="http://www.lsz.gov.cn/xxgk/3996">节能减排</a></td>
                                        </tr>
                                        <tr>
                                          <td height="22" align="center" bgcolor="#FFFFFF"><a href="http://www.lsz.gov.cn/xxgk/4065">捐赠救助</a></td>
                                          <td align="center" bgcolor="#FFF6ED"><a href="http://lsygdz.lsz.gov.cn/">以工代赈</a></td>
                                          <td align="center" bgcolor="#FFFFFF">&nbsp;</td>
                                        </tr>
                                        <tr>
                                          <td height="22" colspan="3" align="left" bgcolor="#FFFFFF">&nbsp;<a href="http://www.lsz.gov.cn/xxgk-msgc/3994">城乡环境治理</a>&nbsp;<a href="http://www.lsz.gov.cn/2010zt-gbb">“挂帮包”活动</a></td>
                                        </tr>
                                        <tr>
                                          <td height="22" colspan="3" align="center" bgcolor="#FFFFFF"><div align="left">&nbsp;<a href="http://www.lsz.gov.cn/xxgk/4098/1/24">新农合</a>　　　　<a href="http://www.lsz.gov.cn/xxgk/4099/1/40">新农保</a></div></td>
                                        </tr>
                                        <tr>
                                          <td height="22" colspan="3" align="center" bgcolor="#FFFFFF"><div align="left">&nbsp;<a href="http://www.lsz.gov.cn/2010zt-xsh">彝区健康文明新生活运动</a></div></td>
                                        </tr>
                                    </table></td>
                                  </tr>
                              </table></td>
                            </tr>
                        </table></td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td align="center" valign="middle">&nbsp;</td>
                </tr>
                <tr>
                  <td align="center" valign="middle"><a href="http://www.lsz.gov.cn/xxgk-2011zfgb-2011-1" target="_blank"><img src="images/zhfugb.gif" width="169" height="242" border="1" class="zyq" /></a></td>
                </tr>
              </table>            </td>
        </tr>
        
        <tr>
          <td colspan="3" align="center" valign="top">&nbsp;</td>
        </tr>
      </table></td>
    </tr>
  </table>
  <table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr>
      <td height="8" align="center"></td>
    </tr>
  </table>  
  <table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr>
      <td align="center"><table width="990" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center" height="5" bgcolor="#d63600"></td>
        </tr>
        <tr>
          <td align="center"><table width="100%" border="0" cellspacing="10" cellpadding="0">
            <tr>
              <td height="14" align="center" valign="middle"> 主办：凉山彝族自治州人民政府办公室<br />                <br />
承办：凉山州政府信息公开联席会议办公室 技术支持：凉山州信息中心（凉山州人民政府门户网站运行管理中心）<br /><br /></td>
            </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
  </table>
</div>
    </form>
</body>
</html>