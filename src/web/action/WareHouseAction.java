package web.action;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

import entity.Substation;
import service.BuyProService;
import service.InfoWareService;
import service.OowListService;
import service.OutOfWareService;
import service.ProductService;
import service.SubstationService;
import service.WareHouseService;
import view.BuyProOder;
/**
 * 
 * @author Annie
 * @ClassName:WareHouseAction.java
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 公司名称
 * @date 2016年12月11日下午5:53:46
 */
@Controller
public class WareHouseAction {
	@Resource
     private BuyProService buyProService;
	@Resource
	 private ProductService productService;
	 @Resource
	 private InfoWareService infoWareService;
	 @Resource
	 private WareHouseService wareHouseService;
	 @Resource
	 private  OutOfWareService outOfWareService;
	 @Resource
	 private SubstationService substationService;
	 @Resource
	 private OowListService oowListService;
	@RequestMapping("/goods_back")
	public String goods_back(){
		return "goods_back";
	}
	@RequestMapping("/goods_depart_back")
	public String depart(){
		return "goods_depart_back";
	}
	@RequestMapping("/back_list")
	public String back_list(){
		return "back_list";
	}
	
	@RequestMapping("/goodsBack_center_in")
	public String goodsBack_center_in(){
		return "goodsBack_center_in";
	}
	@RequestMapping("/goodsBack_center_out")
	public String goodsBack_center_out(){
		return "goodsBack_center_out";		
	}
	@RequestMapping("/in_depart")
	public String in_depart(){
		return "in_depart";
	}
	@RequestMapping("/goods_get")
	public String goods_get(){
		return "goods_get";
	}
	@RequestMapping("/goods_by_list")
	public String goods_by_list(){
		return "goods_by_list";
	}
	@RequestMapping("/back_moreList")
	public String back_moreList(){
		return "back_moreList";
	}
	@RequestMapping("/in_goods")
	public String 	in_goods(HttpServletRequest request,HttpServletResponse response,@Param("bpid") int bpid,@Param("actualamount") int actualamount ){
	    request.setAttribute("bpid", bpid);
	    BuyProOder buyProOder= buyProService.getBuyProOderBy(bpid);
	    request.setAttribute("actualamount", actualamount);
	  /*  System.out.println("*****"+actualamount);*/
	    request.setAttribute("BuyProOder", buyProOder);
		return "in_goods";
	}
	@RequestMapping("/allocate_out")
	public String allocate_out(){
		return "allocate_out";
	}
	@ResponseBody
	@RequestMapping(value="/getDiliverlingList",produces="application/json;charset=utf-8")
	public Map<String ,Object> getDiliverlingList(int upper, int  lower, String ordid){
		
		/*System.out.println("upper"+upper+"lower"+lower+"ordid"+ordid);*/
		ordid=ordid==null?"-1":ordid;	
		Map<String ,Object> map=new HashMap<String ,Object>();
		int total=buyProService.showDeliveringOrderList().size();//获取总记录数
		List<BuyProOder> d_list=buyProService.showDeliveringOrderPageList(upper,lower,Integer.parseInt(ordid));
		/*System.out.println(d_list);*/
		String createDate;
		for (BuyProOder buyProOder : d_list) {
			buyProOder.setActualOutAmount(buyProOder.getBuyNum());//默认出库数量为订单购买数量
			/*System.out.println(buyProOder.getActualOutAmount());*/
			createDate = buyProOder.getCreateDate();
			/*System.out.println(createDate+"---s");*/
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			try {

				date = sdf.parse(createDate);
			} catch (java.text.ParseException e) {

				e.printStackTrace();

			} catch (ParseException e) {
				e.printStackTrace();
			}
			Calendar calendar = Calendar.getInstance(); // 得到日历
			calendar.setTime(date);// 把当前时间赋给日历
			calendar.add(Calendar.DAY_OF_MONTH, +3); // 设置为后一天
			String createDate2 = sdf.format(calendar.getTime());
			buyProOder.setOutWareDate(createDate2);
			/*System.out.println(createDate2);*/
		}
		map.put("total", total);
		map.put("d_list", d_list);
		return map;
	}
	//出库子页面
	@RequestMapping("/outWare")
	public String outWare(HttpServletRequest request,HttpServletResponse response ,String ordid,int actualOutAmount){
		System.out.println(ordid+"***-----"+actualOutAmount);
		ordid=ordid==null?"-1":ordid;
		
		BuyProOder buyProOder =buyProService.getBuyP(Integer.parseInt(ordid));
	    System.out.println(buyProOder.getSubName());
		request.setAttribute("actualOutAmount", actualOutAmount);
		request.setAttribute("buyProOder", buyProOder);
		return "outWare";
	}
	
	//从outware子页面跳回来
	
	@RequestMapping("updateOutWareOutfo")
	public String updateOutWareOutfo(int ordid,String subName,String outTime,int proid,int buyNum){
		/*System.out.println("ordid"+ordid+"whname"+subName+"outTime"+outTime+"proid"+proid+"buyNum"+buyNum);*/
		try {
			subName=new String (subName.getBytes("iso-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			
			e.printStackTrace();
		}
		BuyProOder bpo=buyProService.getBuyP(ordid);
		int subid=wareHouseService.getBuyProOderById(subName);
		/*System.out.println("whid"+subid);*/
		outOfWareService.addproductToOutWareTable(outTime,ordid,1,buyNum, 0);
		buyProService.updateOrderState(ordid);
		return "allocate_out";
	}
	@RequestMapping("/distribute_print_list")
	public String distribute_print_list(){
		
		return "/distribute_print_list";
	}
	@ResponseBody
	@RequestMapping(value="/getPrintDistribute",produces="application/json;charset=utf-8")
	public Map<String ,Object>  getPrintDistribute(int upper,int lower,String outtime,String proName){
		outtime=outtime==null?"":outtime;
		proName=proName==null?"":proName;
		/*System.out.println("upper"+upper+"lower"+lower+"outtime"+outtime+"proName"+proName);*/
		List<BuyProOder> list=buyProService.printDistrbutePageList(upper, lower, outtime, proName);
		for(BuyProOder buyProOder:list){
			buyProOder.setTotalprice(buyProOder.getBuyNum()*buyProOder.getProprice());
			/*System.out.println(buyProOder.getTotalprice());*/
		}
		int total=buyProService.printDistribute(outtime, proName).size();
		/*System.out.println("total"+total);*/
		Map<String ,Object> map=new HashMap<String,Object>();
		map.put("list", list);
		map.put("total", total);
		return map;
	}
	@RequestMapping("/distribute_print")
	public String distribute_print(int ordid,HttpServletRequest request,String subName){
		try {
			subName=new String(subName.getBytes("iso-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			
			e.printStackTrace();
		}
		BuyProOder buyProOder=buyProService.getBuyPr(ordid);
		request.setAttribute("subName", subName);
		request.setAttribute("buyProOder", buyProOder);
		buyProService.updateOrderStateIsOut(ordid);
		return "/distribute_print";
	}
	@RequestMapping("/out_print_list")
	public String out_print_list(int ordid,HttpServletRequest request,String subName){
		try {
			subName=new String(subName.getBytes("iso-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			
			e.printStackTrace();
		}
		request.setAttribute("subName", subName);
		BuyProOder buyProOder= buyProService.getBuyPr(ordid);
		buyProService.updateOrderStateIsOut(ordid);
		request.setAttribute("buyProOder", buyProOder);
		return "out_print_list";
	}
	@RequestMapping("/out_print")
	public String out_print(){
		return "out_print";
	}
	@ResponseBody
	@RequestMapping(value="/printDeliveringPage",produces="application/json;charset=utf-8")
	public Map<String ,Object> printDeliveringPage(int upper,int lower,String ordid,String subName,String outtime,String proName){
		subName=subName==null?"":subName;	
		outtime=outtime==null?"":outtime;
		proName=proName==null?"":proName;	
		List<BuyProOder> list=buyProService.prinDeliveringOrderPageList(upper, lower, subName,outtime,proName);
		for(BuyProOder bpo:list){
			bpo.setTotalprice(bpo.getProprice()*bpo.getBuyNum());
			/*System.out.println(bpo.getProname());*/
		}
		int total=buyProService.prinDeliveringOrderList(subName,outtime,proName).size();
		Map<String ,Object> map=new HashMap<String,Object>();
		map.put("total", total);
		map.put("list", list);
		return map;
	}
	@RequestMapping("/ware_home")
	public String WareHome(){
		return "ware_home";
	}
	@RequestMapping("/good_allocate")
	public String good_allocate(HttpServletRequest request,HttpServletResponse response,@Param("bpid") int bpid,@Param("actualamount") int actualamount ,@Param("proid") int proid,@Param("proamount") int proamount,@Param("time") String time){
		/*System.out.println("bpid"+bpid+"actualamount"+actualamount);*/
		/*System.out.println("proid"+proid+"proamount"+proamount+"time"+time);*/
		buyProService.updateBuyProState(bpid,actualamount);
		infoWareService.addproductToCenterWare(proid, proamount, time);
		return "in_allocate";
	}
	@RequestMapping("/in_allocate")
	public String in_allocate(){
		return "in_allocate";
	}
	@ResponseBody
	@RequestMapping(value="/inAllocate",produces="application/json;charset=utf-8" )
	public Map<String ,Object> buyProductStorage(int upper,int lower,String bpid){
		/*System.out.println(upper+"*"+lower+"*"+bpid);*/
		bpid=bpid==null?"-1":bpid;	
		List<BuyProOder> list=buyProService.getPagePro(upper, lower, Integer.parseInt(bpid));
		for(BuyProOder bpo:list){
			bpo.setActualamount(bpo.getProamount());
			System.out.println(bpo.getProname());
		}
		int total=buyProService.getBuyStorage(Integer.parseInt(bpid)).size();
		Map<String ,Object> map=new HashMap<String,Object>();
		map.put("total", total);
		map.put("list", list);
		return map;
	}
	@RequestMapping("/ware_houseRegister")
	public String ware_houseRegister(){
		
		return "ware_houseRegister";
	}
	@ResponseBody
	@RequestMapping(value="/wareHouseRegister",produces="application/json;charset=utf-8")
	//produces:    指定返回的内容类型，仅当request请求头中的(Accept)类型中包含该指定类型才返回；
	public Map<String ,Object> showWarePageList(int upper,int lower,String bpid){
		/*System.out.println(upper+"上限*"+lower+"*下限"+bpid);*/
		bpid=bpid==null?"-1":bpid;
		List<BuyProOder> show_list=buyProService.showPageList(upper, lower, Integer.parseInt(bpid));
		int total =buyProService.showList().size();
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("total", total);
		map.put("show_list", show_list);
		return map;
	}
	@RequestMapping("/ware_index")
	public String Ware_index(){
		return "ware_index";
	}
	@RequestMapping("/showInfo")
	public String showInfo(HttpServletRequest request,HttpServletResponse response,@Param("bpid") int bpid ,@Param("itwdate") String itwdate){
		/*System.out.println(bpid+"*"+itwdate);*/ 
		request.setAttribute("itwdat", itwdate);
		BuyProOder buyProOder= buyProService.getBuyProOderBy(bpid);
		/*System.out.println(buyProOder);*/
		request.setAttribute("BuyProOder", buyProOder);
		return "showInfo";
	}
	
	
}
