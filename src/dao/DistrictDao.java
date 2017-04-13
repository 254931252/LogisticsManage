package dao;

import java.util.List;

import entity.District;

public interface DistrictDao {
	
	/**
	 * 查询所有地区
	 */
	List<District> allDistrict();
}
