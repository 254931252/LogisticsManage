package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import service.JurisdictionService;
import dao.JurisdictionDao;
import entity.Jurisdiction;

/**
 * @author 小峰
 * @ClassName:JurisdictionServiceImpl.java
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 公司名称
 * @date 2016年12月15日下午8:09:49
 */
@Service
@Transactional
public class JurisdictionServiceImpl implements JurisdictionService{
	@Resource
	private JurisdictionDao jurDao;
	
	@Override
	public List<Jurisdiction> getJurListByUserId(int userId) {
		
		return jurDao.getJurListByUserId(userId);
	}

	
	@Override
	public List<Jurisdiction> getJurList() {
		// TODO Auto-generated method stub
		return jurDao.getJurList();
	}


	
	@Override
	public void deleteJurByUserId(int userId) {
		
		jurDao.deleteJurByUserId(userId);;
	}


	@Override
	public void addJur(int userId, String jurName) {
		jurDao.addJur(userId, jurName);
		
	}
	
	

}
