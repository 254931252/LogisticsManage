package service;

import org.apache.ibatis.annotations.Param;

public interface OowListService {

	  /**
	   * 添加分发单数据至数据库
	   * @param subId
	   * @param oldate
	   */
	void addOow(@Param("subId") int subId,@Param("outtime") String outtime);
}
