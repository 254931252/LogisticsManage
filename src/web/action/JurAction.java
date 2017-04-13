package web.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import service.ActionService;
import service.JurisdictionService;
import service.UserService;
import view.Tree;

import com.alibaba.fastjson.JSONArray;

import entity.Action;
import entity.Jurisdiction;
import entity.User;

/**
 * @author 小峰
 * @ClassName:JurAction.java 权限管理
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 公司名称
 * @date 2016年12月16日上午10:18:50
 */
@Controller
public class JurAction {
	@Resource
	private UserService userService;
	@Resource
	private JurisdictionService jurService;
	@Resource
	private ActionService actionService;
	@RequestMapping("modify_jur_home")
	public String modifyJurHome(){
		return "modify_jur_home";
	}
	@RequestMapping("jur_index")
	public String jurIndex(){
		return "jur_index";
	}
	@ResponseBody
	@RequestMapping(value="findUserName",produces="application/json;charset=utf-8")
	public String findUserName(String userName){
		User user=userService.getUserByUserName(userName);
		if(user==null){
			return "false";
		}
		return "true";
	}
	@ResponseBody
	@RequestMapping(value="modifyJur",produces="application/json;charset=utf-8")
	public String modifyJur(String userName,String arr){
		User user=userService.getUserByUserName(userName);
		List<Jurisdiction> jurList=jurService.getJurList(); 	//角色集合
		List<Action> actionList=actionService.getActionList();	//权限集合
		int userId=user.getUserid();
		System.out.println(arr);
		if(arr!=null&&arr!=""){
			String[] str=new String[500];
			str=arr.split(",");
			jurService.deleteJurByUserId(userId);				//删除用户拥有的角色
			String jurName="";
			for(String s:str){									//遍历前台传回来的所要修改的角色和权限
				for(Jurisdiction j:jurList){					
					if(s.equals(j.getJurName())){
						actionService.deleteActionByJurName(s);	//删除角色对应的权限
						jurService.addJur(userId, s);			//给用户添加角色
						jurName=s;
						break;
					}
					
				}
				for(Action a:actionList){						//如果该字符串是某个权限则存入tempActionList
					if(s.equals(a.getActName())){
						actionService.addAction(jurName, s);
						break;
					}
						
				}
			}
		}
		return "true";
	}
	@ResponseBody
	@RequestMapping(value="findJurList",produces="application/json;charset=utf-8")
	public List<Tree> findJurList(String userName){
		User user=userService.getUserByUserName(userName);
		int userId=user.getUserid();
		List<Jurisdiction> userJurList=jurService.getJurListByUserId(userId); 	//查找用户角色集合
		List<Action> userActionList=new ArrayList<Action>(); 	 //用户权限集合(用来存放用户所拥有的权限)
		List<Jurisdiction> jurList=jurService.getJurList(); 	//角色集合
		//查找用户拥有的权限
		for(Jurisdiction jur:userJurList){  	
			for(Action act:actionService.getActionListByJurName(jur.getJurName())){//遍历用户权限
				userActionList.add(act);						//存入用户权限集合
			}
		}		
		//构建返回的树形集合
		List<Tree> treeList=new ArrayList<Tree>();				
		for(int i=1;i<=jurList.size();i++){						//遍历角色集合
			Tree tree=new Tree();								//一级角色树
			String jurName=jurList.get(i-1).getJurName();
			tree.setId(i);
			tree.setText(jurName);					
			tree.setState("closed");							
			for(Jurisdiction jur:userJurList){					//判断用户是否拥有该角色，是则该树被选中
				if(jur.getJurName().equals(jurName)){
					tree.setState("open");
				}
			}
			List<Action> actList=actionService.getActionTempListByJurName(jurName);	//获取该角色的所有权限
			
			List<Tree> children=new ArrayList<Tree>();			//二级权限树(子树)集合
			for(int j=1;j<=actList.size();j++){					//遍历权限给子树赋值
				Tree tr=new Tree();
				String actName=actList.get(j-1).getActName();
				tr.setId(i*10+j);
				tr.setText(actName);
				tr.setState("open");	
				for(Action act:userActionList){					//判断用户是否拥有该权限，是则该树被选中
					if(act.getActName().equals(actName)){
						tr.setChecked("checked");
					}
				}
				children.add(tr);
			}
			tree.setChildren(children);
			treeList.add(tree);
		}
		JSONArray json=new JSONArray();
		for(Tree tree:treeList){
			json.add(tree);
		}
		System.out.println(json);
		return treeList;
	}		
}


