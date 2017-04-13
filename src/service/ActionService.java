package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Action;

/**
 * @author 小峰
 * @ClassName:ActionService.java
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 公司名称
 * @date 2016年12月15日下午8:26:21
 */
public interface ActionService {
	List<Action> getActionListByJurName(@Param("jurName") String jurName);
	/**
	 * 获取权限集合
	 * @return
	 */
	List<Action> getActionList();
	
	void deleteActionByJurName(@Param("jurName") String jurName);
	void addAction(@Param("jurName") String jurName,@Param("actName") String actName);
	List<Action> getActionTempListByJurName(@Param("jurName") String jurName);

}
