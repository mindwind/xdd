function showRecordInfo_gpi(obj)
{
    
	var xml = xmlTouchContent.XMLDocument, id = obj.id;
	var doc = xml.selectSingleNode("root/record[@id='" + id + "']");
	if(doc != null)
	{
		var str, divId = id + "Div", keyword = doc.selectSingleNode("key").text;
		if(keyword == "") keyword = "&nbsp;";
		str = "<div id=\"" + divId + "\" style=\"position:absolute;background-color:black;display:block;top:" + (window.event.y + 10) + "px;left:" + (window.event.x + 10) + "px;width:450px;\">\r\n"
			+ "<table cellpadding=\"3\" cellspacing=\"0\" style=\"background-color:white;margin:1px;width:100%;\">\r\n"
			+ "<tr align=\"right\" style=\"background-color:white;\">\r\n"
			+ "<td style=\"font-size:12px;font-weight:bolder;color:black;width:80px;\">标　　题：</td>\r\n"
			+ "<td style=\"font-size:12px;color:black;\" align=\"left\" colspan=\"3\">" + unescape(doc.selectSingleNode("title").text) + "</td>\r\n"
			+ "</tr>\r\n"
			+ "<tr align=\"right\" style=\"background-color:white;\">\r\n"
			+ "<td style=\"font-size:12px;font-weight:bolder;color:black;width:80px;\">索 引 号：</td>\r\n"
			+ "<td style=\"font-size:12px;color:black;width:190px;\" align=\"left\">" + unescape(doc.selectSingleNode("askCode").text) + "</td>\r\n"
			+ "<td style=\"font-size:12px;font-weight:bolder;color:black;width:80px;\" align=\"right\">所属栏目：</td>\r\n"
			+ "<td style=\"font-size:12px;color:black;width:100px;\" align=\"left\">" + unescape(doc.selectSingleNode("column").text) + "</td>\r\n"
			+ "</tr>\r\n"
			+ "<tr align=\"right\" style=\"background-color:white;\">\r\n"
			+ "<td style=\"font-size:12px;font-weight:bolder;color:black;width:80px;\">发布机构：</td>\r\n"
			+ "<td style=\"font-size:12px;color:black;width:190px;\" align=\"left\">" + unescape(doc.selectSingleNode("organ").text) + "</td>\r\n"
			+ "<td style=\"font-size:12px;font-weight:bolder;color:black;width:80px;\">发布日期：</td>\r\n"
			+ "<td style=\"font-size:12px;color:black;width:100px;\" align=\"left\">" + unescape(doc.selectSingleNode("date").text) + "</td>\r\n"
			+ "</tr>\r\n"
			+ "<tr align=\"right\" style=\"background-color:white;\">\r\n"
			+ "<td style=\"font-size:12px;font-weight:bolder;color:black;width:80px;\">文　　号：</td>\r\n"
			+ "<td style=\"font-size:12px;color:black;width:190px;\" align=\"left\">" + unescape(doc.selectSingleNode("fileCode").text) + "</td>\r\n"
			+ "<td style=\"font-size:12px;font-weight:bolder;color:black;width:80px;\">关 键 词：</td>\r\n"
			+ "<td style=\"font-size:12px;color:black;width:100px;\" align=\"left\">" + keyword + "</td>\r\n"
			+ "</tr>\r\n"
			+ "</table>"
			+ "</div>\r\n"
			;
			document.body.insertAdjacentHTML("beforeEnd", str);
			
			obj.onmousemove = function (){
				document.all(divId).style.top = window.event.y + 10;
				document.all(divId).style.left = window.event.x + 10;
			}
	}
}

function removeRecordInfo_gpi(obj)
{
	obj.onmousemove = "";
	var divId = obj.id + "Div";
	if(document.all(divId) != null) document.all(divId).removeNode(true);
}