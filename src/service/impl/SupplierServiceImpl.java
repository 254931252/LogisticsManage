package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import service.SupplierService;
import dao.SupplierDao;
import entity.Supplier;

/**
 * @author 小峰
 * @ClassName:SupplierServiceImpl.java
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 公司名称
 * @date 2016年12月13日下午1:21:21
 */
@Service
@Transactional
public class SupplierServiceImpl implements SupplierService{
	@Resource
	private SupplierDao supplierDao;
	@Override
	public List<Supplier> getSupList() {
		
		return supplierDao.getSupList();
	}

}
