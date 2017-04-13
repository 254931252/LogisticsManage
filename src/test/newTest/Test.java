package test.newTest;

import javax.annotation.Resource;

import entity.User;
import service.UserService;



public class Test extends BaseTest {
	@Resource
	private UserService userService;
	@org.junit.Test
	public void t(){
		//System.out.println(userService.checkUser("aaa", "123"));
		/*User user=new User();
		user.setUsername("abc");
		user.setUserpass("123");
		System.out.println(userService.addUser(user));*/
		/*User user=new User();
		user.setAddress("aa");
		user.setCode("sdd");
		user.setDistrict("sss");
		user.setEmail("dd");
		user.setIdcard("ss");
		user.setStudio("ss");
		user.setTel("sss");
		user.setWorkspace("sss");
		user.setName("叼霸");
		user.setUserid(2);		
		System.out.println(userService.updateNewUser(user));*/
		System.out.println(userService.getUsersByIdcard("666666", "叼霸天", "911",10,1));
		//System.out.println(userService.getPage("666666","叼霸天","911").size());
		
	}
}
