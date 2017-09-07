package cn.IRACS.nbfw.info.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.IRACS.core.service.impl.BaseServiceImpl;
import cn.IRACS.nbfw.info.dao.InfoDao;
import cn.IRACS.nbfw.info.entity.Info;
import cn.IRACS.nbfw.info.service.InfoService;

@Service("infoService")
public class InfoServiceImpl extends BaseServiceImpl<Info> implements InfoService {

	private InfoDao infoDao;

	@Resource
	public void setInfoDao(InfoDao infoDao) {
		super.setBaseDao(infoDao);
		this.infoDao = infoDao;
	}
}
