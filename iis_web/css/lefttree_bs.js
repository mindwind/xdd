var lastOpen = null;
var lastOpen1=null;
var first_in = true;
var imgMax = "images/bsfw_sy_14.jpg";
var imgMin = "images/bsfw_sy_23.jpg";
var regx = /lefttree\.php\?f=#/i;
var nothing_href = window.location.href.replace('#' , '')+'#';

if(nothing_href.match(regx) != null)    first_in = false;

function bindMenuClickEvent(MenuName) {
  var lis = document.getElementById(MenuName).childNodes;
  
  var o = null;
  for (var i = 0; i < lis.length; i++) {
    o = lis[i];
    if (bindFilter(o)) {
      /* o = o.childNodes[0];  by fzy */
      o.isOpen = false;
      o.onclick = function(o) {
         if (lastOpen || lastOpen1) {
		  if (lastOpen == this || lastOpen1==this) {
            if (!this.isOpen) {
				if(this.parentNode.id=="menu")
				{
			  	toggleCurrent(this, "open","menu");
				lastOpen = this;
				}
				else
				{
					toggleCurrent(this, "open","menu1");
				lastOpen1 = this;
				}
			  return false;
			} else {
				if(this.parentNode.id=="menu")
				{
			  	toggleCurrent(this, "close","menu");
				lastOpen = this;
				}
				else
				{
				toggleCurrent(this, "close","menu1");
				lastOpen1 = this;	
				
				}
			  return false;
			}
		  }
		    if(this.parentNode.id=="menu")
		  	toggleLast("close","menu");
			else
			toggleLast("close","menu1");
			
		}
		if(this.parentNode.id=="menu")
		{
			toggleCurrent(this, "open","menu");
			lastOpen = this;
		}
		else
		{
			toggleCurrent(this, "open","menu1");
			lastOpen1 = this;
		}
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
function toggleCurrent(o, type,MenuName) {
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
    	
	  o.parentNode.className = "close";
	
		
		get_nextSibling(o).style.display = "none";
		o.childNodes[0].src = imgMax;
		o.isOpen = false;
		
	
  }
}
function toggleLast(type,MenuName) {
    window.status = lastOpen.parentNode.id;
  if (type == "open") {
		if(MenuName=="menu")
		{
			lastOpen.parentNode.className = "open";
		get_nextSibling(lastOpen).style.display = "block";
		lastOpen.childNodes[0].src = imgMin;
		lastOpen.isOpen = true;
		}
		else
		{
			lastOpen1.parentNode.className = "open";
			get_nextSibling(lastOpen1).style.display = "block";
			lastOpen1.childNodes[0].src = imgMin;
			lastOpen1.isOpen = true;
		}
		
		
	
  } else {
	  
	  
	
		if(MenuName=="menu")
		{
			lastOpen.parentNode.className = "close";
			get_nextSibling(lastOpen).style.display = "none";
			lastOpen.childNodes[0].src = imgMax;
			lastOpen.isOpen = false;
  		}
		else
		{
			lastOpen1.parentNode.className = "close";
			get_nextSibling(lastOpen1).style.display = "none";
			lastOpen1.childNodes[0].src = imgMax;
			lastOpen1.isOpen =false;
		}
		
	
  }

}

function autoOpenClassMenu() {
  //var topUrl = window.top.document.location.href;
  //var classId = 0;
  //var pattern = /bbs\.\w*\.tom\.com/i;
  //var domain = topUrl.match(pattern);
  //var channle_counter=2;
  //var nothing_href = window.location.href.replace('#' , '')+'#';
  //����ǴӶ����ӵ�����ֱ�ӽ���  

  //if (/i_(\d+)_\d+/gi.test(topUrl)) {
    //classId = parseInt(RegExp.$1);
  //} else if (/forum_(\w+)/gi.test(topUrl)) {//С���ı��
	//classId = parseInt(RegExp.$1);
  //} else if(domain != null){//����Ǵӷ�Ƶ������ģ���ô�ʹ���Ӧ�İ���Ŀ¼
    //���û��Ӱ��汾���ǾͰ��ҵ��ղش�
    //if(!open_channle_menu(domain)){
        open_my_favorite();
		return;
    //}
    //return ;
  //} else {
	//���ɶ�����ǣ��Ǿʹ��ղ�
    //document.getElementById("sqfw").click();
	//Ĭ�ϴ򿪴��ӻ����
    
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
	 //����ܶԵ��� mapping ���ԣ���ѡ��
        
     //Ƶ����������������� 20 ����ÿ������Ų��10 ����
     if(as[i].href==nothing_href)   channle_counter++;

	 //���Ͻǰ��������ų���
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


//���ղ�Ŀ¼
function open_my_favorite(){
    try {
        document.getElementById("sqfw").onclick();
		
    } catch(e) {
        document.getElementById("sqfw").click();
    }
	lastOpen1=document.getElementById("type1");
    return ;
}

//����Ƶ������Ӧ��Ŀ¼
function open_channle_menu(mapping){
    var a_element = document.getElementsByTagName("A");
    var channle_counter=2;
    var nothing_href = window.location.href.replace('#' , '')+'#';
    
    for (var i = 0; i < a_element.length; i++) {
        //����ܶԵ��� mapping ���ԣ���ѡ��
        
        //Ƶ����������������� 20 ����ÿ������Ų��10 ����
        if(a_element[i].href==nothing_href)   channle_counter++;
        
        if((a_element[i].getAttribute('mapping')!=null) && (a_element[i].getAttribute('mapping')==mapping)){
            
            //���������
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

    bindMenuClickEvent("menu");
	bindMenuClickEvent("menu1");
    autoOpenClassMenu();

}

/* ȡnextSibling ���� firefox �� IE */
function get_nextSibling(n)
{
	
y=n.nextSibling;
while (y.nodeType!=1)
  {
  y=y.nextSibling;
  }
return y;
}

function get_previousSibling(n,MenuName)
{
y=n.previousSibling;
while (y.nodeType!=1)
  {
  y=y.previousSibling;
  }
return y;
}