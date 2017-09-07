package cn.IRACS.nbfw.role.dao;

import cn.IRACS.core.dao.BaseDao;
import cn.IRACS.nbfw.role.entity.Role;

public interface RoleDao extends BaseDao<Role> {

	//删除该角色对于的所有权限
	public void deleteRolePrivilegeByRoleId(String roleId);

}
