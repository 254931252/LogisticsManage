/**
 * 
 */
package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import service.DistrictService;
import dao.DistrictDao;
import entity.District;

/**
 * @author Junhua
 * @ClassName:DistrictServiceImpl.java
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 公司名称
 * @date 2016年12月15日下午2:18:18
 */
@Service
public class DistrictServiceImpl implements DistrictService {
	@Resource
	private DistrictDao districtDao;
	/* 
	 * 查询所有区域
	 */
	
	public List<District> allDistrict() {
		
		return districtDao.allDistrict();
	}

}
