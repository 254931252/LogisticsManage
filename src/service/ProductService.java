package service;



import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import entity.Product;





/**
 * 
 * @author Annie
 * @ClassName:ProductService.java
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 公司名称
 * @date 2016年12月13日下午3:20:45
 */
public interface ProductService {

	Product getAllProduct( Integer proid);
	boolean deleteProduct(@Param("proid") Integer proid);
}
