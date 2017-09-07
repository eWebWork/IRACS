package cn.IRACS.core.constant;

import java.util.HashMap;
import java.util.Map;

public class Constant {
	
	//系统中用户在session中的标识符
	public static String USER = "SYS_USER";
	
	/*----------------------系统权限集合--------------------------*/
	public static String PRIVILEGE_NBFW = "nbfw"; 

	public static Map<String, String> PRIVILEGE_MAP;
	static {
		PRIVILEGE_MAP = new HashMap<String, String>();
		PRIVILEGE_MAP.put(PRIVILEGE_NBFW, "内部服务");
	}
}
