<%@ page language="C#" autoeventwireup="true" inherits="Search_Gpi, App_Web_2o_elkko" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link href="css/style_xxgk2010.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript" src="http://www.sc.gov.cn/10954/zpGpiJs/gpiTouchDiv.js"></script>
    <style type="text/css">
        td{font-size:12px;}
        a{font-size:12px;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Table ID="t" runat="server" CellPadding="5" CellSpacing="1" BackColor="#fee4c3" Width="100%">
            <asp:TableRow HorizontalAlign="Center" Height="15">
                <asp:TableCell BackColor="#d30000" Width="40">序 号</asp:TableCell>
                <asp:TableCell BackColor="#d30000">名 称</asp:TableCell>
                <asp:TableCell BackColor="#d30000" Width="90">发布日期</asp:TableCell>
                <asp:TableCell BackColor="#d30000" Width="150">文 号</asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:Label ID="xmlLabel" runat="server"></asp:Label>
    </div>
    </form>
</body>
</html>
