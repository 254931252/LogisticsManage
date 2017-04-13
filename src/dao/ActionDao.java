package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Action;

/**
 * @author 小峰
 * @ClassName:ActionDao.java
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 公司名称
 * @date 2016年12月15日下午7:53:46
 */
public interface ActionDao {
	
	/**
	 * 根据角色名称获取权限集合
	 * @param jurName
	 * @return
	 */
	List<Action> getActionListByJurName(@Param("jurName") String jurName);
	
	List<Action> getActionTempListByJurName(@Param("jurName") String jurName);
	/**
	 * 获取权限集合
	 * @return
	 */
	List<Action> getActionList();
	
	/**
	 * 根据角色名称删除对应的权限
	 * @param jurName
	 */
	void deleteActionByJurName(@Param("jurName") String jurName);
	void addAction(@Param("jurName") String jurName,@Param("actName") String actName);

}
