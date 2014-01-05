<%@ page language="C#" autoeventwireup="true" inherits="_Default, App_Web_3qefls9x" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>四川省政府信息公开</title>
<link href="css/style_xxgk2010.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
 <table width="100%" border="0" cellspacing="10" cellpadding="0">
                    <tr>
                      <td align="center" valign="top"><table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#fee4c3">
                        <tr>
                          <td width="40" height="15" align="center" background="images/20100729wj_xxgk_19.jpg" bgcolor="#FFFFFF">序 号</td>
                          <td align="center" background="images/20100729wj_xxgk_19.jpg" bgcolor="#FFFFFF">名 称</td>
                          <td width="90" align="center" background="images/20100729wj_xxgk_19.jpg" bgcolor="#FFFFFF">发文日期</td>
                          <td width="150" align="center" background="images/20100729wj_xxgk_19.jpg" bgcolor="#FFFFFF">文 号</td>
                        </tr>
                        <% if (dt_List != null)
                           {
                               int Number = 1;
                               foreach (System.Data.DataRow dr in dt_List.Rows)
                               {
                                %>
                        <tr>
                          <td height="15" align="center" bgcolor="#FFFFFF"><%=Number.ToString() %></td>
                          <td align="left" bgcolor="#FFFFFF"><a href="t.aspx?i=<%=dr["id"].ToString() %>" target="_blank" title="<%=dr["title"].ToString() %>"><%=dr["title"].ToString() %></a></td>
                          <td align="center" bgcolor="#FFFFFF"><%=Convert.ToDateTime(dr["pubtime"].ToString()).ToString("yyyy年MM月dd日")%></td>
                          <td align="left" bgcolor="#FFFFFF"><%=dr["field5"].ToString()%></td>
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
                                                                                       sqlPage = "上一页 <a href='default.aspx?p=" + (Current + 1).ToString() + "&gpiid=" + Request["gpiid"] + "&dept=" + Request["dept"] + "'>下一页</a>";
                                                                                   }
                                                                                   else if (Current > 1 && Current == Page)
                                                                                   {
                                                                                       sqlPage = "<a href='default.aspx?p=" + (Current - 1).ToString() + "&gpiid=" + Request["gpiid"] + "&dept=" + Request["dept"] + "'>上一页</a> 下一页";
                                                                                   }
                                                                                   else
                                                                                       sqlPage = "<a href='default.aspx?p=" + (Current - 1).ToString() + "&gpiid=" + Request["gpiid"] + "&dept=" + Request["dept"] + "'>上一页</a> <a href='default.aspx?p=" + (Current + 1).ToString() + "&gpiid=" + Request["gpiid"] + "&dept=" + Request["dept"] + "'>下一页</a>";
                                                                                   if(sqlPage.Trim().Length>0)
                                                                                       Response.Write(sqlPage);
                                                                               }
                                                                               }
                             %></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table>
</div>
    </form>
</body>
</html>
