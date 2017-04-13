package web.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import service.ActionService;
import service.JurisdictionService;
import service.UserService;
import util.MD5Util;
import entity.Action;
import entity.Jurisdiction;
import entity.User;

@Controller
public class LoginAction {
	@Resource
	private UserService userService;
	@Resource
	private ActionService actionService;
	@Resource
	private JurisdictionService jurisdictionService;
	@ResponseBody
	@RequestMapping(value="loginAction",produces="application/json;charset=UTF-8")
	public String loginAction(@Param("userName") String userName,@Param("userPass") String userPass,HttpServletRequest request){
		User user=userService.checkUser(userName, MD5Util.EncoderByMd5(userPass));
		if(user!=null){
			HttpSession session=request.getSession();
			List<Jurisdiction> jurList=jurisdictionService.getJurListByUserId(user.getUserid());
			List<Action> actionList=new ArrayList<Action>();
			for(Jurisdiction j:jurList){
				List<Action> actList=actionService.getActionListByJurName(j.getJurName());
				for(Action a:actList){
					actionList.add(a);
				}
			}
			session.setAttribute("user", user);
			session.setAttribute("jurList", jurList);
			session.setAttribute("actionList", actionList);
			return "true";
		}
		return "false";
	}
	@RequestMapping("/index")
	public String index(){
		return "index";
	}
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request){
		HttpSession session=request.getSession();
		session.removeAttribute("user");
		session.removeAttribute("jurList");
		session.removeAttribute("actionList");
		return "logout";
	}
	
}
