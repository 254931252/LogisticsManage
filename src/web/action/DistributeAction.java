package web.action;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.ProType;
import service.BusinessStatisticsService;
import service.DistributeCenterService;
import view.BuyProView;
import view.ProManage;

@Controller
public class DistributeAction {
	
	@Resource
	private DistributeCenterService distributeCenterService;
	
	@Resource
	private BusinessStatisticsService businessStatisticsService;

	@RequestMapping("/distribute_index")
	public String index(){
		return "distribute_index";
	}
	
	@RequestMapping("/product_manage")
	public String proMana(Model model){
		List<ProType> typeList = distributeCenterService.getProType();
		model.addAttribute("typeList",typeList);
		return "product_manage";
	}
	
	@RequestMapping("/changeTable")
	@ResponseBody
	public Map<String, Object> proMana(@Param("proType") Integer proType,@Param("keyWord") String keyWord,
			@Param("upper")int upper,@Param("lower")int lower) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<ProManage> list = distributeCenterService.proManage(proType, keyWord,upper,lower);
		int total = distributeCenterService.getProListSize(proType, keyWord);
		map.put("total", total);
		map.put("list", list);
		return map;
	}
	
	@RequestMapping("/changeList")
	@ResponseBody
	public List<ProType> changeList(){
		return distributeCenterService.getProType();
	}
	
	@RequestMapping("/addNewType")
	@ResponseBody
	public String addNewType(@Param("typeName") String typeName){
		return distributeCenterService.addNewType(typeName);
	}
	
	@RequestMapping("/getAnProInfo")
	@ResponseBody
	public ProManage getAnProInfo(@Param("proId")int proId){
		return distributeCenterService.getAnProInfo(proId);
	}
	
	@RequestMapping("/deleteAnPro")
	@ResponseBody
	public String deleteAnPro(@Param("proId") int proId){
		return distributeCenterService.deleteProduct(proId);
	}
	
	@RequestMapping("/addNewProduct")
	@ResponseBody
	public String addNewProduct(@Param("proType")int proType ,@Param("proSub")String proSub ,
			@Param("proName")String proName ,@Param("proModel")String proModel ,
			@Param("proPrice")int proPrice ,@Param("proInfo")String proInfo ,@Param("proCost")int proCost){
		return distributeCenterService.addNewProduct(proType, proSub, proName, proModel, proPrice, proInfo, proCost);
	}
	
	@RequestMapping("/updateProduct")
	@ResponseBody
	public String updateProduct(@Param("proId")int proId,@Param("proPrice")int proPrice ,@Param("proCost")int proCost){
		return distributeCenterService.updateProduct(proId, proPrice, proCost);
	}
	
	@RequestMapping("/addABuyPro")
	@ResponseBody
	public String addABuyPro(@Param("amount")int amount,@Param("proId")int proId){
		return distributeCenterService.addABuyPro(proId,amount);
	}
	
	@RequestMapping("/seleceBuyProView")
	@ResponseBody
	public Map<String,Object> seleceBuyProView(@Param("ptId")int ptId,@Param("proName")String proName,
			@Param("upper")int upper,@Param("lower")int lower){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("total", distributeCenterService.selectMaxBPView(ptId, proName));
		map.put("list", distributeCenterService.selectBuyProView(ptId, proName, upper, lower,0));
		return map;
	}
	
	@RequestMapping("/getABView")
	@ResponseBody
	public BuyProView getABView(@Param("bpId")int bpId,@Param("upper")int upper,@Param("lower")int lower){
		return distributeCenterService.selectBuyProView(0, "", upper, lower,bpId).get(0);
	}
	
	@RequestMapping("/updateAmount")
	@ResponseBody
	public String updateAmount(@Param("bpId")int bpId,@Param("proAmount")int proAmount){
		return distributeCenterService.updateAmount(bpId, proAmount);
	}
	
	@RequestMapping("/deleteABuyPro")
	@ResponseBody
	public String deleteABuyPro(@Param("bpId")String bpId){
		return distributeCenterService.deleteABuyPro(bpId);
	}
	
	@RequestMapping("/addToList")
	@ResponseBody
	public String addToList(@Param("bpId")String bpId){
		return distributeCenterService.addToList(bpId);
	}
	
	@RequestMapping("/getCurrList")
	@ResponseBody
	public List<BuyProView> getCurrList(){
		return distributeCenterService.getCurrList();
	}
	
	@RequestMapping("/returnToList")
	@ResponseBody
	public String returnToList(@Param("bpId")int bpId){
		return distributeCenterService.returnToList(bpId);
	}
	
	@RequestMapping("/doSubmit")
	@ResponseBody
	public String doSubmit(){
		return distributeCenterService.doSubmit();
	}
	
	@RequestMapping("/getWareHouseList")
	@ResponseBody
	public String getWareHouseList(){
		return distributeCenterService.doSubmit();
	}
	
	@RequestMapping("/selectWareHouse")
	@ResponseBody
	public Map<String, Object> selectWareHouse(@Param("disId")int disId,
			@Param("userName")String userName,@Param("upper")int upper,@Param("lower")int lower){
		return distributeCenterService.selectWareHouse(disId, userName, upper, lower);
	}
	
	@RequestMapping("/ooiList")
	@ResponseBody
	public Map<String,Object> ooiList(@Param("key")String key,@Param("proName")String proName,@Param("whId")int whId,
			@Param("upper")int upper,@Param("lower")int lower){
		return distributeCenterService.selectOutOfOrIntoWarehouseList(key, proName, whId, upper, lower);
	}
	
	@RequestMapping(value="/changeTheChart",method=RequestMethod.GET)
	@ResponseBody
	public void changeTheChart(@Param("type")int type,@Param("typeName")String typeName,
			@Param("startDate")String startDate,@Param("endDate")String endDate,@Param("proName")String proName,HttpServletResponse response) throws IOException{
		try {
			typeName = new String(typeName.getBytes("ISO-8859-1"),"UTF-8");
			proName = new String(proName.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		JFreeChart jChart = businessStatisticsService.drawPicture(type, typeName, startDate, endDate, proName);
		OutputStream os = response.getOutputStream();
		ChartUtilities.writeChartAsPNG(os, jChart, 700, 520);
	}
	
	@RequestMapping(value="/changeconsider",method=RequestMethod.GET)
	@ResponseBody
	public void changeconsider(@Param("type")int type,@Param("typeName")String typeName,
			@Param("startDate")String startDate,@Param("endDate")String endDate,HttpServletResponse response) throws IOException{
		try {
			typeName = new String(typeName.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		JFreeChart jChart = businessStatisticsService.changeConsider(type, typeName, startDate, endDate);
		OutputStream os = response.getOutputStream();
		ChartUtilities.writeChartAsPNG(os, jChart, 700, 520);
	}
	
	//--------------
	@RequestMapping("/consider")
	public String consider(Model model){
		List<ProType> typeList = distributeCenterService.getProType();
		model.addAttribute("typeList",typeList);
		return "consider";
	}
	
	@RequestMapping("/statisticalRequirement")
	public String statisticalRequirement(Model model){
		List<ProType> typeList = distributeCenterService.getProType();
		model.addAttribute("typeList",typeList);
		return "statisticalRequirement";
	}
	
	@RequestMapping("/buy_product")
	public String buyPro(Model model){
		List<ProType> typeList = distributeCenterService.getProType();
		model.addAttribute("typeList",typeList);
		return "buy_product";
	}
	
	@RequestMapping("/inventory_manage")
	public String invMana(Model model){
		List<ProType> typeList = distributeCenterService.getProType();
		model.addAttribute("typeList",typeList);
		return "inventory_manage";
	}
	
	@RequestMapping("/distribute_home")
	public String disHome(){
		return "distribute_home";
	}
	
	@RequestMapping("waerhouse_manage")
	public String whMana(Model model){
		model.addAttribute("disList",distributeCenterService.selectDisList());
		return "waerhouse_manage";
	}
	
	@RequestMapping("outorinto_warehouse")
	public String outOrInto(@Param(value="whId")int whId){
		return "outorinto_warehouse";
	}

	public DistributeCenterService getDistributeCenterService() {
		return distributeCenterService;
	}

	public void setDistributeCenterService(
			DistributeCenterService distributeCenterService) {
		this.distributeCenterService = distributeCenterService;
	}

	public BusinessStatisticsService getBusinessStatisticsService() {
		return businessStatisticsService;
	}

	public void setBusinessStatisticsService(
			BusinessStatisticsService businessStatisticsService) {
		this.businessStatisticsService = businessStatisticsService;
	}
}
