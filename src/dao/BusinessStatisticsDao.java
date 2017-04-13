package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import view.RequirementView;

public interface BusinessStatisticsDao {
	
	public List<RequirementView> selectByProduct(@Param("proName")String proName,@Param("startDate")String startDate,@Param("endDate")String endDate);

	public List<RequirementView> selectByType(@Param("proType")int proType,@Param("startDate")String startDate,@Param("endDate")String endDate);
	
	public List<RequirementView> seleceAll(@Param("startDate")String startDate,@Param("endDate")String endDate);

}