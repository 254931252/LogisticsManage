package dao;

import org.apache.ibatis.annotations.Param;

import entity.Product;
/**
 * 
 * @author Annie
 * @ClassName:ProductDao.java
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 公司名称
 * @date 2016年12月13日下午3:05:30
 */
public interface ProductDao {
/**
 * 根据货物Id查找所有货物
 * @param proid
 * @return
 */
	Product getAllProduct(@Param("proid") Integer proid);
	/**
	 * 根据产品id删除对应产品
	 * @param proid
	 * @return
	 */
	boolean deleteProduct(@Param("proid") Integer proid);
}
