<%@ page language="C#" autoeventwireup="true" inherits="_Default, App_Web_yvgvleqn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>四川省政府信息公开</title>
<link href="css/style_xxgk2010.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="http://www.sc.gov.cn/10954/zpGpiJs/gpiTouchDiv.js"></script>
<script type="text/javascript">
    function gotoPage()
    {
        var strpage=document.getElementById("page").value;
      //  alert(strpage);
      var gpiid=document.getElementById("gpiid").value;
      var dept=document.getElementById("dept").value;
      //alert(gpiid+"aaa"+dept);
        window.location.href="default.aspx?p="+strpage+"&gpiid="+gpiid+"&dept="+dept ;
   // alert("default.aspx?p+page+'&gpiid=" + <%=Request["gpiid"] %> + "&dept=" +<%=Request["dept"] %> );
    }
</script>
</head>
<body style="margin:0px;">
    <form id="form1" action="">
    <div align="center">
 <table width="100%" border="0" cellspacing="10" cellpadding="0">
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
                          <a href="t.aspx?i=<%=dr["id"].ToString() %>" target="_blank" title="<%=dr["title"].ToString() %>" id="<%=dr["id"].ToString() %>" onmouseover="showRecordInfo_gpi(this);" onmouseout="removeRecordInfo_gpi(this);" >
                          <%}
                            else if (dr["template"].ToString().Trim().ToLower() == "template05")
                            { %>
                          <a href="t2.aspx?i=<%=dr["id"].ToString() %>" target="_blank" title="<%=dr["title"].ToString() %>" id="A1" onmouseover="showRecordInfo_gpi(this);" onmouseout="removeRecordInfo_gpi(this);" >
                          <%}
                            else
                            {
                                    %>
                                <a href="t3.aspx?i=<%=dr["id"].ToString() %>" target="_blank" title="<%=dr["title"].ToString() %>" id="A2" onmouseover="showRecordInfo_gpi(this);" onmouseout="removeRecordInfo_gpi(this);" >    
                          <%
                              }
                          if(dr["title"].ToString().Length>30)
                            Response.Write(dr["title"].ToString().Substring(0,30)+"...");
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
                                                                                       sqlPage = "共" + Page.ToString() + "页 当前第" + Current.ToString() + "页  <a href=\"#\">首页</a> <a href=\"#\">上一页</a> <a href='default.aspx?p=" + (Current + 1).ToString() + "&gpiid=" + Request["gpiid"] + "&dept=" + Request["dept"] + "'>下一页</a> <a href=\"default.aspx?p=" + Page.ToString() + "&gpiid=" + Request["gpiid"] + "&dept=" + Request["dept"] + "\">尾 页</a>   转到第<input type='text' name='page' id='page' value='" + Current.ToString() + "' maxlength=\"6\" style=\"width:30px;\" ></input>页 <input type='button' value='GO'  onclick='javascript:gotoPage();' /> ";
                                                                                   }
                                                                                   else if (Current > 1 && Current == Page)
                                                                                   {
                                                                                       sqlPage = "共" + Page.ToString() + "页 当前第" + Current.ToString() + "页 <a href='default.aspx?p=1&gpiid=" + Request["gpiid"] + "&dept=" + Request["dept"] + "'>首页</a> <a href='default.aspx?p=" + (Current - 1).ToString() + "&gpiid=" + Request["gpiid"] + "&dept=" + Request["dept"] + "'>上一页</a> <a href=\"#\">下一页</a>  <a href=\"#\">尾 页</a>   转到第<input type='text' value='" + Current.ToString() + "' name='page' id='page' maxlength=\"6\" style=\"width:30px;\"></input>页 <input type='button' value='GO'  onclick='javascript:gotoPage();' />";
                                                                                   }
                                                                                   else
                                                                                       sqlPage = "共" + Page.ToString() + "页 当前第" + Current.ToString() + "页  <a href='default.aspx?p=1&gpiid=" + Request["gpiid"] + "&dept=" + Request["dept"] + "'>首页</a> <a href='default.aspx?p=" + (Current - 1).ToString() + "&gpiid=" + Request["gpiid"] + "&dept=" + Request["dept"] + "'>上一页</a> <a href='default.aspx?p=" + (Current + 1).ToString() + "&gpiid=" + Request["gpiid"] + "&dept=" + Request["dept"] + "'>下一页</a> <a href=\"default.aspx?p=" + Page.ToString() + "&gpiid=" + Request["gpiid"] + "&dept=" + Request["dept"] + "\">尾 页</a>  转到第<input type='text' name='page' id='page' value='" + Current.ToString() + "' maxlength=\"6\" style=\"width:30px;\"></input>页 <input type='button' onclick='javascript:gotoPage();' value='GO' />";
                                                                                   if(sqlPage.Trim().Length>0)
                                                                                       Response.Write(sqlPage);
                                                                               }
                                                                               }
                             %>
                             <input type="hidden" id="gpiid" value="<%=Request["gpiid"] %>" /><input type="hidden" id="dept" value="<%=Request["dept"] %>" />
                             </td>
                          </tr>
                          
                        </table></td>
                    </tr>
                  </table>
</div>
    </form>
</body>
</html>
<%=XML %>