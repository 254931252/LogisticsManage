package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import service.UserService;
import dao.UserDao;
import entity.User;


@Service
@Transactional
public class UserServiceImpl implements UserService{
	@Resource
	private UserDao userDao;

	/**
	 * 登陆
	 * @param userName
	 * @param userPass
	 * @return
	 */
	public User checkUser(String userName, String userPass) {
		
		return userDao.checkUser(userName, userPass);
	}

	/**
     * 注册
     * @param user
     * @return
     */
	public boolean addUser(User user) {
		// TODO Auto-generated method stub
		return userDao.addUser(user);
	}
	 /***
	    * 修改新客户信息
	    * @param user
	    * @return
	    */
	public boolean updateNewUser(User user) {
		// TODO Auto-generated method stub
		return userDao.updateNewUser(user);
	}

	@Override
	public List<User> getUsersByIdcard(@Param("idcard") String idcard,@Param("name") String name,@Param("tel") String tel,
			@Param("upper") int upper,@Param("lower") int lower) {
		// TODO Auto-generated method stub
		return userDao.getUsersByIdcard(idcard, name, tel,upper,lower);
	}

	@Override
	public List<User> getPage() {
		// TODO Auto-generated method stub
		return userDao.getPage();
	}

	@Override
	public List<User> getUsers(String idcard, String name, String tel) {
		// TODO Auto-generated method stub
		return userDao.getUsers(idcard, name, tel);
	}

	@Override
	public boolean updatePerpleByUserId(User user) {
		// TODO Auto-generated method stub
		return userDao.updatePerpleByUserId(user);
	}

	@Override
	public User getUserByUserid(int userid) {
		// TODO Auto-generated method stub
		return userDao.getUserByUserid(userid);
	}

	@Override
	public boolean delUserByUserid(int userid) {
		// TODO Auto-generated method stub
		return userDao.delUserByUserid(userid);
	}

	
	@Override
	public User getUserByUserName(String userName) {
		// TODO Auto-generated method stub
		return userDao.getUserByUserName(userName);
	}

	
	
	
}
