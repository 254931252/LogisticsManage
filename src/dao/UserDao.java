package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;



import entity.User;

public interface UserDao {
	/**
	 * 登入
	 * @param userName
	 * @param userPass
	 * @return
	 */
    User checkUser(@Param("userName") String userName,@Param("userPass") String userPass);
    /**
     * 注册
     * @param user
     * @return
     */
    boolean addUser(User user);
   /***
    * 更新
    * @param user
    * @return
    */
    boolean updateNewUser(User user);
    
    /**
     * 根据用户信息查找用户
     */
    List<User> getUsersByIdcard(@Param("idcard") String idcard,@Param("name")String name,@Param("tel")String tel,
    		@Param("upper") int upper,@Param("lower") int lower);
    /**
     * @return
     */
    List<User> getPage();
    
    /**
     * 
     */
    List<User> getUsers(@Param("idcard") String idcard,
    		@Param("name")String name,@Param("tel")String tel);
    /**
     * 
     */
    boolean updatePerpleByUserId(User user);
    /**
     * 根据用户id查找用户
     * @param userid
     * @return
     */
    User getUserByUserid(@Param("userid") int userid);
    /**
     * 根据用户id删除用户 
     */
    boolean delUserByUserid(@Param("userid") int userid);
    /**
     * 根据用户名查找用户
     * @param userName
     * @return
     */
    User getUserByUserName(@Param("userName") String userName);
     
    
    
}