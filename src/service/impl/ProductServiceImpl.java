package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import service.ProductService;
import dao.ProductDao;
import entity.Product;
/**
 * 
 * @author Annie
 * @ClassName:ProductServiceImpl.java
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 公司名称
 * @date 2016年12月13日下午3:26:13
 */
@Service("productService")
@Transactional
public class ProductServiceImpl implements ProductService{

	@Resource
	private ProductDao productDao;
	
	public ProductDao getProductDao() {
		return productDao;
	}

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	public Product getAllProduct(Integer proid) {
	
		return productDao.getAllProduct(proid);
	}

	
	public boolean deleteProduct(Integer proid) {
		
		return productDao.deleteProduct(proid);
	}

}
