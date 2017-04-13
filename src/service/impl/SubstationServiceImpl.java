/**
 * 
 */
package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import service.SubstationService;
import dao.SubstationDao;
import entity.Substation;

/**
 * @author Junhua
 * @ClassName:SubstationServiceImpl.java
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 公司名称
 * @date 2016年12月15日下午8:21:01
 */
@Service
@Transactional
public class SubstationServiceImpl implements SubstationService {
	@Resource
	private SubstationDao substationDao;
	/**
	 * 查询所有分站
	 */
	public List<Substation> allSubstation(){
		
		return substationDao.allSubstation();
	}
	@Override
	public int getSubIdBySubName(String subName) {
		
		return substationDao.getSubIdBySubName(subName);
	}

}
