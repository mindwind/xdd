var lastOpen = null;
var first_in = true;
var imgMax = "";//"../images/bsfw_sy_14.jpg";
var imgMin = "";//"../images/bsfw_sy_23.jpg";
var regx = /lefttree\.php\?f=#/i;

var nothing_href = window.location.href.replace('#' , '')+'#';

if(nothing_href.match(regx) != null)    first_in = false;

function bindMenuClickEvent() {
  var lis = document.getElementById("menu").childNodes;
  var o = null;
  for (var i = 0; i < lis.length; i++) {
    o = lis[i];
	
    if (bindFilter(o)) {
      /* o = o.childNodes[0];  by fzy */
      o.isOpen = false;
      o.onclick = function(o) {

         if (lastOpen) {
		  if (lastOpen == this) {
            if (!this.isOpen) {
              toggleCurrent(this, "open");
			  lastOpen = this;
			  return false;
			} else {
			  toggleCurrent(this, "close");
			  lastOpen = this;
			  return false;
			}
		  }
		  toggleLast("close");
		}
		toggleCurrent(this, "open");
		lastOpen = this;
	    
        if(this.href != nothing_href){
                if(!first_in){
                    var ff = document.getElementById('dzh');
                    ff.href=this.href;
                   try{ 
                    ff.onclick();
                   }catch(e){
                    ff.click();
                   }
                }
                first_in = false;
         } 
         
        return false;
	  }
	}
  }
}
function bindFilter(o) {
  var tagName = o.tagName ? o.tagName : o.nodeName;
  if (tagName.toLowerCase() != "h3") {
    return false;
  }


  if (!o.id) {
    return true;
  }
  switch (o.id) {
//  case "user":
  case "login":
  case "exit": return false;
  }
  return true;
}
function toggleCurrent(o, type) {
  if (type == "open") {
    if (o.parentNode.id == "user") {
        o.parentNode.className = "useropen";
	}else if(o.parentNode.id == 'sev'){
        o.parentNode.className = "sevopen";
    }else if(o.parentNode.id == 'fav_im'){
        o.parentNode.className = "fav_imopen";
    }else {
	    o.parentNode.className = "open";
	}
    get_nextSibling(o).style.display = "block";
	o.childNodes[0].src = imgMin;
	o.isOpen = true;
  } else {
    if (o.parentNode.id == "user") {
      o.parentNode.className = "userclose";
	}else if(o.parentNode.id == 'sev'){
        o.parentNode.className = "sevclose";
    }else if(o.parentNode.id == 'fav_im'){
        o.parentNode.className = 'fav_imclose';
    }else {
	  o.parentNode.className = "close";
	}
    get_nextSibling(o).style.display = "none";
	o.childNodes[0].src = imgMax;

	o.isOpen = false;
  }
}
function toggleLast(type) {
    window.status = lastOpen.parentNode.id;
  if (type == "open") {
    if (lastOpen.parentNode.id == "user") {
        lastOpen.parentNode.className = "useropen";
	}else if(lastOpen.parentNode.id == 'sev'){
        lastOpen.parentNode.className = "sevopen";
    }else if(lastOpen.parentNode.id == 'fav_im'){
        lastOpen.parentNode.className = "fav_imopen";
    }else{
	    lastOpen.parentNode.className = "open";
	}
    get_nextSibling(lastOpen).style.display = "block";
	lastOpen.childNodes[0].src = imgMin;
	lastOpen.isOpen = true;
  } else {
    if (lastOpen.parentNode.id == "user") {
	    lastOpen.parentNode.className = "userclose";
	}else if(lastOpen.parentNode.id == 'sev'){
        lastOpen.parentNode.className = 'sevclose';
    }else if(lastOpen.parentNode.id == 'fav_im'){
        lastOpen.parentNode.className = 'fav_imclose'
    }else {
	  lastOpen.parentNode.className = "close";
	}
    get_nextSibling(lastOpen).style.display = "none";
	lastOpen.childNodes[0].src = imgMax;
	lastOpen.isOpen = false;
  }

}

function autoOpenClassMenu() {
  //var topUrl = window.top.document.location.href;
  //var classId = 0;
  //var pattern = /bbs\.\w*\.tom\.com/i;
  //var domain = topUrl.match(pattern);
  //var channle_counter=2;
  //var nothing_href = window.location.href.replace('#' , '')+'#';
  //如果是从读帖子的连接直接进来  

  //if (/i_(\d+)_\d+/gi.test(topUrl)) {
    //classId = parseInt(RegExp.$1);
  //} else if (/forum_(\w+)/gi.test(topUrl)) {//小川的标记
	//classId = parseInt(RegExp.$1);
  //} else if(domain != null){//如果是从分频道进入的，那么就打开相应的版面目录
    //如果没有影射版本，那就把我的收藏打开
    //if(!open_channle_menu(domain)){
        open_my_favorite();
		return;
    //}
    //return ;
  //} else {
	//如果啥都不是，那就打开收藏
    //document.getElementById("sqfw").click();
	//默认打开大杂烩分区
    
	//var oDzh = document.getElementById("sqfw");
    //oDzh.style.display = "block";
    //oDzh.childNodes[2].style.display = "block";
    //lastOpen = oDzh.childNodes[0];
    //lastOpen.isOpen = true;
	//return;
  //}
 //alert(classId);
  var as = document.getElementsByTagName("A");
  for (var i = 0; i < as.length; i++) {
	 //如果能对得上 mapping 属性，就选中
        
     //频道计数器，如果超过 20 个，每个往下挪动10 像素
     if(as[i].href==nothing_href)   channle_counter++;

	 //左上角版面链接排除掉
		if(as[i].parentNode.tagName!="STRONG"){

			if (new RegExp("com/forum_" + classId + "_", "i").test(as[i].href)) {
			  try {
				get_previousSibling(as[i].parentNode.parentNode).onclick();
			  } catch (e) {
				get_previousSibling(as[i].parentNode.parentNode).click();
			  }
				
			  if(channle_counter > 18)    window.scrollTo(0 , (channle_counter-18)*22);

			  break;
			}
		}
  }

}


//打开收藏目录
function open_my_favorite(){
    try {
        document.getElementById("sqfw").onclick();
    } catch(e) {
        document.getElementById("sqfw").click();
    }
    return ;
}

//根据频道打开相应的目录
function open_channle_menu(mapping){
    var a_element = document.getElementsByTagName("A");
    var channle_counter=2;
    var nothing_href = window.location.href.replace('#' , '')+'#';
    
    for (var i = 0; i < a_element.length; i++) {
        //如果能对得上 mapping 属性，就选中
        
        //频道计数器，如果超过 20 个，每个往下挪动10 像素
        if(a_element[i].href==nothing_href)   channle_counter++;
        
        if((a_element[i].getAttribute('mapping')!=null) && (a_element[i].getAttribute('mapping')==mapping)){
            
            //浏览器兼容
            try{
                a_element[i].click();
            }catch(e){
                a_element[i].onclick(); 
            } 

            if(channle_counter > 18)    window.scrollTo(0 , (channle_counter-18)*22);
        
            return true;
        }
        
    }

    return false;
}


window.onload = function() {

    bindMenuClickEvent();
    autoOpenClassMenu();

}

/* 取nextSibling 兼容 firefox 与 IE */
function get_nextSibling(n)
{
y=n.nextSibling;
while (y.nodeType!=1)
  {
  y=y.nextSibling;
  }
return y;
}

function get_previousSibling(n)
{
y=n.previousSibling;
while (y.nodeType!=1)
  {
  y=y.previousSibling;
  }
return y;
}