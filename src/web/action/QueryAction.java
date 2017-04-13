package web.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import service.DistrictService;
import service.OrderStateService;
import service.OrdersService;
import service.SenderService;
import service.SubstationService;
import service.TasksService;
import service.UserService;
import view.OrderPro;
import view.ShowTask;

import com.alibaba.fastjson.JSONArray;

import entity.District;
import entity.OrderState;
import entity.Senders;
import entity.Substation;
import entity.User;



/**
 * 
 * @author Junhua
 * @ClassName:QueryAction.java
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 公司名称
 * @date 2016年12月11日下午5:54:51
 */
@Controller
public class QueryAction {
	
	@Resource
	private TasksService tasksService;
	@Resource
	private SenderService senderService;
	@Resource
	private OrderStateService orderStateService;
	@Resource
	private DistrictService districeService;
	@Resource
	private SubstationService substationService;
	@Resource
	private OrdersService ordersService;
	@Resource
	private UserService userService;
	
	@ResponseBody
	@RequestMapping(value="/queryList")
	public void queryList(Integer top,Integer down,String taskId,String createDate,String sender,String orderState,HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		
		taskId=taskId.equals("")?"-1":taskId;
		sender=sender.equals("")?"-1":sender;
		orderState=orderState.equals("")?"-1":orderState;
		response.setCharacterEncoding("UTF-8");
		List<ShowTask> list=tasksService.allTask2(top,down,Integer.parseInt(taskId),createDate,Integer.parseInt(sender),Integer.parseInt(orderState),Integer.parseInt("-1"));

		Integer count = tasksService.tasksCount2(Integer.parseInt(taskId),createDate,Integer.parseInt(sender),Integer.parseInt(orderState),Integer.parseInt("-1"));
		
		JSONArray array=new JSONArray();
		array.add(count);
		for(ShowTask s:list){
			array.add(s);
		}
		
		response.getWriter().print(array.toJSONString());
	}
	@ResponseBody
	@RequestMapping(value="/doSave",produces="application/json;charset=UTF-8")
	public String doDelete(int ordid,int state){
		ordersService.updateOS(ordid, state);
		return "123";
		
	}
	@RequestMapping(value="/query")
	public String query(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		List<Senders> list = senderService.allSender();
		List<OrderState> os =orderStateService.allOrderState();
		request.setAttribute("senders", list);
		request.setAttribute("orderState", os);
		
		return "query";
	}
	
	@RequestMapping("/query_index")
	public String queryMain(){
		
		return "query_index";
	}
	@RequestMapping("/query_merchandise")
	public String queryMerchandise(){
		
		return "query_merchandise";
	}
	//查询任务单详情

	@RequestMapping("/query_single_task")
	public String querySingleTask(@Param("taskId")  Integer id,HttpServletRequest request) throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		ShowTask st = tasksService.oneTask(id);
		request.setAttribute("showTask", st);
		return "query_single_task";
	}
	@RequestMapping("/query_single_task2")
	public String querySingleTask2(@Param("taskId")  Integer id,HttpServletRequest request) throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		ShowTask st = tasksService.oneTask(id);
		request.setAttribute("showTask", st);
		return "query_single_task2";
	}
	@RequestMapping("/query_home")
	public String queryHome(){
		
		return "query_home";
	}
	@RequestMapping("/query_add_info")
	public String queryAddInfo(int id,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		ShowTask st = tasksService.oneTask(id);
		request.setAttribute("showTask", st);
		List<OrderState>list = orderStateService.allOrderState();
		OrderPro orderPro = tasksService.productInfo(id);
		request.setAttribute("orderPro", orderPro);
		request.setAttribute("state", list);
		List<User> user = userService.getPage();
		for(User u:user){
			if(u.getUserid()==st.getDoTaskId()){
				request.setAttribute("name", u.getUsername());
			}
		}
		return "query_add_info";
	}
	//任务查询与分配加载页面
	@RequestMapping(value="/query_print_task_sign_form")
	public String printTaskSignForm(HttpServletRequest request,HttpServletResponse response){
		List<District> list = districeService.allDistrict();
		List<OrderState> ord= orderStateService.allOrderState();
		request.setAttribute("district", list);
		request.setAttribute("orderState", ord);
		return "query_print_task_sign_form";
	}
	//任务查询与分配数据加载
	@ResponseBody
	@RequestMapping(value="/task_sign_form",produces="application/json;charset=utf-8")
	public Map<String,Object> taskSignForm(int top,int down,String district,String orderState){
		district = district==""?"-1":district;
		orderState = orderState==""?"-1":orderState;
		List<ShowTask> task= tasksService.allTask(top, down, Integer.parseInt("-1"), "", Integer.parseInt("-1"), Integer.parseInt(orderState), Integer.parseInt(district));
		int count = tasksService.tasksCount(Integer.parseInt("-1"), "", Integer.parseInt("-1"), Integer.parseInt(orderState), Integer.parseInt(district));
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("count", count);
		map.put("task", task);
		return map;
	}
	//进入任务分配
	@RequestMapping(value="/query_task_distribut")
	public String taskDistribut(int id,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		ShowTask st = tasksService.oneTask(id);
		List<OrderState> ord= orderStateService.allOrderState();
		List<Senders> sender = senderService.allSender();
		List<Substation> sub = substationService.allSubstation();
		
		request.setAttribute("substation", sub);
		request.setAttribute("orderState", ord);
		request.setAttribute("sender", sender);
		request.setAttribute("showTask", st);
		request.setAttribute("date", new Date());
		return "query_task_distribut";
	}
	//提交任务分配
	@ResponseBody
	@RequestMapping(value="/doDistribute",produces="application/json;charset=utf-8")
	public String doDistribute(String taskId,String ordid,String orderState,String substation,String sender){
		sender= sender==""?"-1":sender;
		tasksService.doDistribut(Integer.parseInt(sender), Integer.parseInt(substation), Integer.parseInt(taskId));
		ordersService.updateOS(Integer.parseInt(ordid), Integer.parseInt(orderState));
		ordersService.updateSub(Integer.parseInt(ordid), Integer.parseInt(substation));
		return "123";
	}
	@RequestMapping("/query_sign_form_info")
	public String signFormInfo(int id,HttpServletRequest request,HttpServletResponse reponse) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		ShowTask st = tasksService.oneTask(id);
		request.setAttribute("showTask", st);
		List<User> user = userService.getPage();
		OrderPro orderPro = tasksService.productInfo(id);
		request.setAttribute("orderPro", orderPro);
		for(User u:user){
			if(u.getUserid()==st.getDoTaskId()){
				request.setAttribute("name", u.getUsername());
			}
		}
		return "query_sign_form_info";
	}

	@RequestMapping("/query_task_info")
	public String taskInfo(int ordid,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		OrderPro orderPro = tasksService.productInfo(ordid);
		String cost=String.valueOf(orderPro.getProprice()*orderPro.getBuynum());
		orderPro.setCost(cost);
		request.setAttribute("orderPro", orderPro);
		return "query_task_info";
	}

	@RequestMapping("/query_pay")
	public String queryPay( ) throws UnsupportedEncodingException{
		
		
		return "query_pay";
	}
	@ResponseBody
	@RequestMapping(value="payList",produces="application/json;charset=utf-8")
	public Map<String,Object> payList(int top,int down,String proname){

		List<OrderPro> list = tasksService.productTask(top, down,proname);
		for(OrderPro op:list){
			op.setCost(String.valueOf((op.getProprice()*op.getBuynum())));
		}
		int count = tasksService.productTaskCount(proname);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("total", count);
		map.put("list", list);
		return map;
	}
}
