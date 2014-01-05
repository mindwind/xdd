<%@ page language="C#" autoeventwireup="true" inherits="GPI_index, App_Web_a24_yvdv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
<META HTTP-EQUIV="Cache-Control" CONTENT="no-store, must-revalidate"> 
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT"> 
<META HTTP-EQUIV="expires" CONTENT="0"> 
<title><%
    if (System.Configuration.ConfigurationManager.ConnectionStrings["GPItitle"] != null)
        Response.Write(ConfigurationManager.ConnectionStrings["GPItitle"].ConnectionString);
    else
        Response.Write("信息填报目录");
        
 %></title>
<script language="javascript" type="text/javascript" src="../js/gpiTouchDiv.js"></script>
<link href="../css/style_xxgk2010.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    function gotoPage()
    {
        var strpage=document.getElementById("page").value;
      //  alert(strpage);
      var gpiid=document.getElementById("gpiid").value;
      var dept=document.getElementById("dept").value;
      //alert(gpiid+"aaa"+dept);
        window.location.href="index.aspx?p="+strpage+"&gpiid="+gpiid+"&dept="+dept ;
   // alert("default.aspx?p+page+'&gpiid=" + <%=Request["gpiid"] %> + "&dept=" +<%=Request["dept"] %> );
    }
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
  <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr>
      <td align="center"><table width="890" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" background="../images/20100728wj_xxgk_04.jpg"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td align="left">四川省政府门户网   &nbsp;&nbsp;繁体版   &nbsp;&nbsp;简体版</td>
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
  <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr>
      <td height="160" align="right" style="background:url(../images/20100728wj_xxgk_02.jpg) no-repeat center;"><table width="75%" border="0" cellpadding="0" cellspacing="0" class="xxgk_Fh">
        <tr>
          <td align="left" class="xxgk_Fh"><%=DeptName %></td>
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
          <td height="16" background="../images/20100728wj_xxgk_11.jpg">&nbsp;</td>
        </tr>
      </table></td>
    </tr>
  </table>  
  <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr>
      <td align="center"><table width="890" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="199" align="center" valign="top">
            <!--产看类目-->
            <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#B8B8B8">
                <tr>
                  <td height="8" bgcolor="#FFFFFF"><script language="javascript" type="text/javascript">
function showChilds_zfxxgk(obj)
{
	var childObj = obj.parentNode.getElementsByTagName("div")[0];
	if(childObj.style.display == "none")
	{
		childObj.style.display = "block";
		obj.getElementsByTagName("img")[0].src = "../images/-.jpg";
	}
	else
	{
		childObj.style.display = "none";
		obj.getElementsByTagName("img")[0].src = "../images/a.jpg";
	}
}

function searchContent()
{
	if(document.all.title.value.replace(new RegExp(" ", "gim"), "") == ""
		&& document.all.askCode.value.replace(new RegExp(" ", "gim"), "") == "")
	{
		alert("标题和索取号不能同时为空！");
		return;
	}
	window.open("../Search.aspx?title=" + escape(document.all.title.value) + "&askCode=" + escape(document.all.askCode.value));
}

//generateTree_zfxxgk();
</script>
<div id="gpiDeptColumnTree">
<table width="100%" border="0" cellspacing="0" cellpadding="0" background="../images/bsfw_sy_15.jpg">
<tr>
<td width="35"><span style="float:left; width:35px;"><img src="../images/bsfw_sy_14.jpg" alt="" name="sqfw" id="sqfw2" /></span></td>
<td align="center" valign="top"><span style="float:left; margin-top:10px;font-weight:bolder;color:#B72F01;font-size:14px;">查看类目</span></td>
<td width="44"><span style="float:right;"><img src="../images/bsfw_sy_17.jpg" width="44" height="30" /></span></td>
</tr>
</table><table><tr><td></td></tr></table>

<div align="left" style="line-height:20px;"><%
    if(Request["dept"]!=null)
        Response.Write(new Channel().GetUnitChannel(Request["dept"].Trim()));
    else
        Response.Write(new Channel().GetUnitChannel("6"));
 %></div>
</div>
</td>
                </tr>
              </table>
            <!--产看类目-->
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="8"></td>
                </tr>
            </table></td>
          <td width="8" align="center" valign="top">&nbsp;</td>
          <td align="center" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#e2bf9d">
                <tr>
                  <td height="28" bgcolor="#fff5ea"><table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="420" align="left" valign="middle">&nbsp;&nbsp;&nbsp;&nbsp;<strong>搜索：</strong> 标题&nbsp;&nbsp;
                          <input name="title" type="text" class="xxgkInput" id="title" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;索取号
                        <input name="askCode" type="text" class="xxgkInput" id="askCode" /></td>
                      <td width="50" align="left" valign="middle"><img src="../images/20100728wj_xxgk_03.jpg" style="cursor:pointer;" onclick="javascript:searchContent();" width="35" height="18" /></td>
                      <td align="left" valign="middle" style="display:none;"><input name="button2" type="submit" class="xxgkButton" id="button2" value="   高级搜索" /></td>
                    </tr>
                  </table></td>
                </tr>
              </table>  
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="8"></td>
                </tr>
              </table>            
              <table width="100%" border="0" cellspacing="10" cellpadding="0">
              <tr>
                  <td height="28" align="left" background="../images/20100730wj_xxgk_17.jpg" bgcolor="#FFFFFF">&nbsp;&nbsp;<span class="xxgkH12"><strong>当前位置：</strong></span><%=DeptName %></td>
                </tr>
                    <tr>
                      <td align="center" valign="top"><table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#fee4c3">
                        <tr>
                          <td width="40" height="15" align="center" background="images/20100729wj_xxgk_19.jpg" style="color:#d30000">序 号</td>
                          <td align="center" background="images/20100729wj_xxgk_19.jpg"  style="color:#d30000">名 称</td>
                          <td width="90" align="center" background="images/20100729wj_xxgk_19.jpg" style="color:#d30000">发布日期</td>
                          <td width="150" align="center" background="images/20100729wj_xxgk_19.jpg" style="color:#d30000">文 号</td>
                        </tr>
                        <% if (dt_List != null)
                           {
                               int Number = 1;
                               foreach (System.Data.DataRow dr in dt_List.Rows)
                               {
                                %>
                        <tr>
                          <td height="15" align="center" style="color:#d30000" bgcolor="#ffffff"><%=Number.ToString() %></td>
                          <td align="left" style="color:#d30000"  bgcolor="#ffffff">
                          <%if(dr["template"].ToString().Trim().ToLower()=="template01")
                            { %>
                          <a href="../t.aspx?i=<%=dr["id"].ToString() %>" target="_blank" title="<%=dr["title"].ToString() %>" id="<%=dr["id"].ToString() %>" onmouseover="showRecordInfo_gpi(this);" onmouseout="removeRecordInfo_gpi(this);" >
                          <%}
                            else if (dr["template"].ToString().Trim().ToLower() == "template05")
                            { %>
                          <a href="../t2.aspx?i=<%=dr["id"].ToString() %>" target="_blank" title="<%=dr["title"].ToString() %>" id="A1" onmouseover="showRecordInfo_gpi(this);" onmouseout="removeRecordInfo_gpi(this);" >
                          <%}
                            else
                            {
                                    %>
                                <a href="../t3.aspx?i=<%=dr["id"].ToString() %>" target="_blank" title="<%=dr["title"].ToString() %>" id="A2" onmouseover="showRecordInfo_gpi(this);" onmouseout="removeRecordInfo_gpi(this);" >    
                          <%
                              }
                          if(dr["title"].ToString().Length>26)
                            Response.Write(dr["title"].ToString().Substring(0,26)+"...");
                            else
                            Response.Write(dr["title"].ToString());
                           %></a></td>
                          <td align="center" style="color:#d30000"  bgcolor="#ffffff"><%Response.Write(new List().getCurrentTime(dr["id"].ToString(), Convert.ToDateTime(dr["pubtime"].ToString()).ToString("yyyy-MM-dd")));%></td>
                          <td align="left" style="color:#d30000"  bgcolor="#ffffff"><%=dr["code"].ToString()%></td>
                        </tr>
                        <%
                            Number += 1;
                            }
                        }
                         %>
                        
                      </table>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="30" align="center" valign="middle" style="color:#000000" ><%
                                                                               if(dt_List!=null&&dt_List.Rows.Count>0)
                                                                               {
                                                                               if (dt_page != null && dt_page.Rows.Count > 0)
                                                                               {
                                                                                   string sqlPage = "";
                                                                                   int Page = 0;
                                                                                   if (dt_page.Rows.Count % 15 == 0)
                                                                                   {
                                                                                       Page = dt_page.Rows.Count / 15;
                                                                                   }
                                                                                   else
                                                                                       Page = dt_page.Rows.Count / 15 + 1;

                                                                                   int Current = 1;
                                                                                   if (Request["p"] != null)
                                                                                   {
                                                                                       try {
                                                                                           Current = Convert.ToInt32(Request["p"].Trim());
                                                                                       }
                                                                                       catch { }
                                                                                   }

                                                                                   if (Current == 1 && Current < Page)
                                                                                   {
                                                                                       sqlPage = "共" + Page.ToString() + "页 当前第" + Current.ToString() + "页  <a href=\"#\">首页</a> <a href=\"#\">上一页</a> <a href='index.aspx?p=" + (Current + 1).ToString() + "&gpiid=" + Request["gpiid"] + "&dept=" + Request["dept"] + "'>下一页</a> <a href=\"index.aspx?p=" + Page.ToString() + "&gpiid=" + Request["gpiid"] + "&dept=" + Request["dept"] + "\">尾 页</a>   转到第<input type='text' name='page' id='page' value='" + Current.ToString() + "' maxlength=\"6\" style=\"width:30px;\" ></input>页 <input type='button' value='GO'  onclick='javascript:gotoPage();' /> ";
                                                                                   }
                                                                                   else if (Current > 1 && Current == Page)
                                                                                   {
                                                                                       sqlPage = "共" + Page.ToString() + "页 当前第" + Current.ToString() + "页 <a href='index.aspx?p=1&gpiid=" + Request["gpiid"] + "&dept=" + Request["dept"] + "'>首页</a> <a href='index.aspx?p=" + (Current - 1).ToString() + "&gpiid=" + Request["gpiid"] + "&dept=" + Request["dept"] + "'>上一页</a> <a href=\"#\">下一页</a>  <a href=\"#\">尾 页</a>   转到第<input type='text' value='" + Current.ToString() + "' name='page' id='page' maxlength=\"6\" style=\"width:30px;\"></input>页 <input type='button' value='GO'  onclick='javascript:gotoPage();' />";
                                                                                   }
                                                                                   else
                                                                                       sqlPage = "共" + Page.ToString() + "页 当前第" + Current.ToString() + "页  <a href='index.aspx?p=1&gpiid=" + Request["gpiid"] + "&dept=" + Request["dept"] + "'>首页</a> <a href='index.aspx?p=" + (Current - 1).ToString() + "&gpiid=" + Request["gpiid"] + "&dept=" + Request["dept"] + "'>上一页</a> <a href='index.aspx?p=" + (Current + 1).ToString() + "&gpiid=" + Request["gpiid"] + "&dept=" + Request["dept"] + "'>下一页</a> <a href=\"index.aspx?p=" + Page.ToString() + "&gpiid=" + Request["gpiid"] + "&dept=" + Request["dept"] + "\">尾 页</a>  转到第<input type='text' name='page' id='page' value='" + Current.ToString() + "' maxlength=\"6\" style=\"width:30px;\"></input>页 <input type='button' onclick='javascript:gotoPage();' value='GO' />";
                                                                                   if(sqlPage.Trim().Length>0)
                                                                                       Response.Write(sqlPage);
                                                                               }
                                                                               }
                             %>
                             <input type="hidden" id="gpiid" value="<%=Request["gpiid"] %>" /><input type="hidden" id="dept" value="<%=Request["dept"] %>" />
                             </td>
                          </tr>
                          
                        </table>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="8"></td>
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
              <td height="14" align="center" valign="middle">主办：凉山彝族自治州人民政府办公室<br />
                <br />
承办：凉山州政府信息公开联席会议办公室 技术支持：凉山州信息中心（凉山州人民政府门户网站运行管理中心）</td>
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

<%=XML %>
