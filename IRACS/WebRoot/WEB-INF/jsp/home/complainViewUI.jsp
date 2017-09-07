<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("basePath", request.getContextPath()+"/") ;
	String path = request.getContextPath();
	request.setAttribute("ctx", path);
%>
<html>
<head>
    <%@include file="/common/header.jsp"%>
    <title>投诉信息</title>
</head>
<body class="rightBody">
    <div class="vp_d_1">
    <div style="width:1%;float:left;">&nbsp;&nbsp;&nbsp;&nbsp;</div>
        <div class="vp_d_1_1">
            <div class="content_info">
    <div class="c_crumbs"><div><b></b><strong>工作主页</strong>&nbsp;-&nbsp;投诉信息</div></div>
    <div class="tableH2">投诉详细信息<span style="color:red;">(<s:property value="#complainStateMap[comp.state]"/>)</span></div>
    <table id="baseInfo" width="100%" align="center" class="list" border="0" cellpadding="0" cellspacing="0"  >
    	<tr><td colspan="2" align="center">投诉人信息</td></tr>
        <tr>
            <td class="tdBg" width="250px">是否匿名投诉：</td>
            <td><s:property value="comp.isNm?'匿名投诉':'非匿名投诉'"/></td>
        </tr>
        <tr>
            <td class="tdBg">投诉人单位：</td>
            <td>
            <s:if test="!comp.isNm">
            	<s:property value="comp.compCompany"/>
            </s:if>
            </td>
        </tr>
        <tr>
            <td class="tdBg">投诉人姓名：</td>
            <td><s:if test="!comp.isNm"><s:property value="comp.compName"/></s:if></td>
        </tr>
        <tr>
            <td class="tdBg">投诉人手机：</td>
            <td>
            <s:if test="!comp.isNm">
            <s:property value="comp.compMobile"/>
            </s:if><s:elseif test="%{comp.compMobile.length() > 10}">
            <s:property value="%{comp.compMobile.substring(0,3) + '****' + comp.compMobile.substring(7,11)}"/>
            </s:elseif>
            </td>
        </tr>
        <tr><td colspan="2" align="center">投诉信息</td></tr>
        <tr>
            <td class="tdBg">投诉时间：</td>
            <td>
            	<s:date name="comp.compTime" format="yyyy-MM-dd HH:mm"/>
            </td>
        </tr>
        <tr>
            <td class="tdBg">被投诉部门：</td>
            <td><s:property value="comp.toCompDept"/></td>
        </tr>
        <tr>
            <td class="tdBg">被投诉人：</td>
            <td><s:property value="comp.toCompName"/></td>
        </tr>
        <tr>
            <td class="tdBg">投诉标题：</td>
            <td><s:property value="comp.compTitle"/></td>
        </tr>
        <tr>
            <td class="tdBg">投诉内容：</td>
            <td><s:property value="comp.compContent" escape="false"/></td>
        </tr>
        <tr><td colspan="2" align="center">受理信息</td></tr>
        <tr>
            <td colspan="2">
            	<s:iterator value="comp.complainReplies" status="st">
            		<fieldset style="border: solid 1px #c0c0c0;margin-top:5px;">
            		<legend style="color:green;font-weight:bold;">回复<s:property value="#st.count"/>&nbsp;</legend>
						<div style="width:100%; text-align:center;color:#ccc;maring-top:5px;">
						回复部门：<s:property value="replyDept"/>&nbsp;&nbsp;
						回复人：<s:property value="replyer"/>&nbsp;&nbsp;
						回复时间：<s:date name="replyTime" format="yyyy-MM-dd HH:mm"/>
						</div>
						<div style="width:100%;maring-top:10px;font-size:13px;padding-left:5px;">
						<s:property value="replyContent"/>
						</div>
					</fieldset>
            	</s:iterator>
            </td>
        </tr>
    </table>
    </div></div>
    <div style="width:1%;float:left;">&nbsp;&nbsp;&nbsp;&nbsp;</div>
    </div>
    
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