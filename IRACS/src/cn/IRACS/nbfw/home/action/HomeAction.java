package cn.IRACS.nbfw.home.action;

import cn.IRACS.core.action.BaseAction;

public class HomeAction extends BaseAction {

	//跳转到内部服务系统首页
	public String frame(){
		return "frame";
	}
	//跳转到内部服务系统首页-顶部
	public String top(){
		return "top";
	}
	//跳转到内部服务系统首页-左边菜单
	public String left(){
		return "left";
	}
}
