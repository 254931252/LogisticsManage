package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.User;

/**
 * @author 小峰
 * @ClassName:UserService.java
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 公司名称
 * @date 2016年12月12日下午3:28:13
 */
public interface UserService {
	/**
	 * 登陆
	 * @param userName
	 * @param userPass
	 * @return
	 */
	User checkUser(String userName,String userPass);
	/**
     * 注册
     * @param user
     * @return
     */
	boolean addUser(User user);
	/***
	    * 修改新客户信息
	    * @param user
	    * @return
	    */
	boolean updateNewUser(User user);
	/**
     * 客户信息查询
     */
	List<User> getUsersByIdcard(String idcard,String name,String tel,int upper,int lower);
    
	List<User> getPage();
	 /**
     * 客服查询用户信息
     */
	List<User> getUsers( String idcard,String name,String tel);
	
	/**
     * 修改客户信息
     */
    boolean updatePerpleByUserId(User user);
    
    /**
     * 通过userid得到对象
     * @param userid
     * @return
     */
    User getUserByUserid(@Param("userid") int userid);
    /**
     * 根据userid 删除客户信息
     */
    boolean delUserByUserid(@Param("userid") int userid);
    User getUserByUserName(@Param("userName") String userName);
}
