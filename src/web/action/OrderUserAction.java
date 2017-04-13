package web.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import service.OrdersService;
import view.OrderPro;
import view.ProductType;
import entity.Orders;
@Controller
public class OrderUserAction {

	@Resource
	private OrdersService ordersService;
	
	@ResponseBody		
	@RequestMapping(value="/orderUser",produces="application/json;charset=UTF-8")
	public Map<String,Object> orderUserAction(@Param("userid") String userid,@Param("osname") String osname,
			@Param("proname") String proname,@Param("createdate") String createdate,
			@Param("upper") int upper,@Param("lower") int lower,HttpServletRequest request){
		System.out.println("进入.........客户订购信息查询"+osname);		
		userid=userid.equals("")?"-1":userid;
		osname=osname.equals("--请选择--")?"":osname;
		proname=proname==null?"":proname;
		createdate=createdate==null?"":createdate;
		List<OrderPro> list=ordersService.queryOrders(Integer.parseInt(userid), osname, proname, createdate,upper,lower);
		for(OrderPro op:list){
			op.setCost(String.valueOf(op.getBuynum()*op.getProprice()));
		}
		HttpSession session=request.getSession();
		session.setAttribute("list", list);
		int total=ordersService.queryOrdersList().size();		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("total", total);
		map.put("list", list);
		return map;
		
		
	}
	@ResponseBody
	@RequestMapping(value="/getProduct",produces="application/json")//order_add有BUGG
	public Map<String,Object> getProduct(@Param("proname") String proname,@Param("buynum") int buynum,HttpServletRequest request){		
		ProductType product=ordersService.getByProname(proname);
			
		product.setCost(String.valueOf(buynum*product.getProprice()));//计算总额
		request.setAttribute("prduct", product);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("product", product);
		return map;//将对象封装到map中传到客户端,客户端用json接收	
		
	}
	@ResponseBody
	@RequestMapping(value="/getOrders",produces="aplication/json")
	public String getOrders(@Param("proid") int proid,@Param("buynum") int buynum){
		boolean b=ordersService.getOrders(proid, buynum);
		System.out.println(b);
		if(b){
			return "true";
		}
		return "false";			
	}
	@ResponseBody
	@RequestMapping(value="/addOrders",produces="aplication/json")
	public String addOrders(Orders order){
		SimpleDateFormat sdf =new SimpleDateFormat("YYYY-MM-dd");
		order.setCreatedate(sdf.format(new Date()));
		order.setOsid(1);
		order.setSub_id(2);
		boolean b=ordersService.addOrders(order);
		System.out.println(b);
		if(b){
			return "true";
		}
		return "false";			
	}
	
	@ResponseBody
	@RequestMapping(value="/getMany",produces="application/json")
	public Map<String,Object> getMany(@Param("ordid") int ordid){
		ProductType pt=ordersService.getMany(ordid);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("pt", pt);
		return map;		
	}
	@ResponseBody
	@RequestMapping(value="/getAll",produces="application/json")
	public Map<String,Object> getAll(@Param("userid") int userid,@Param("upper") int upper,@Param("lower") int lower,HttpServletRequest request){				
		List<ProductType> list=ordersService.getAll(upper, lower,userid);
		for(ProductType pt : list){
			pt.setCost(new Integer(pt.getBuynum()*pt.getProprice()).toString());
		}
		HttpSession session=request.getSession();
		session.setAttribute("list", list);		
		int total=list.size();
		System.out.println("总页数"+total);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("list", list);
		map.put("total", total);		
		return map;
		
		
	}
	@ResponseBody
	@RequestMapping(value="/updateBuynum",produces="application/json")
	public String updateBuynum(@Param("ordid") int ordid,@Param("buynum") int buynum){
		boolean b=ordersService.updateBuynum(buynum, ordid);
		if(b){
			System.out.println("b:"+"success");
		}else{
			System.out.println("false");
		}
		return "123";
		
	}
	@ResponseBody
	@RequestMapping(value="/delOrders",produces="application/json")
	public String delOrders(@Param("ordid") int ordid){
		boolean b=ordersService.delOrders(ordid);
		if(b){
			System.out.println("b:"+"success");
		}else{
			System.out.println("false");
		}
		return "success";
		
	}
	@ResponseBody
	@RequestMapping(value="/many",produces="application/json")
	public Map<String,Object> many(@Param("userid") int userid,@Param("upper") int upper,
			@Param("lower") int lower){
		List<ProductType> list=ordersService.getPTBYuserid(userid,upper,lower);
		for(ProductType op:list){
			op.setCost(String.valueOf(op.getBuynum()*op.getProprice()));
		}	
		int total=list.size();
		Map<String,Object> map=new HashMap<String,Object>();
		System.out.println(list);
		map.put("list", list);
		map.put("total", total);
		return map;
		
	}
	
	
	
	

}
