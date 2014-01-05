<%@ page language="C#" autoeventwireup="true" inherits="Default3, App_Web_yvgvleqn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
        <script src="Scripts/jquery-1.4.1-vsdoc.js" type="text/javascript"></script>
    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script type="text/javascript">
        function Oninit()
        {
          var xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                xmlhttp.open("POST", "Test.aspx", true);
                xmlhttp.setRequestHeader( "Content-Type", "application/x-www-form-urlencoded;charset=utf-8");   

                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readystate == 4 && xmlhttp.status == 200) {
                        var obj=eval("("+xmlhttp.responseText+")");
                        alert(obj);
                    }
                };
                xmlhttp.send("");
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <script type="text/javascript">
                
                $.ajax({
                        type: "post",
                        url: "Test.aspx",
                       // cache:false,
                        datatype:'josn',
                        success: function(datas) { 
                       // eval("var ary="+datas);
                        var ary=eval('('+datas+')');
                      // alert(data);
                      alert(ary.Person.length);
                      for(var i=0;i<ary.Person.length;i++)
                      {
                        document.write("姓名："+ary.Person[i].姓名+"&nbsp;&nbsp;年龄：");
                        document.write(ary.Person[i].年龄+"<br/>");
                      }
                       // alert(SaveData.Person.length);
                        }
                    }
                    )

    </script>
    </div>
    </form>
</body>
</html>
