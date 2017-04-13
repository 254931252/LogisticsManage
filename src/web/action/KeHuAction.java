package web.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import service.OrdersService;
import service.UserService;
import view.ProductType;
import entity.OrderState;
import entity.User;

/**
 * 
 * @author xw
 * @ClassName:QueryAction.java
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 公司名称
 * @date 2016年12月11日下午5:54:51
 */
	
@Controller
public class KeHuAction {
	@Resource
	private UserService userService;
	@Resource
	private OrdersService ordersService;
	
	@RequestMapping("/user_add")
	public String server_add(){			
		
		return "user_add";	
	}
	@RequestMapping("/user_detail")
	public String user_update1(@Param("userid") int userid,HttpServletRequest request){
		User uu=userService.getUserByUserid(userid);
		System.out.println(uu+"..........................");
		request.setAttribute("uu", uu);	
		return "user_detail";
		
	}
	@RequestMapping("/user_emp")
	public String server_emp(){
		return "user_emp";		
	}
	@RequestMapping("/user_index-2")
	public String user_indexs(){
		return "user_index-2";
	}
	@RequestMapping("/user_orderformList")
	public String server_orderformList(HttpServletRequest request){
		List<OrderState> list=ordersService.queryOrderState();					
		request.setAttribute("list", list);				
		return "user_orderformList";
		
	}
	@RequestMapping("/user_orderforms")
	public String user_orderforms(@Param("userid") int userid,HttpServletRequest request){
		User user=userService.getUserByUserid(userid);
		List<OrderState> list=ordersService.queryOrderState();					
		request.setAttribute("list", list);		
		request.setAttribute("user", user);
		return "user_orderforms";
		
	}
	@RequestMapping("/user_search")
	public String server_search(){
		return "user_search";
		
	}
	@ResponseBody
	@RequestMapping(value="/delUserByUserid",produces="application/json")
	public Map<String,Object> delUserByUserid(@Param("userid") int userid){
		boolean b = userService.delUserByUserid(userid);
		System.out.println("删除信息.................."+b);
		
		List<User> list=userService.getUsersByIdcard("", "","",10,1);
		System.out.println(list);
		int total=userService.getPage().size();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("total", total);
		map.put("list", list);
		return map;			
		
		
		
	}
	
	@RequestMapping("/user_update")
	public String user_update(@Param("userid") int userid,HttpServletRequest request){
		User uu=userService.getUserByUserid(userid);
		System.out.println(uu+"..........................");
		request.setAttribute("uu", uu);		
		return "user_update";
		
	}
	@RequestMapping("/user_index")
	public String user_index(){
		return "user_index";
		
	}
	@RequestMapping("/user_home")
	public String user_home(){
		return "user_home";
	}
	@RequestMapping("/order_add")
	public String order_add(HttpServletRequest request,Integer userid){
		System.out.println("-------");
		List<ProductType> list1=ordersService.getProname();
		System.out.println(list1.get(0).getProid());
		List<ProductType> list=ordersService.getPttypt();		
		request.setAttribute("list", list);
		request.setAttribute("list1", list1);
		request.setAttribute("userid", userid);
		System.out.println("商品名:"+list1.get(0).getProname());
		return "order_add";		
	}
	@RequestMapping("/order_cusDetail")
	public String order_cusDetail(){
		return "order_cusDetail";		
	}
	@RequestMapping("/order_deleteOrder")
	public String order_deleteOrder(){
		return "order_deleteOrder";	
	}
	@RequestMapping("/order_deleteOreder")
	public String order_deleteOreder(){
		return "order_deleteOreder";		
	}
	@RequestMapping("/order_deleteProduct")
	public String order_deleteProduct(){
		return "order_deleteProduct";		
	}
	@RequestMapping("/order_delProcList")
	public String order_delProcList(){
		return "order_delProcList";		
	}
	@RequestMapping("/order_delProducts1")
	public String order_delProducts1(){
		return "order_delProducts1";		
	}
	@RequestMapping("/order_delProducts2")
	public String order_delProducts2(){
		return "order_delProducts2";		
	}
	@RequestMapping("/order_Detail")
	public String order_Detail(){
		return "order_Detail";		
	}
	@RequestMapping("/order_products")
	public String order_products(){		
		return "order_products";		
	}
	@RequestMapping("/order_putOrder")
	public String order_putOrder(@Param("proid") int proid,HttpServletRequest request){	
		List<ProductType> list=ordersService.queryAll();
		ProductType pt=ordersService.quertNew(proid);
		System.out.println("pt对象"+pt);
		request.setAttribute("pt", pt);
		request.setAttribute("list", list);
		return "order_putOrder";		
	}
	@RequestMapping("/order_search")
	public String order_search(){
		return "order_search";		
	}
	@RequestMapping("/order_searchAdd")
	public String order_searchAdd(){
		return "order_searchAdd";		
	}
	@RequestMapping("/order_update")
	public String order_update(@Param("ordid") int ordid,HttpServletRequest request){
		ProductType pt=ordersService.getPTByProid(ordid);
		pt.setCost(String.valueOf(pt.getBuynum()*pt.getProprice()));
		request.setAttribute("pt", pt);
		System.out.println("商品名："+pt.getProname()+"计量单位:"+pt.getPunit());
		return "order_update";		
	}
	@RequestMapping("/order_updateAddProc")
	public String order_updateAddProc(){
		return "order_updateAddProc";		
	}	
	@RequestMapping("/order_updateProcList")
	public String order_updateProcList(){
		return "order_updateProcList";		
	}
	@RequestMapping("/order_updateProduct")
	public String order_updateProduct(){
		return "order_updateProduct";		
	}
	@RequestMapping("/order_updateProducts")
	public String order_updateProducts(){
		return "order_updateProducts";		
	}
	@RequestMapping("/order_updateProducts1")
	public String order_updateProducts1(){
		return "order_updateProducts1";		
	}
	@RequestMapping("/order_updateProducts2")
	public String order_updateProducts2(){
		return "order_updateProducts2";		
	}
	@RequestMapping("/user_kufu")
	public String user_kufu()
	{
		return "user_kufu";		
	}
	@RequestMapping("/user_infon")
	public String user_infon(){
		
		
		return "user_infon";
		
	}
}
