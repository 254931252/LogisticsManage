package web.action;

import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import service.BuyProService;
import service.OrdersService;
import service.SubstationService;
import service.SupplierService;
import view.BuyProOder;
import view.OrderPro;
import entity.Substation;
import entity.Supplier;

/**
 * 
 * @author 小峰
 * @ClassName:FinanceAction.java
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 公司名称
 * @date 2016年12月11日下午5:17:53
 */
@Controller
public class FinanceAction {
	@Resource
	private SupplierService supplierService;
	@Resource
	private SubstationService substationService;
	@Resource
	private OrdersService ordersService;
	@Resource
	private BuyProService buyProService;
	@RequestMapping("/finance_index")
	public String index(){
		return "finance_index";
	}
	@RequestMapping("/finance_home")
	public String home(){
		return "finance_home";
	}
	@RequestMapping("/form-validation")
	public String formvValidation(HttpServletRequest request,HttpServletResponse response){
		List<Substation> subList=substationService.allSubstation();
		request.setAttribute("subList", subList);
		
		return "form-validation";
	}
	@RequestMapping("/form-common")
	public String formvCommon(HttpServletRequest request,HttpServletResponse response){
		List<Supplier> list=supplierService.getSupList();
		request.setAttribute("list", list);
		return "form-common";
	}
	
	@RequestMapping(value="/exportExcel")
	public void exportExcel(HttpServletRequest request,HttpServletResponse response,String supname,String proname,String bpstate) throws IOException{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/x-download");
		supname=supname.equals("--请选择--")?"":supname;
		proname=proname==null?"":proname;
		bpstate=bpstate.equals("--请选择--")?"":bpstate;
		List<BuyProOder> list=buyProService.getBuyProOderList(supname, proname, bpstate);
		HSSFWorkbook wb=new HSSFWorkbook();
		response.addHeader("Content-Disposition", "attachment;filename="+new String(("与供应商结算单.xls").getBytes("GB2312"),"iso8859-1"));
		HSSFSheet sheet=wb.createSheet("结算记录");
		sheet.setDefaultRowHeight((short)(2*256));
		sheet.setColumnWidth(2,4000);
		sheet.setColumnWidth(3,4000);
		HSSFFont font=wb.createFont();
		font.setFontName("宋体");
		font.setFontHeightInPoints((short)16);
		HSSFRow row =sheet.createRow((int) 0);
		for(int i=1;i<list.size();i++){
			sheet.createRow(i);
		}
		HSSFCellStyle style=wb.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		HSSFCell cell=row.createCell(0);
		cell.setCellValue("购货单ID");
		cell.setCellStyle(style);
		cell=row.createCell(1);
		cell.setCellValue("商品编号");
		cell.setCellStyle(style);
		cell=row.createCell(2);
		cell.setCellValue("商品名称");
		cell.setCellStyle(style);
		cell=row.createCell(3);
		cell.setCellValue("供应商");
		cell.setCellStyle(style);
		cell=row.createCell(4);
		cell.setCellValue("单价");
		cell.setCellStyle(style);
		cell=row.createCell(5);
		cell.setCellValue("进货数量");
		cell.setCellStyle(style);
		cell=row.createCell(6);
		cell.setCellValue("结算量");
		cell.setCellStyle(style);
		cell=row.createCell(7);
		cell.setCellValue("结算金额");
		cell.setCellStyle(style);
		cell=row.createCell(8);
		cell.setCellValue("结算状态");
		cell.setCellStyle(style);
		
		for(int i=0;i<list.size();i++){
			HSSFRow row1=sheet.createRow(i+1);
			BuyProOder b=list.get(i);
			row1.createCell(0).setCellValue(b.getBpid());
			row1.createCell(1).setCellValue(b.getProid());
			row1.createCell(2).setCellValue(b.getProname());
			row1.createCell(3).setCellValue(b.getSupname());
			row1.createCell(4).setCellValue(b.getProprice());
			row1.createCell(5).setCellValue(b.getProamount());
			row1.createCell(6).setCellValue(b.getProamount());
			row1.createCell(7).setCellValue(b.getProamount()*b.getProprice());
			row1.createCell(8).setCellValue(b.getBpstate());
		}
		try {
			OutputStream out=response.getOutputStream();
			wb.write(out);
			out.close();
			
		} catch (IOException e) {
			System.out.println("====导出excel异常====");
			e.printStackTrace();
			
			
		}
		
	}
	@ResponseBody
	@RequestMapping(value="/buyProOderList",produces="application/json;charset=UTF-8")
	public Map<String,Object> buyProOderList(int upper,int lower,String supname,String proname,String bpstate){
		System.out.println(supname+proname+bpstate);
		supname=supname.equals("--请选择--")?"":supname;
		proname=proname==null?"":proname;
		bpstate=bpstate.equals("--请选择--")?"":bpstate;
		List<BuyProOder> list=buyProService.getBuyProOderPage(upper, lower, supname, proname, bpstate);
		for(BuyProOder b:list){ 
			b.setCost(b.getProprice()*b.getProamount());
		}
		int total=buyProService.getBuyProOderList(supname, proname, bpstate).size();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("total", total);
		map.put("list",list);
		return map;
	}
	@RequestMapping("/form_common_look")
	public String formCommonLook(@Param("bpid") int bpid,HttpServletRequest request){	
		BuyProOder bpo=buyProService.getBuyProOderBy(bpid);
		request.setAttribute("bpo", bpo);
		return "form_common_look";
	}
	@RequestMapping("/form-validation-look")
	public String formValidationLook(@Param("ordid") int ordid,HttpServletRequest request){	
		OrderPro order=ordersService.getOrderByOrdId(ordid);
		request.setAttribute("order", order);
		return "form-validation-look";
	}
	@ResponseBody
	@RequestMapping(value="/settlement",produces="application/json;charset=utf-8")
	public String settlement(int bpid){
		buyProService.settlement(bpid);
		return "true";
	}
	@ResponseBody
	@RequestMapping(value="/subSettlement",produces="application/json;charset=utf-8")
	public String subSettlement(int ordid){
		ordersService.updateOS(ordid, 5);
		return "true";
	}
	
	@ResponseBody
	@RequestMapping(value="/getOderPageList",produces="application/json;charset=utf-8")
	public Map<String,Object> getOderPageList(int upper,int lower,String subName,String proName,String osname){
		subName=subName.equals("中文/拼音")?"":subName;
		proName=proName==null?"":proName;
		osname=osname.equals("--请选择--")?"":osname;
		int total=ordersService.getOderList(subName, proName, osname).size();
		List<OrderPro> list=ordersService.getOderPageList(upper, lower, subName, proName, osname);
		for(OrderPro o:list){
			o.setCost(String.valueOf(o.getBuynum()*o.getProprice()));
			System.out.println(o.getProname());
		}
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("total", total);
		map.put("list", list);

		return map;
	}

}
