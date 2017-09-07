package cn.IRACS.core.service.impl;

import java.io.Serializable;
import java.util.List;

import cn.IRACS.core.dao.BaseDao;
import cn.IRACS.core.page.PageResult;
import cn.IRACS.core.service.BaseService;
import cn.IRACS.core.util.QueryHelper;
import cn.IRACS.nbfw.info.dao.InfoDao;

public class BaseServiceImpl<T> implements BaseService<T> {
	
	private BaseDao<T> baseDao;
	
	public void setBaseDao(BaseDao<T> baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public void save(T entity) {
		baseDao.save(entity);
	}

	@Override
	public void update(T entity) {
		baseDao.update(entity);
	}

	@Override
	public void delete(Serializable id) {
		baseDao.delete(id);
	}

	@Override
	public T findObjectById(Serializable id) {
		return baseDao.findObjectById(id);
	}

	@Override
	public List<T> findObjects() {
		return baseDao.findObjects();
	}

	@Override
	public List<T> findObjects(String hql, List<Object> parameters) {
		return baseDao.findObjects(hql, parameters);
	}

	@Override
	public List<T> findObjects(QueryHelper queryHelper) {
		return baseDao.findObjects(queryHelper);
	}

	@Override
	public PageResult getPageResult(QueryHelper queryHelper, int pageNo, int pageSize) {
		return baseDao.getPageResult(queryHelper, pageNo, pageSize);
	}

}
