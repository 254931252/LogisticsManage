package web.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import entity.User;
import service.UserService;
import util.MD5Util;
@Controller
public class CreateUserAction {
	@Resource
	private UserService userService;	

	private String result;
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	@ResponseBody
	@RequestMapping(value="/addUser",produces="application/json;charset=UTF-8")
	public String addUserAction(@Param("user") User user,@Param("username") String username,@Param("userpass") String userpass){
		
		user.setUsername(username);
		user.setUserpass(MD5Util.EncoderByMd5(userpass));
		boolean b =userService.addUser(user);
		if(b){
			System.out.println(user);			
		}else{
			System.out.println("false");
		}
		return "123";				
	}
	@ResponseBody
	@RequestMapping(value="/selectUser",produces="application/json;")
	public Map<String,Object> updateNewUser(@Param("idcard") String idcard,@Param("name") String name,@Param("tel") String tel,
			@Param("addres") String address,@Param("upper") int upper,@Param("lower") int lower){
		idcard=idcard==null?"":idcard;
		name=name==null?"":name;
		tel=tel==null?"":tel;	
		System.out.println("user");
		List<User> list=userService.getUsersByIdcard(idcard, name, tel,upper,lower);
		System.out.println(list.get(0).getAddress());
		int total=userService.getPage().size();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("total", total);
		map.put("list", list);
		return map;			
	}
	@ResponseBody
	@RequestMapping(value="/getUser",produces="application/json")
	public String getUser(@Param("idcard") String idcard,@Param("name") String name,@Param("tel") String tel){
		
		System.out.println("进入getUser................................"+userService.getUsers(idcard, name, tel));
		idcard=idcard==null?"":idcard;
		name=name==null?"":name;
		tel=tel==null?"":tel;
		List<User> list=userService.getUsers(idcard, name, tel);		
		if(list!=null){
			System.out.println("list不为空");
			return "true";
		}else{
			System.out.println("list为空");
			return "false";
		}		
		
	}
	@ResponseBody
	@RequestMapping(value="/updatePerpleByUserId",produces="application/json")
	public String updatePerpleByUserId(@Param("userid") int userid,@Param("name") String name,@Param("idcard") String idcard,@Param("workspace") String workspace,
			@Param("studio") String studio,@Param("tel") String tel,@Param("address") String address,@Param("code") String code,
			@Param("email") String email,@Param("district") String district,@Param("user") User user){
		System.out.println(".................");
		System.out.println(user.getUserid());	
		user.setName(name);
		user.setIdcard(idcard);
		user.setCode(code);
		user.setWorkspace(workspace);
		user.setStudio(studio);
		user.setTel(tel);
		user.setEmail(email);
		user.setDistrict(district);
		user.setUserid(userid);
		boolean b=userService.updatePerpleByUserId(user);
		if(b){
			System.out.println("success");
			return "true";
		}else{
			System.out.println("false");
			return "false";
		}
		
		
	}
	
	
	

}
