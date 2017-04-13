package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Substation;

public interface SubstationDao {
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