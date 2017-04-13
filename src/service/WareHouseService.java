package service;

import org.apache.ibatis.annotations.Param;

public interface WareHouseService {
	/**
	 * 根据分站名称获取分站id
	 * @param whname
	 * @return
	 */
	int getBuyProOderById(@Param("subName") String subName);
}
