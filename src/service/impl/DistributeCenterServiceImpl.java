package service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.DistributeCenterDao;
import entity.District;
import entity.ProType;
import entity.Product;
import entity.Substation;
import service.DistributeCenterService;
import view.BuyProView;
import view.OutOfOrIntoWareHouse;
import view.ProManage;

@Service
@Transactional
public class DistributeCenterServiceImpl implements DistributeCenterService {

	@Resource
	private DistributeCenterDao distributeCenterDao;

	public DistributeCenterDao getDistributeCenterDao() {
		return distributeCenterDao;
	}

	public void setDistributeCenterDao(DistributeCenterDao distributeCenterDao) {
		this.distributeCenterDao = distributeCenterDao;
	}
	//----------------------
	
	@Override
	public List<ProManage> proManage(int proType, String keyWord,int upper,int lower){
		return distributeCenterDao.proManage(proType, keyWord,upper,lower);
	}
	
	@Override
	public List<ProType> getProType(){
		return distributeCenterDao.getTypeList("");
	}
	
	@Override
	public String addNewType(String name){
		if(distributeCenterDao.getTypeList(name).size() == 0){
			if(distributeCenterDao.addNewType(name)){
				return "success";
			}
		}
		return "";
	}
	
	@Override
	public String deleteProduct(int proId){
		ProManage proManage = distributeCenterDao.getAnProInfo(proId).get(0);
		if(proManage.getLackAmount() == 0 && proManage.getProamount() == 0){
			if(distributeCenterDao.deleteAnInventory(proId) && distributeCenterDao.deleteAProLack(proId)){
				distributeCenterDao.deleteProduct(proId);
				return "success";
			}
		}
		return "";
	}

	@Override
	public ProManage getAnProInfo(int proId) {
		return distributeCenterDao.getAnProInfo(proId).get(0);
	}

	@Override
	public String addNewProduct(int proType, String proSub, String proName,
			String proModel, int ProPrice, String proInfo, int proCost) {
		if(distributeCenterDao.getProduct(proName).size() == 0){
			Product product = new Product();
			product.setCostprice(proCost);
			product.setPmodel(proModel);
			product.setProinfo(proInfo);
			product.setProname(proName);
			product.setProtype(proType);
			product.setProprice(ProPrice);
			List<Substation> list = distributeCenterDao.selectSub(0,proSub);
			if(list.size() == 0){
				distributeCenterDao.addNewSubstation(proSub);
				list = distributeCenterDao.selectSub(0, proSub);
			}
			product.setSupid(list.get(0).getSubId());
			if(distributeCenterDao.addNewProduct(product)){
				int proId = distributeCenterDao.getProduct(proName).get(0).getProid();
				if(distributeCenterDao.addNewInventory(proId) && distributeCenterDao.addProLack(proId)){
					return "success";
				}
			}
		}
		return "";
	}

	@Override
	public int getProListSize(int proType, String keyWord) {
		return distributeCenterDao.getProListSize(proType, keyWord);
	}

	@Override
	public String updateProduct(int proId, int proPrice, int proCost) {
		if(distributeCenterDao.updateProduct(proId, proPrice, proCost)){
			return "success";
		}
		return "";
	}

	@Override
	public String addABuyPro(int proId, int proAmount) {
		if(distributeCenterDao.selectBuyPro(proId).size() == 0){
			if(distributeCenterDao.addABuyPro(proId, proAmount)){
				return "success";
			}
		}else{
			if(distributeCenterDao.addBuyProAmount(proId, proAmount)){
				return "success";
			}
		}
		return "";
	}

	@Override
	public List<BuyProView> selectBuyProView(int ptId,String proName,int upper,int lower,int bpId) {
		return distributeCenterDao.selectBuyProView(ptId,proName,upper,lower,bpId);
	}

	@Override
	public int selectMaxBPView(int ptId, String proName) {
		return distributeCenterDao.selectMaxBPView( ptId, proName);
	}

	@Override
	public String updateAmount(int bpId, int proAmount) {
		return distributeCenterDao.updateAmount(bpId, proAmount)?"success":"";
	}
	
	@Override
	public String deleteABuyPro(String bpIdList){
		String[] list = bpIdList.split(",");
		for (String li : list) {
			int bpId = Integer.parseInt(li);
			try {
				distributeCenterDao.deleteABuyPro(bpId);
			} catch (Exception e) {
				e.printStackTrace();
				return "";
			}
		}
		return "success";
	}
	
	@Override
	public String addToList(String bpIdList){
		String[] list = bpIdList.split(",");
		for (String li : list) {
			int bpId = Integer.parseInt(li);
			try {
				distributeCenterDao.addToList(bpId);
			} catch (Exception e) {
				e.printStackTrace();
				return "";
			}
		}
		return "success";
	}
	
	public List<BuyProView> getCurrList(){
		return distributeCenterDao.getCurrList();
	}
	
	public String returnToList(int bpId){
		return distributeCenterDao.returnToList(bpId)?"success":"";
	}

	@Override
	public String doSubmit() {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String blDate = sdf.format(date);
		if(distributeCenterDao.doSubmit(blDate)){
			if(distributeCenterDao.addNewBuyList()){
				return "success";
			}
		}
		return "";
	}
	
	public List<District> selectDisList(){
		return distributeCenterDao.selectDisList();
	}
	
	public Map<String, Object> selectWareHouse(int disId, String userName,int upper,int lower){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", distributeCenterDao.selectWareHouse(disId, userName, upper, lower));
		map.put("total",distributeCenterDao.getMaxRecord(disId, userName));
		return map;
	}
	
	public Map<String,Object> selectOutOfOrIntoWarehouseList(String key,String proName,int whId,int upper, int lower){
		Map<String, Object> map = new HashMap<String, Object>();
		List<OutOfOrIntoWareHouse> list = null;
		int total = 0;
		if("出库".equals(key)){
			list = distributeCenterDao.outOfWareList(proName, whId, upper, lower);
			total = distributeCenterDao.getOOWListSize(proName, whId);
		}else{
			list = distributeCenterDao.intoWareList(proName, whId, upper, lower);
			total = distributeCenterDao.getITWListSize(proName, whId);
		}
		for (OutOfOrIntoWareHouse outOfOrIntoWareHouse : list) {
			outOfOrIntoWareHouse.setInOrOut(key);
		}
		map.put("total", total);
		map.put("list", list);
		return map;
	}
	
}
	
