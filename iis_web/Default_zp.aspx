<%@ page language="C#" autoeventwireup="true" inherits="_Default, App_Web_2o_elkko" %>


<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>四川省政府信息公开</title>
<link href="css/style_xxgk2010.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="http://125.64.4.179/10954/zpGpiJs/gpiTouchDiv.js"></script>
<style type="text/css">
    td{font-size:12px;}
    a{font-size:12px;}
</style>
</head>
<body style="margin:0px;">
    <form id="form1" runat="server">
    <div align="center">
 <table width="100%" border="0" cellspacing="10" cellpadding="0">
                    <tr>
                      <td align="center" valign="top"><table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#fee4c3">
                        <tr>
                          <td width="40" height="15" align="center" background="images/20100729wj_xxgk_19.jpg" style="color:#d30000">序 号</td>
                          <td align="center" background="images/20100729wj_xxgk_19.jpg"  style="color:#d30000">名 称</td>
                          <td width="90" align="center" background="images/20100729wj_xxgk_19.jpg" style="color:#d30000">发文日期</td>
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
                          <a href="t.aspx?i=<%=dr["id"].ToString() %>" target="_blank" id="<%=dr["id"].ToString() %>" onmouseover="showRecordInfo_gpi(this);" onmouseout="removeRecordInfo_gpi(this);">
                          <%}
                          else{ %>
                          <a href="t2.aspx?i=<%=dr["id"].ToString() %>" target="_blank" id="<%=dr["id"].ToString() %>" onmouseover="showRecordInfo_gpi(this);" onmouseout="removeRecordInfo_gpi(this);">
                          <%} %>
                          <%
                          if(dr["title"].ToString().Length>30)
                            Response.Write(dr["title"].ToString().Substring(0,30)+"...");
                            else
                            Response.Write(dr["title"].ToString());
                           %></a></td>
                          <td align="center" style="color:#d30000"  bgcolor="#ffffff"><%=Convert.ToDateTime(dr["pubtime"].ToString()).ToString("yyyy-MM-dd")%></td>
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
                            <td height="30" align="center" valign="middle"><%
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
                                                                                       sqlPage = "<a href=\"#\">上一页</a> <a href='default.aspx?p=" + (Current + 1).ToString() + "&gpiid=" + Request["gpiid"] + "&dept=" + Request["dept"] + "'>下一页</a>";
                                                                                   }
                                                                                   else if (Current > 1 && Current == Page)
                                                                                   {
                                                                                       sqlPage = "<a href='default.aspx?p=" + (Current - 1).ToString() + "&gpiid=" + Request["gpiid"] + "&dept=" + Request["dept"] + "'>上一页</a> <a href=\"javascript:void();\">下一页</a>";
                                                                                   }
                                                                                   else
                                                                                       sqlPage = "<a href='default.aspx?p=" + (Current - 1).ToString() + "&gpiid=" + Request["gpiid"] + "&dept=" + Request["dept"] + "'>上一页</a> <a href='default.aspx?p=" + (Current + 1).ToString() + "&gpiid=" + Request["gpiid"] + "&dept=" + Request["dept"] + "'>下一页</a>";
                                                                                   if(sqlPage.Trim().Length>0)
                                                                                       Response.Write(sqlPage);
                                                                               }
                                                                               }
                             %></td>
                          </tr>
                          <tr>
                            <td align="center">
                               <a href="http://www.sc.gov.cn/scszfxxgkml_2/" style="color:#d30000;" target="_blank"><b>查看2011年3月18日前历史数据 >></b></a>
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                  </table>
</div>
    </form>
    <%=XML %>
</body>
</html>
