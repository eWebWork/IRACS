<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setAttribute("ctx", path);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<link href="${ctx}/css/login.css" type="text/css" rel="stylesheet">

<script type="text/javascript" src="${ctx}/js/jquery/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
function logins(){
	document.forms[0].submit();
}

function loginValidate() {
	if($("#setUrl").attr("href")!="javascript:logins();") {
		alert("请拖动滑块进行验证进行验证操作！")
	}
}

function setClean(){
	document.getElementById("account").value = "";
	document.getElementById("password").value = "";
}

//解决子框架嵌套的问题
if(window != window.parent){
	window.parent.location.reload(true);
}

//拖动验证开始
    (function($){
    $.fn.drag = function(options){
    var x, drag = this, isMove = false, defaults = {
    };
    var options = $.extend(defaults, options);
    //添加背景，文字，滑块
      var html = '<div class="drag_bg"></div>'+
    '<div class="drag_text" onselectstart="return false;" unselectable="on">拖动滑块验证</div>'+
    '<div class="handler handler_bg"></div>';
    this.append(html);

    var handler = drag.find('.handler');
    var drag_bg = drag.find('.drag_bg');
    var text = drag.find('.drag_text');
    var maxWidth = drag.width() - handler.width();  //能滑动的最大间距

    //鼠标按下时候的x轴的位置
      handler.mousedown(function(e){
        isMove = true;
        x = e.pageX - parseInt(handler.css('left'), 10);
    });

    //鼠标指针在上下文移动时，移动距离大于0小于最大间距，滑块x轴位置等于鼠标移动距离
        $(document).mousemove(function(e){
        var _x = e.pageX - x;
    if(isMove){
    if(_x > 0 && _x <= maxWidth){
    handler.css({'left': _x});
    drag_bg.css({'width': _x});
    }else if(_x > maxWidth){  //鼠标指针移动距离达到最大时清空事件
    dragOk();
    }
    }
    }).mouseup(function(e){
        isMove = false;
        var _x = e.pageX - x;
    if(_x < maxWidth){ //鼠标松开时，如果没有达到最大距离位置，滑块就返回初始位置
                         handler.css({'left': 0});
    drag_bg.css({'width': 0});
    }
    });

    //清空事件
      function dragOk(){
        handler.removeClass('handler_bg').addClass('handler_ok_bg');
        text.text('验证通过');
        drag.css({'color': '#fff'});
        handler.unbind('mousedown');
        $(document).unbind('mousemove');
        $(document).unbind('mouseup');
        $("#setUrl").attr("href","javascript:logins();");
    }
    };
    })(jQuery);
//拖动验证结束
</script>

<style type="text/css">
/*拖动验证样式开始*/
    #drag{
    position: relative;
    background-color: #e8e8e8;
    width: 250px;
    height: 34px;
    line-height: 34px;
    text-align: center;
    }
    #drag .handler{
    position: absolute;
    top: 0px;
    left: 0px;
    width: 42px;
    height: 32px;
    border: 1px solid #ccc;
    cursor: move;
    }
    .handler_bg{
    background: #fff url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA3hpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NTc3MiwgMjAxNC8wMS8xMy0xOTo0NDowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo0ZDhlNWY5My05NmI0LTRlNWQtOGFjYi03ZTY4OGYyMTU2ZTYiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NTEyNTVEMURGMkVFMTFFNEI5NDBCMjQ2M0ExMDQ1OUYiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NTEyNTVEMUNGMkVFMTFFNEI5NDBCMjQ2M0ExMDQ1OUYiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTQgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo2MTc5NzNmZS02OTQxLTQyOTYtYTIwNi02NDI2YTNkOWU5YmUiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NGQ4ZTVmOTMtOTZiNC00ZTVkLThhY2ItN2U2ODhmMjE1NmU2Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+YiRG4AAAALFJREFUeNpi/P//PwMlgImBQkA9A+bOnfsIiBOxKcInh+yCaCDuByoswaIOpxwjciACFegBqZ1AvBSIS5OTk/8TkmNEjwWgQiUgtQuIjwAxUF3yX3xyGIEIFLwHpKyAWB+I1xGSwxULIGf9A7mQkBwTlhBXAFLHgPgqEAcTkmNCU6AL9d8WII4HOvk3ITkWJAXWUMlOoGQHmsE45ViQ2KuBuASoYC4Wf+OUYxz6mQkgwAAN9mIrUReCXgAAAABJRU5ErkJggg==") no-repeat center;
    }
    .handler_ok_bg{
    background: #fff url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA3hpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NTc3MiwgMjAxNC8wMS8xMy0xOTo0NDowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo0ZDhlNWY5My05NmI0LTRlNWQtOGFjYi03ZTY4OGYyMTU2ZTYiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NDlBRDI3NjVGMkQ2MTFFNEI5NDBCMjQ2M0ExMDQ1OUYiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NDlBRDI3NjRGMkQ2MTFFNEI5NDBCMjQ2M0ExMDQ1OUYiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTQgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDphNWEzMWNhMC1hYmViLTQxNWEtYTEwZS04Y2U5NzRlN2Q4YTEiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NGQ4ZTVmOTMtOTZiNC00ZTVkLThhY2ItN2U2ODhmMjE1NmU2Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+k+sHwwAAASZJREFUeNpi/P//PwMyKD8uZw+kUoDYEYgloMIvgHg/EM/ptHx0EFk9I8wAoEZ+IDUPiIMY8IN1QJwENOgj3ACo5gNAbMBAHLgAxA4gQ5igAnNJ0MwAVTsX7IKyY7L2UNuJAf+AmAmJ78AEDTBiwGYg5gbifCSxFCZoaBMCy4A4GOjnH0D6DpK4IxNSVIHAfSDOAeLraJrjgJp/AwPbHMhejiQnwYRmUzNQ4VQgDQqXK0ia/0I17wJiPmQNTNBEAgMlQIWiQA2vgWw7QppBekGxsAjIiEUSBNnsBDWEAY9mEFgMMgBk00E0iZtA7AHEctDQ58MRuA6wlLgGFMoMpIG1QFeGwAIxGZo8GUhIysmwQGSAZgwHaEZhICIzOaBkJkqyM0CAAQDGx279Jf50AAAAAABJRU5ErkJggg==") no-repeat center;
    }
    #drag .drag_bg{
    background-color: #7ac23c;
    height: 34px;
    width: 0px;
    }
    #drag .drag_text{
    position: absolute;
    top: 0px;
    width: 250px;
    -moz-user-select: none;
    -webkit-user-select: none;
    user-select: none;
    -o-user-select:none;
    -ms-user-select:none;
    }
/*拖动验证样式结束*/

html { overflow-y: hidden;  }

.password{
      background-color:#f1f3f6;
	  border:1px solid #f1f3f6;
	  font-color:#ccc;
}

#Layer1 {
	position:absolute;
	left:224px;
	top:479px;
	padding-top:5px;
	width:99px;
	height:21px;
	background-color:#fff;
	z-index:1;
}
.password1 {      
	 background-color:#f1f3f6;
	  border:1px solid #f1f3f6;
	  font-color:#ccc;
}

.youbian input{ border:0px none; background-color:transparent; color:#555;padding-left:10px;font-size:16px;width:100%;overflow: hidden;}
</style>
    <!--[if IE 6]>
    <script type="text/javascript" src="${ctx}/ehome/js/DD_belatedPNG.js" ></script>
    <script type="text/javascript">
        DD_belatedPNG.fix('b, s, img, span, .prev, .next, a, input, .youbian, td');
    </script>
    <![endif]-->
</head>
<body scroll="no">


<s:form name="form1" namespace="/sys" action="login_login">
<div id="lo_tf">
<div class="outside">
    <div class="head">
      <table width="1000" height="60" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="840" align="left"><img src="${ctx}/images/login/form_03.png"   width="332" height="47"/></td>
          <td align="center">&nbsp;&nbsp;<a href="#"></a></td>
        </tr>
      </table>
    </div>
    <div class="main2">
	   <div class="content">  
	   <div class="youbian">
	    <table width="251" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="12">&nbsp;</td>
          </tr>
          <tr>
           <td height="45" align="left"></td>
          </tr>
          <tr>
          	<td height="13">&nbsp;
            	<span><div height=20 valign="middle" style="padding-left: 18px"><font color="red" id="errMsg"><s:property value="loginResult"/></font></div></span>
            </td>
          </tr>
          <tr>
            <td height="40">
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    	<td height="32" align="left"><span style="color:#767676;font-size:14px;">帐号:</span></td>
  </tr>
</table>

			<table width="100%" height="39" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td background="${ctx}/images/login/shuru_03.png" width=""><table width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td align="left">
                    <s:textfield id="account" name="user.account" cssClass="password1" cssStyle="color: #767676" size="31"/>
                    </td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
		    <tr>
            <td height="10"><table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="32" align="left"><span style="color:#767676;font-size:14px;">密&nbsp;&nbsp;码:</span></td>
  </tr>
</table></td>
          </tr>
          <tr>
            <td height="40"><table width="100%" height="39" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td background="${ctx}/images/login/shuru_03.png"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td align="left">
                    	<s:password id="password" name="user.password" cssClass="password"  cssStyle="color: #767676" size="31"/>
                    </td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
          <tr>
          	<td>&nbsp;</td>
          </tr>
          
		   <tr>
            <td height="10">
            	<div id="drag"></div>
			    <script type="text/javascript">
			    $('#drag').drag();
			    </script>
            </td>
          </tr>
          
          <tr>
          	<td>&nbsp;</td>
          </tr>
          <tr>
            <td height="40"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td align="right" ><a id="setUrl" href="#" onclick="javascript:;" style="height: 37px!important;"><img onclick="loginValidate()" src="${ctx}/images/login/form_15.png" width="95" height="37"/></a></td>
                <td width="18">&nbsp;</td>
                <td align="left"><img src="${ctx}/images/login/form_17.png" width="95" height="37" onclick="setClean()"/></td>
              </tr>
            </table></td>
          </tr>
        </table>
	    
	  </div>   
       </div>
   </div>
	<div class="foot" style="font-size: 13px;">版权所有&copy;2017年</div>
</div>
</div>
</s:form>

<!-- 背景动画 -->
<canvas id="c" width="300" height="150" style="z-index:-1; position: fixed; top: 0; left: 0;"></canvas>   
<script type="text/javascript">		
$(document).ready(function() {			
	var canvas = document.getElementById("c");
	var ctx = canvas.getContext("2d");
	var c = $("#c");
	var w,h;
	var pi = Math.PI;
	var all_attribute = {
		num:100,            			 // 个数
		start_probability:0.1,		     // 如果数量小于num，有这些几率添加一个新的     		     
		radius_min:1,   			     // 初始半径最小值
		radius_max:2,   			     // 初始半径最大值
		radius_add_min:.3,               // 半径增加最小值
		radius_add_max:.5,               // 半径增加最大值
		opacity_min:0.3,                 // 初始透明度最小值
		opacity_max:0.5, 				 // 初始透明度最大值
		opacity_prev_min:.003,            // 透明度递减值最小值
		opacity_prev_max:.005,            // 透明度递减值最大值
		light_min:40,                 // 颜色亮度最小值
		light_max:70,                 // 颜色亮度最大值
	};
	var style_color = find_random(0,360);  
	var all_element =[];
	window_resize();
	function start(){
		window.requestAnimationFrame(start);
		style_color+=.1;
		ctx.fillStyle = 'hsl('+style_color+',100%,97%)';
		ctx.fillRect(0, 0, w, h);
		if (all_element.length < all_attribute.num && Math.random() < all_attribute.start_probability){
			all_element.push(new ready_run);
		}
		all_element.map(function(line) {
			line.to_step();
		})
	}
	function ready_run(){
		this.to_reset();
	}
	ready_run.prototype = {
		to_reset:function(){
			var t = this;
			t.x = find_random(0,w);
			t.y = find_random(0,h);
			t.radius = find_random(all_attribute.radius_min,all_attribute.radius_max);
			t.radius_change = find_random(all_attribute.radius_add_min,all_attribute.radius_add_max);
			t.opacity = find_random(all_attribute.opacity_min,all_attribute.opacity_max);
			t.opacity_change = find_random(all_attribute.opacity_prev_min,all_attribute.opacity_prev_max);
			t.light = find_random(all_attribute.light_min,all_attribute.light_max);
			t.color = 'hsl('+style_color+',100%,'+t.light+'%)';
		},
		to_step:function(){
			var t = this;
			t.opacity -= t.opacity_change;
			t.radius += t.radius_change;
			if(t.opacity <= 0){
				t.to_reset();
				return false;
			}
			ctx.fillStyle = t.color;
			ctx.globalAlpha = t.opacity;
			ctx.beginPath();
			ctx.arc(t.x,t.y,t.radius,0,2*pi,true);
			ctx.closePath();
			ctx.fill();
			ctx.globalAlpha = 1;
		}
	}
	function window_resize(){
		w = window.innerWidth;
		h = window.innerHeight;
		canvas.width = w;
		canvas.height = h;
	}
	$(window).resize(function(){
		window_resize();
	});
	function find_random(num_one,num_two){
		return Math.random()*(num_two-num_one)+num_one;
	}
	(function() {
		var lastTime = 0;
		var vendors = ['webkit', 'moz'];
		for(var xx = 0; xx < vendors.length && !window.requestAnimationFrame; ++xx) {
			window.requestAnimationFrame = window[vendors[xx] + 'RequestAnimationFrame'];
			window.cancelAnimationFrame = window[vendors[xx] + 'CancelAnimationFrame'] ||
										  window[vendors[xx] + 'CancelRequestAnimationFrame'];
		}
	
		if (!window.requestAnimationFrame) {
			window.requestAnimationFrame = function(callback, element) {
				var currTime = new Date().getTime();
				var timeToCall = Math.max(0, 16.7 - (currTime - lastTime));
				var id = window.setTimeout(function() {
					callback(currTime + timeToCall);
				}, timeToCall);
				lastTime = currTime + timeToCall;
				return id;
			};
		}
		if (!window.cancelAnimationFrame) {
			window.cancelAnimationFrame = function(id) {
				clearTimeout(id);
			};
		}
	}());
	start();
});
</script>

</body>
</html>