package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Jurisdiction;

public interface JurisdictionDao {
	/**
	 * 根据用户id查找当前用户的角色列表
	 * @param userId
	 * @return
	 */
	List<Jurisdiction> getJurListByUserId(@Param("userId") int userId);
	/**
	 * 获取权限列表
	 * @return
	 */
	List<Jurisdiction> getJurList();
	
	/**
	 * 根据用户ID删除其拥有的角色
	 * @param userId
	 */
	void deleteJurByUserId(@Param("userId") int userId);
	/**
	 * 添加用户的角色
	 * @param userId
	 * @param jurName
	 */
	void addJur(@Param("userId") int userId,@Param("jurName") String jurName );
   
}