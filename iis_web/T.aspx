<%@ page language="C#" autoeventwireup="true" inherits="T, App_Web_2o_elkko" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%
    if (System.Configuration.ConfigurationManager.ConnectionStrings["GPItitle"] != null)
        Response.Write(ConfigurationManager.ConnectionStrings["GPItitle"].ConnectionString);
    else
        Response.Write("四川省政府信息公开");
        
 %></title>

<style type="text/css">
@charset "utf-8";
/* CSS Document */

*{
	margin:0px;
	}
body{
		font-size:12px;
		font-family:"瀹嬩綋";
		color:#4e4342;
		background:url(../images/20100728wj_xxgk_01.jpg)
		}
a img{
		border:0px;
		}
a{
	color:#4e4342;
	text-decoration:none;
	}
a:hover{
		color:#FF3300;
		text-decoration:underline;
		}
ul,li{
		list-style:none;
		}
.xxgkH12{
			color:#9a0c01;
			}
.xxgkInput{
			width:95px;
			}
.xxgkButton{
			background:url(../images/20100728wj_xxgk_37.jpg) no-repeat center;
			width:75px;
			height:20px;
			line-height:20px;
			color:#4b84ba;
			font-size:12px;
			border:0px;
			}
.xxgkC12{
			color:#da5a01;
			font-size:12px;
			font-weight:bold;
			}
.xxgkC12 a{
			color:#da5a01;
			text-decoration:none;
			}
.xxgkC12 a:hover{
			color:#da5a01;
			text-decoration:underline;
			}
.xxgkHg{
		line-height:20px;
		}
.xxgkPl_1{
			background:url(../images/20100728wj_xxgk_75.jpg) no-repeat center;
			color:#FFFFFF;
			font-size:10px;
			font-weight:bold;
			width:15px;
			height:11px;
			}
.xxgkPl_2{
			background:url(../images/20100728wj_xxgk_79.jpg) no-repeat center;
			color:#FFFFFF;
			font-size:10px;
			font-weight:bold;
			width:15px;
			height:11px;
			}
.xxgkXx{
			background:url(../images/20100728wj_xxgk_32.jpg) repeat-x center bottom;
			}
.xxgk_H14c{
		color:#a11700;
		font-size:14px;
		font-weight:bold;
		}
		
.leftnav {
	BACKGROUND:url(../images/readnav01.jpg) no-repeat; WIDTH: 199px;  border:#cecccc 1px solid;  
}

.mainnav {
	CLEAR: both; PADDING-BOTTOM: 1px; WIDTH: 199px; background:#FFFFFF;
}
.mainnav H3 {
	PADDING-RIGHT: 0px; FONT-SIZE: 14px; BACKGROUND: url(../images/bsfw_sy_15.jpg) repeat-x; MARGIN: 0px auto; CURSOR: pointer; color:#b72f01; HEIGHT: 30px; width:199px; border-bottom:#cbcbcb 1px solid;  border-top:#cbcbcb 1px solid;
}
.mainnav H3 IMG {
	MARGIN-RIGHT: 7px
}
.mainnav UL {
 DISPLAY: none; background:url(../images/bsfw_sy_22.jpg) repeat-x top; font-size:12px; width:197px; border:1px #FFFFFF solid;
}
.mainnav UL LI {
	 LINE-HEIGHT:26px; padding-left:10px; text-align:left;
}
.mainnav UL LI A {
	 TEXT-DECORATION: none
}
.mainnav UL LI A:hover {
	COLOR:#FF3300; TEXT-DECORATION: underline
}


.leftnav_1 {
	BACKGROUND:url(../images/readnav01.jpg) no-repeat; WIDTH: 165px; 
}

.mainnav_1 {
	CLEAR: both; PADDING-BOTTOM: 1px; WIDTH: 165px; 
}
.mainnav_1 H3 {
	PADDING-RIGHT: 0px; FONT-SIZE: 14px; BACKGROUND:url(../images/20100730wj_xxgk_13.jpg) repeat-x; MARGIN: 0px auto; CURSOR: pointer; color:#b72f01; HEIGHT: 26px; width:165px; 
}
.mainnav_1 H3 IMG {
	MARGIN-RIGHT: 7px
}
.mainnav_1 UL {
 DISPLAY: none; background:#fff6ed; font-size:12px; width:163px;
}
.mainnav_1 UL LI {
	 LINE-HEIGHT:26px;  text-align:left; width:100px; margin:0 auto;
	  }
.mainnav_1 UL LI A {
	 TEXT-DECORATION: none
}
.mainnav_1 UL LI A:hover {
	COLOR:#FF3300; TEXT-DECORATION: underline
}


.xxgk_hong14{
			color:#b72f01;
			font-size:14px;
			font-weight:bold;
			}

.xxgk_nav14{
			font-size:14px;
			color:#b72f01;
			font-weight:bold;
			filter:
        Dropshadow(offx=1,offy=0,color=#ffffff)
        Dropshadow(offx=0,offy=1,color=#ffffff)
        Dropshadow(offx=0,offy=-1,color=#ffffff)
        Dropshadow(offx=-1,offy=0,color=#ffffff);
			}
.xxgk_nav14 a{
			color:#b72f01;
			text-decoration:none;
			filter:
        Dropshadow(offx=1,offy=0,color=#ffffff)
        Dropshadow(offx=0,offy=1,color=#ffffff)
        Dropshadow(offx=0,offy=-1,color=#ffffff)
        Dropshadow(offx=-1,offy=0,color=#ffffff);
			}
.xxgk_nav14 a:hover{
			color:#b72f01;
			text-decoration:underline;
			filter:
        Dropshadow(offx=1,offy=0,color=#ffffff)
        Dropshadow(offx=0,offy=1,color=#ffffff)
        Dropshadow(offx=0,offy=-1,color=#ffffff)
        Dropshadow(offx=-1,offy=0,color=#ffffff);
			}
.xxgk_bai14{
			color:#FFFFFF;
			font-size:14px;
			text-decoration:none;
			}
.xxgk_bai14 a{
			color:#FFFFFF;
			text-decoration:none;
			}
.xxgk_bai14 a:hover{
			color:#FFFFFF;
			text-decoration:underline;
			}
.xxgk_Fh{
		color:#fbf052;
		font-size:30px;
		font-family:"榛戜綋";
		letter-spacing:15px;
			filter:
        Dropshadow(offx=1,offy=0,color=#9a0c01)
        Dropshadow(offx=0,offy=1,color=#9a0c01)
        Dropshadow(offx=0,offy=-1,color=#9a0c01)
        Dropshadow(offx=-1,offy=0,color=#9a0c01);
		}
.xxgk_nav14H{
			font-size:14px;
			color:#4e4342;
			font-weight:bold;
			float:left; 
			width:138px; 
			text-align:center; 
			line-height:26px;
			filter:
        Dropshadow(offx=1,offy=0,color=#ffffff)
        Dropshadow(offx=0,offy=1,color=#ffffff)
        Dropshadow(offx=0,offy=-1,color=#ffffff)
        Dropshadow(offx=-1,offy=0,color=#ffffff);
			}
.xxgk_nav14H a{
			color:#4e4342;
			text-decoration:none;
			filter:
        Dropshadow(offx=1,offy=0,color=#ffffff)
        Dropshadow(offx=0,offy=1,color=#ffffff)
        Dropshadow(offx=0,offy=-1,color=#ffffff)
        Dropshadow(offx=-1,offy=0,color=#ffffff);
			}
.xxgk_nav14H a:hover{
			color:#4e4342;
			text-decoration:underline;
			filter:
        Dropshadow(offx=1,offy=0,color=#ffffff)
        Dropshadow(offx=0,offy=1,color=#ffffff)
        Dropshadow(offx=0,offy=-1,color=#ffffff)
        Dropshadow(offx=-1,offy=0,color=#ffffff);
			}
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
  <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr>
      <td align="center"><table width="890" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" background="images/20100728wj_xxgk_04.jpg"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td align="left">四川省政府门户网   &nbsp;&nbsp;繁体版   &nbsp;&nbsp;简体版</td>
              <td align="right">2010年7月13日 &nbsp;&nbsp;星期二</td>
            </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
  </table>
  <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr>
      <td height="160" align="right" style="background:url(images/20100728wj_xxgk_02.jpg) no-repeat center;"><table width="75%" border="0" cellpadding="0" cellspacing="0" class="xxgk_Fh">
        <tr>
          <td align="left" class="xxgk_Fh"><%=departName%></td>
        </tr>
        <tr>
          <td height="80">&nbsp;</td>
        </tr>
      </table></td>
    </tr>
  </table>
  <table width="900" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr>
      <td><table width="890" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="16" background="images/20100728wj_xxgk_11.jpg">&nbsp;</td>
        </tr>
      </table></td>
    </tr>
  </table>  
  <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr>
      <td align="center"><table width="890" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="8" align="center" valign="top">&nbsp;</td>
          <td align="center" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#b8b8b8">
                <tr>
                  <td height="28" align="left" background="images/20100730wj_xxgk_17.jpg" bgcolor="#FFFFFF">&nbsp;&nbsp;<span class="xxgkH12"><strong>当前位置：</strong></span><%=ChannelFullName %></td>
                </tr>
                <tr>
                  <td align="center" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="10" cellpadding="0">
                    <tr>
                      <td align="center" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#d9ae89">
                        <tr>
                          <td align="center" valign="middle" bgcolor="#ffebd6"><table width="100%" border="0" cellpadding="0" cellspacing="8" class="xxgkHg">
                            <tr>
                              <td width="30%" align="left"><strong>索 引 号：</strong><%=IndexNo%></td>
                              <td width="30%" align="left"><strong>主题分类：</strong><%=CateGory %></td>
                              <td width="30%" align="left"><strong>发布机构：</strong><%=publisher %></td>
                            </tr>
                            <tr>
                              <td width="30%" align="left"><strong>发布日期：</strong><%Response.Write(new List().getCurrentTime(CodeId, pubtime));%></td>
                              <td width="30%" align="left"><strong>文&nbsp;&nbsp;&nbsp;&nbsp;号：</strong><%=FileNo %></td>
                              <td width="30%" align="left"><strong>关 键 词：</strong><%=keys %></td>
                            </tr>
                          </table></td>
                        </tr>
                      </table>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td>&nbsp;</td>
                          </tr>
                        </table>  
                        <table width="100%" border="0" cellpadding="8" cellspacing="1" bgcolor="#d9ae89">
                          <tr>
                            <td align="center" valign="middle" bgcolor="#fff5ea"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#ffebd5">
                              <tr>
                                <td align="center" bgcolor="#FFFFFF"><table width="94%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td height="50" align="center" style="color:#c80000; font-size:22px; font-weight:bold;"><%=title %> </td>
                                  </tr>
                                  <tr>
                                    <td height="30" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td background="images/20100728wj_xxgk_32.jpg" height="1"></td>
                                      </tr>
                                    </table></td>
                                  </tr>
                                  <tr>
                                    <td align="left" style="line-height:14px; line-height:24px; font-size:14px;">
                                    <%=Content %>
                                    </td>
                                  </tr>
                                </table>
                                  <table width="94%" border="0" cellpadding="0" cellspacing="1" bgcolor="#e3bf9d">
                                    <tr>
                                      <td height="26" align="left" bgcolor="#fff5eb" class="xxgkH12">&nbsp;<strong>附件：</strong></td>
                                    </tr>
                                    <tr>
                                      <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="8" cellpadding="0">
                                        <tr>
                                          <td align="left"><%=Accessories %></td>
                                        </tr>
                                      </table></td>
                                    </tr>
                                  </table>
                                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td>&nbsp;</td>
                                    </tr>
                                  </table></td>
                              </tr>
                            </table></td>
                          </tr>
                        </table>
                        </td>
                    </tr>
                  </table></td>
                </tr>
              </table>
            </td>
        </tr>
        
      </table></td>
    </tr>
  </table>
  <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr>
      <td height="8"></td>
    </tr>
  </table>  
  <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr>
      <td align="center"><table width="890" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center" height="5" bgcolor="#d63600"></td>
        </tr>
        <tr>
          <td align="center"><table width="100%" border="0" cellspacing="10" cellpadding="0">
            <tr>
              <td height="14" align="center" valign="middle" style="line-height:24px;">Copyright 2009 www.sc.gov.cn All Rights Reserved <br />
                四川省人民政府网站 网站声明 | 网站地图 | 联系我们 | 主编信箱<br />
                版权所有：四川省人民政府办公厅<br />
                技术支持：四川电信 网站维护：四川省电子政务外网运营中心 联系电话: (028)86190174<br />
                蜀 ICP 备05030899号</td>
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
