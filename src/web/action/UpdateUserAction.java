package web.action;

import javax.annotation.Resource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import entity.User;
import service.UserService;
@Controller
public class UpdateUserAction {
	@Resource
	private UserService userService;	
	@ResponseBody
	@RequestMapping(value="updateUser")
	public String updateUser(User user,HttpServletRequest request){
		HttpSession session=request.getSession();
		System.out.println(user.getStudio()+"---"+user.getIdcard());
		user.setUserid(((User)session.getAttribute("user2")).getUserid());
		
		boolean b=userService.updateNewUser(user);
		System.out.println(b);
		if(b){			
			return "ture";
		}else{
			System.out.println("保存失败,请重新保存");
			return "false";
		}		
	}
	
}
