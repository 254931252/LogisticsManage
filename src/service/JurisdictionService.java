package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Jurisdiction;

/**
 * @author 小峰
 * @ClassName:JurisdictionService.java
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 公司名称
 * @date 2016年12月15日下午8:09:11
 */
public interface JurisdictionService {
	List<Jurisdiction> getJurListByUserId(@Param("userId") int userId);
	/**
	 * 获取权限列表
	 * @return
	 */
	List<Jurisdiction> getJurList();
	void deleteJurByUserId(@Param("userId") int userId);
	void addJur(@Param("userId") int userId,@Param("jurName") String jurName );
}
