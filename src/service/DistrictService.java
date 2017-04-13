/**
 * 
 */
package service;

import java.util.List;

import entity.District;

/**
 * @author Junhua
 * @ClassName:DistrictService.java
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 公司名称
 * @date 2016年12月15日下午2:17:08
 */

public interface DistrictService {
	
	/**
	 * 查询所有地区
	 */
	List<District> allDistrict();
}
