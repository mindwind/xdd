<%@ page language="C#" autoeventwireup="true" inherits="GPI_Search, App_Web_yvgvleqn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%
    if (System.Configuration.ConfigurationManager.ConnectionStrings["GPItitle"] != null)
        Response.Write(ConfigurationManager.ConnectionStrings["GPItitle"].ConnectionString);
    else
        Response.Write("��Ϣ�Ŀ¼");
        
 %></title>
<link href="css/style_xxgk2010.css" rel="stylesheet" type="text/css" /></head>
<script language="javascript" type="text/javascript" src="js/gpiTouchDiv.js"></script>
<body>
    <form id="form1" runat="server">
    <div align="center">
  <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr>
      <td align="center"><table width="890" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" background="images/20100728wj_xxgk_04.jpg"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td align="left">�Ĵ�ʡ�����Ż���   &nbsp;&nbsp;�����   &nbsp;&nbsp;�����</td>
              <td align="right"><script language="JavaScript" type="text/javascript">

                                var today = new Date();
                                function initArray() {
                                    this.length = initArray.arguments.length;
                                    for (var i = 0; i < this.length; i++) this[i + 1] = initArray.arguments[i]
                                }
                                var d = new initArray("������", "����һ", "���ڶ�", "������", "������", "������", "������");
                                document.write("<font color=\"#626262\" class=\"h12xgao24\"> ", today.getYear(), "��", today.getMonth() + 1, "��", today.getDate(), "��", "&nbsp;", d[today.getDay() + 1], "</font>");
                            </script></td>
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
          <td align="left" class="xxgk_Fh"></td>
        </tr>
        <tr>
          <td height="80">&nbsp;</td>
        </tr>
      </table></td>
    </tr>
  </table>
  <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr>
      <td align="center"><table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="200" align="center" valign="top">
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td align="center" valign="middle">
				  <script src="scripts/lefttree_bs.js" type="text/javascript"></script>
                      <div class="leftnav">
                        <div class="mainnav"><span id="menu">
                          <h3 id="menu1">
                            <div style="float:left; width:35px;"><img src="images/bsfw_sy_14.jpg" alt="" name="sqfw" id="sqfw" /></div>
                            <div style="float:left; margin-top:10px;">���������</div>
                            <div style="float:right; "><img src="images/bsfw_sy_17.jpg" width="44" height="30" /></div>
                          </h3>
    <ul>
                            <div style="height:8px;">&nbsp;</div>
                            <script language="javascript" type="text/javascript">
function generateTree_zfxxgk_leftBottom()
{

	var obj = new ActiveXObject("Microsoft.XMLHTTP"), re = new RegExp("(\\(|��).*(��|\\))|[0-9a-z]", "gim");
	obj.open("get", "Config/gpiColumns.xml", false);
	obj.send();
	var doc = obj.responseXML.selectNodes("root/column/column"), str = "", name = "", img = "", columnId = "";
	for(var i = 0; i < doc.length; i++)
	{
		var childs = getChildColumn_zfxxgk_leftBottom(doc[i], 2);
		name = doc[i].selectSingleNode("@name").text;
		columnId = doc[i].selectSingleNode("@id").text;
		name = "<a href=\"www.sc.gov.cn/10954/gpiSearch/Search.shtml?columnId=" + columnId + "\">" + name.replace(re, "") + "</a>";
		if(childs != "") img = "<span style=\"cursor:pointer;\" onclick=\"showChilds_zfxxgk_leftBottom(this);\"><img src=\"images/+.jpg\" alt=\"\" /></span> ";
		else img = "<span style=\"cursor:pointer;\"><img src=\"images/-.jpg\" alt=\"\" /></span> ";
		str += "<div>\r\n" + img + name + "\r\n" + childs + "</div>\r\n";
	}
//	document.write("<div align=\"left\" style=\"overflow:auto;\">" + str + "</div>");
	//alert(str);
}

function getChildColumn_zfxxgk_leftBottom(doc, level)
{
	var str = "", re = new RegExp("(\\(|��).*(��|\\))|[0-9a-z]", "gim");
	var columns = doc.selectNodes("column");
	if(columns.length > 0)
	{
		str = "<div style=\"display:none;\";>\r\n";
		for(var i = 0; i < columns.length; i++)
		{
			var childs = getChildColumn_zfxxgk_leftBottom(columns[i], level + 1), img = "&nbsp;&nbsp;"
				, columnName = columns[i].selectSingleNode("@name").text, space = ""
				, columnId = columns[i].selectSingleNode("@id").text;
			if(childs != "") img = "<span style=\"cursor:pointer;\" onclick=\"showChilds_zfxxgk_leftBottom(this);\"><img src=\"images/+.jpg\" alt=\"\" /></span> ";
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
		obj.getElementsByTagName("img")[0].src = "images/+.jpg";
	}
}

//generateTree_zfxxgk_leftBottom();

</script>
  <%=new Channel().GetAllChannel() %>
                          </ul>
                          <h3 id="menu2">
                            <div style="float:left; width:35px;"><img alt="" src="images/bsfw_sy_14.jpg" id="Img1" /></div>
                            <div style="float:left; margin-top:10px;">����÷���</div>
                            <div style="float:right; "><img src="images/bsfw_sy_17.jpg" width="44" height="30" /></div>
                          </h3>
                          <ul>
                            <div style="height:8px;">&nbsp;</div>
							<div align="left" style="line-height:20px;">
                            <div><a href="#" onclick="this.href='Search.aspx?columnName=' + escape('����');">����</a></div>
<div><a href="#" onclick="this.href='Search.aspx?columnName=' + escape('����');">����</a></div>
<div><a href="#" onclick="this.href='Search.aspx?columnName=' + escape('����');">����</a></div>
<div><a href="#" onclick="this.href='Search.aspx?columnName=' + escape('ͨ��');">ͨ��</a></div>
<div><a href="#" onclick="this.href='Search.aspx?columnName=' + escape('֪ͨ');">֪ͨ</a></div>
<div><a href="#" onclick="this.href='Search.aspx?columnName=' + escape('ͨ��');">ͨ��</a></div>
<div><a href="#" onclick="this.href='Search.aspx?columnName=' + escape('�鰸');">�鰸</a></div>
<div><a href="#" onclick="this.href='Search.aspx?columnName=' + escape('����');">����</a></div>
<div><a href="#" onclick="this.href='Search.aspx?columnName=' + escape('��ʾ');">��ʾ</a></div>
<div><a href="#" onclick="this.href='Search.aspx?columnName=' + escape('����');">����</a></div>
<div><a href="#" onclick="this.href='Search.aspx?columnName=' + escape('���');">���</a></div>
<div><a href="#" onclick="this.href='Search.aspx?columnName=' + escape('��');">��</a></div>
<div><a href="#" onclick="this.href='Search.aspx?columnName=' + escape('�����Ҫ');">�����Ҫ</a></div>

							</div>
                          </ul>
                          <h3 id="menu3">
                            <div style="float:left; width:35px;"><img alt="" src="images/bsfw_sy_14.jpg" id="Img2" /></div>
                            <div style="float:right; "><img src="images/bsfw_sy_17.jpg" width="44" height="30" /></div>
                            <div style="float:left; margin-top:10px;">������������</div>
                          </h3>
                          <ul>
                            <div style="height:8px;">&nbsp;</div>
							<div align="left" style="line-height:20px;">
                            <div ><a href="#" onclick="this.href='Search.aspx?docType=' + escape('����');">����</a></div>
<div><a href="#" onclick="this.href='Search.aspx?docType=' + escape('��ҵ');">��ҵ</a></div>

							</div>
                          </ul>
                        </span></div><div id="dzh"></div>
                      </div></td>
                </tr>
              </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="8"></td>
                </tr>
            </table>
            </td>
          <td width="8" align="center" valign="top"></td>
          <td align="center" valign="top">
		  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="5"></td>
                </tr>
              </table>   
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="5"></td>
                </tr>
              </table>            
              <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#b8b8b8">
                <tr>
                  <td width="100" height="28" align="left" background="/10954/images/20100730wj_xxgk_17.jpg" bgcolor="#FFFFFF">&nbsp;&nbsp;<span class="xxgkH12"><strong>��ǰλ�ã�</strong></span></td>
                  <td width="780" align="left" background="/10954/images/20100730wj_xxgk_17.jpg" bgcolor="#FFFFFF"><span id="gpiLocation" style="margin-left:10px;">����</span></td>
                </tr>
                <tr>
                  <td colspan="2" align="center" valign="top" bgcolor="#FFFFFF"><table width="100%" height="500" border="0" cellpadding="0" cellspacing="10">
                    <tr>
                      <td align="center" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td>
                              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td>
                                          <asp:Table ID="t" runat="server" CellPadding="5" CellSpacing="1" BackColor="#fee4c3" Width="100%">
            <asp:TableRow HorizontalAlign="Center" Height="15">
                <asp:TableCell BackColor="#d30000" Width="40">�� ��</asp:TableCell>
                <asp:TableCell BackColor="#d30000">�� ��</asp:TableCell>
                <asp:TableCell BackColor="#d30000" Width="90">��������</asp:TableCell>
                <asp:TableCell BackColor="#d30000" Width="150">�� ��</asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:Label ID="xmlLabel" runat="server" Enabled="false"></asp:Label>

                                  </td>
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
            </td>
        </tr>
        
      </table></td>
    </tr>
  </table>
  <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr>
      <td><div align="center">
        <p>���죺��ɽ�������������������칫��<br />
            <br />
  �а죺��ɽ��������Ϣ������ϯ����칫�� ����֧�֣���ɽ����Ϣ���ģ���ɽ�����������Ż���վ���й������ģ�</p>
        <p>&nbsp;</p>
      </div></td>
    </tr>
  </table>  
</div>
    </form>
</body>
</html>
