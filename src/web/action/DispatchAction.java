/**
 * 
 */
package web.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import service.OrderStateService;
import service.OrdersService;
import service.SubstationService;
import service.TasksService;
import service.UserService;
import view.OrderToTask;
import entity.OrderState;
import entity.Substation;
import entity.User;

/**
 * @author Junhua
 * @ClassName:DispatchAction.java
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 公司名称
 * @date 2016年12月12日下午2:58:02
 */
@Controller

public class DispatchAction {
	@Resource
	private SubstationService substationService;
	@Resource
	private TasksService taskService;
	@Resource
	private OrderStateService orderStateService;
	@Resource
	private OrdersService ordersService;
	@Resource
	private UserService userService;
	
	//手动调度页面
	@RequestMapping("/dispatch_hand_make")
	public String dispatchHandMake(HttpServletRequest request,HttpServletResponse response){
		List<Substation> list = substationService.allSubstation();
		request.setAttribute("substation", list);
		return "dispatch_hand_make";
	}
	//手动调度页面数据加载
	@ResponseBody
	@RequestMapping(value="/hand_make",produces="application/json;charset=UTF-8")
	public Map<String,Object> handMake(int top,int down,String createDate,String subName){
		System.out.println(subName);
		
		List<OrderToTask> list=taskService.newOrderList(top, down, createDate, subName);
		int total= taskService.newOrderCount(createDate, subName);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("total", total);
		
		map.put("list", list);
		return map;
	}
	//分站选择
	@ResponseBody
	@RequestMapping(value="/dispatchSubstation",produces="application/json;charset=UTF-8")
	public Map<Integer,String> dispatchSubstation(){
		List<Substation> list = substationService.allSubstation();
		Map<Integer,String> map= new HashMap<Integer,String>();
		for(Substation s:list){
			map.put(s.getSubId(), s.getSubName());
		}
		return map;
	}

	@RequestMapping(value="/dispatch_task_manage",produces="application/json;charset=utf-8")
	public Map<String,Object> dispatchTaskManage(){
		List<OrderState> state = orderStateService.allOrderState();
		List<Substation> sub = substationService.allSubstation();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("orderState", state);
		map.put("substation", sub);
		return map;
	}
	@ResponseBody
	@RequestMapping(value="/doTaskManage",produces="application/json;charset=utf-8")
	public Map<String,Object> doTaskManage(int top,int down,String taskId,String createDate,String subId,String osid ){
		taskId=taskId==""?"-1":taskId;
		subId=subId==""?"-1":subId;
		osid=osid==""?"-1":osid;
		List<OrderToTask> list = taskService.allOrder(top, down, Integer.parseInt(taskId),createDate, Integer.parseInt(subId),Integer.parseInt(osid));
		int tatol=taskService.allOrderCount(top, down, Integer.parseInt(taskId), createDate, Integer.parseInt(osid), Integer.parseInt(subId));
		List<Substation> sub = substationService.allSubstation();
		for(OrderToTask ott: list){
			if(ott.getSubId()!=null){
				int id=ott.getSubId();
				for(Substation s:sub){
					if(id==s.getSubId()){
						ott.setSubName(s.getSubName());
					}
				}
			}
		}
		Map<String,Object> map = new HashMap<String,Object> ();
		map.put("order", list);
		map.put("total", tatol);
		return map;
	}
	@ResponseBody
	@RequestMapping(value="/doDeleteTask",produces="application/json;charset=utf-8")
	public String deleteTask(int id){
		taskService.doDelete(id);
		return "123";
	}
	@RequestMapping("/dispatch_order_detail")
	public String dispatchOrderDetail(Integer id,HttpServletRequest request,HttpServletResponse response){
		OrderToTask ott =taskService.oneOrder(id);
		List<Substation> st = substationService.allSubstation();
		List<OrderState> state=orderStateService.allOrderState();
		double sum = ott.getBuynum()*ott.getProprice();
		request.setAttribute("sum", sum);
		request.setAttribute("state", state);
		request.setAttribute("substation", st);
		request.setAttribute("order", ott);
		return "dispatch_order_detail";
	}
	@RequestMapping("/dispatch_task_detail")
	public String orderDetail(Integer id,HttpServletRequest request,HttpServletResponse response){
		OrderToTask ott =taskService.oneOrder(id);
		List<Substation> st = substationService.allSubstation();
		List<OrderState> state=orderStateService.allOrderState();
		List<User> users = userService.getPage();
		if(ott.getDoTaskId()!=null){
			for(User u:users){
				request.setAttribute("doTaskName", u.getName());
			}
		}
		double sum = ott.getBuynum()*ott.getProprice();
		request.setAttribute("sum", sum);
		request.setAttribute("state", state);
		request.setAttribute("substation", st);
		request.setAttribute("order", ott);
		return "dispatch_task_detail";
	}
	//手动调度
	@ResponseBody
	@RequestMapping(value="/doDispatch",produces="application/json;charset=UTF-8")
	public String doDispatch(int ordid,int newSub,int doTaskId ){
		
		taskService.addTask(ordid, newSub, doTaskId);
		ordersService.updateSub(ordid, newSub);
		return "123";
		
	}
	//自动调度
	@ResponseBody
	@RequestMapping(value="/selfDispatch",produces="application/json;charset=utf-8")
	public String selfDispatch(String a,int doTaskId){
		String str[]=a.split(",");
		List<OrderState> state = orderStateService.allOrderState();
		List<Substation> sub = substationService.allSubstation();
		for(int i=0;i<str.length;i++){
			int subId=-1;
			int newState=-1;
			int ordid=Integer.parseInt(str[i]);
			OrderToTask ott =taskService.oneOrder(ordid);
			String substation = ott.getProadress().split("省")[1].split("市")[0];
			substation=substation+"站";
			for(OrderState os : state){
				if(os.getOsname().equals("已接单")){
					newState=os.getOsid();
				}
			}
			for(Substation st:sub){
				if(st.getSubName().equals(substation)){
					subId=st.getSubId();
				}
			}
			taskService.addTask(ordid, subId, doTaskId);
			ordersService.updateSub(ordid, subId);
		}
		return "123";
	}
	@RequestMapping("/dispatch_update_orders")
	public String dispatchUpdateOrder(){
		
		return "dispatch_update_orders";
	}
	@ResponseBody
	@RequestMapping(value="/update_order",produces="application/json;charset=utf-8")
	public Map<String,Object> updateOrder(int top,int down){
		
		List<OrderToTask> list = taskService.distpachUpdate(top, down);
		int total = taskService.dispatchUpdateCount();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", list);
		map.put("total", total);
		return map;
	}
	@ResponseBody
	@RequestMapping(value="/doUpdateOrder",produces="application/json;charset=utf-8")
	public String updateOrder(String a){
		String str[]=a.split(",");
		List<OrderState> state = orderStateService.allOrderState();
		for(int i=0;i<str.length;i++){
			int subId=-1;
			int newState=-1;
			int ordid=Integer.parseInt(str[i]);
			for(OrderState os : state){
				if(os.getOsname().equals("已接单")){
					newState=os.getOsid();
				}
			}
			ordersService.updateOS(ordid, newState);
		}
		return "123";
	}
	@RequestMapping("/dispatch_index")
	public String dispatchIndex(){
		
		return "dispatch_index";
	}
	@RequestMapping("/dispatch_home")
	public String dispatchHome(){
		
		return "dispatch_home";
	}
	@RequestMapping("/dispatch_self_make")
	public String dispatchSelfMake(){
		
		return "dispatch_self_make";
	}
}

