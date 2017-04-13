package service;

import java.util.List;
import java.util.Map;

import entity.District;
import entity.ProType;
import view.BuyProView;
import view.ProManage;

public interface DistributeCenterService {

	public List<ProManage> proManage(int proType, String keyWord,int upper,int lower);
	
	public int getProListSize(int proType,String keyWord);
	
	public String updateProduct(int proId,int proPrice ,int proCost);
	
	public List<ProType> getProType();

	public String addNewType(String name);
	
	public ProManage getAnProInfo(int proId);
	
	public String addNewProduct(int proType ,String proSub ,String proName ,String proModel ,int ProPrice ,String proInfo ,int proCost);

	public String deleteProduct(int proId);

	public String addABuyPro(int proId,int proAmount);
	
	public List<BuyProView> selectBuyProView(int ptId,String proName,int upper,int lower,int bpId);
	
	public int selectMaxBPView(int ptId,String proName);
	
	public String updateAmount(int bpId,int proAmount);
	
	public String deleteABuyPro(String bpIdList);
	
	public String addToList(String bpIdList);
	
	public List<BuyProView> getCurrList();
	
	public String returnToList(int bpId);
	
	public String doSubmit();
	
	public List<District> selectDisList();
	
	public Map<String, Object> selectWareHouse(int disId, String userName,int upper,int lower);
	
	public Map<String,Object> selectOutOfOrIntoWarehouseList(String key,String proName,int whId,int upper, int lower);
	
}
