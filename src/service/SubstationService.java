/**
 * 
 */
package service;

import java.util.List;




import org.apache.ibatis.annotations.Param;

import entity.Substation;

/**
 * @author Junhua
 * @ClassName:SubstationService.java
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 公司名称
 * @date 2016年12月15日下午8:19:41
 */

public interface SubstationService {
	/**
	 * 查询所有分站
	 */
List<Substation> allSubstation();
/**
 * 根据分站名称获取分站id
 * @param subName
 * @return
 */
	int getSubIdBySubName(@Param("subName")String subName);
}
