package service.impl;

import java.util.List;

import javax.annotation.Resource;
/**
 * @author 谢威
 * @ClassName:OrdersServiceImpl.java
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 订单
 * @date 
 */













import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.OrdersDao;
import entity.OrderState;
import entity.Orders;
import entity.Product;
import entity.User;
import service.OrdersService;
import view.OrderPro;
import view.ProductType;
@Service
@Transactional
public class OrdersServiceImpl implements OrdersService {
	@Resource
	private OrdersDao ordersDao;

	@Override
	public List<OrderPro> queryOrders(@Param("userid") int userid,@Param("osname") String osname,
			@Param("proname") String proname,@Param("createdate") String createdate, 
			@Param("upper") int upper,@Param("lower") int lower) {
		// TODO Auto-generated method stub
		return ordersDao.queryOrders(userid, osname, proname, createdate, upper, lower);
	}

	@Override
	public List<OrderPro> queryOrdersList() {
		// TODO Auto-generated method stub
		return ordersDao.queryOrdersList();
	}

	@Override
	public User getUser(int userid) {
		// TODO Auto-generated method stub
		return ordersDao.getUser(userid);
	}
	

	/**
	 *根据订单id修改状态
	 */
	public void updateOS(@Param("ordid")int ordid,@Param("osid")int osid){
		ordersDao.updateOS(ordid, osid);
	}
	/**
	 * 根据id 修改分站id
	 */
	public void updateSub(@Param("ordid")int ordid,@Param("subId")int subId){
		ordersDao.updateSub(ordid, subId);
	}

	@Override
	public ProductType getByProname(String proname) {
		// TODO Auto-generated method stub
		return ordersDao.getByProname(proname);
	}

	/**
	 * 查询商品类型
	 */
	public List<ProductType> getPttypt() {
		// TODO Auto-generated method stub
		return ordersDao.getPttypt();
	}

	/**
	 * 查询商品名
	 */	
	public List<ProductType> getProname() {
		// TODO Auto-generated method stub
		return ordersDao.getProname();
	}

	@Override
	public List<ProductType> getPronameByPttype(String pttype) {
		// TODO Auto-generated method stub
		return ordersDao.getPronameByPttype(pttype);
	}

	@Override
	public Product getByProid(int proid) {
		// TODO Auto-generated method stub
		return ordersDao.getByProid(proid);
	}

	@Override
	public boolean addOrder(int proid, String proname, String punit,
			int proprice, String proinfo, int protype) {
		// TODO Auto-generated method stub
		return ordersDao.addOrder(proid, proname, punit, proprice, proinfo, protype);
	}

	@Override
	public boolean getOrders(int proid,int buynum) {
		// TODO Auto-generated method stub
		return ordersDao.getOrders(proid,buynum);
	}

	/**
	 * 查询商品名，商品类型，购买数量，计量单位，单价，用户名，金额，商品说明，备注信息，发货地址
	 */
	public ProductType getMany(int ordid) {
		// TODO Auto-generated method stub
		return ordersDao.getMany(ordid);
	}

	@Override
	public List<ProductType> getAll(int upper, int lower,int userid) {
		// TODO Auto-generated method stub
		return ordersDao.getAll(upper, lower,userid);
	}

	@Override
	public ProductType getPTByProid(int proid) {
		// TODO Auto-generated method stub
		return ordersDao.getPTByProid(proid);
	}

	@Override
	public boolean updateBuynum(int buynum, int ordid) {
		// TODO Auto-generated method stub
		return ordersDao.updateBuynum(buynum, ordid);
	}

	@Override
	public boolean delOrders(int proid) {
		// TODO Auto-generated method stub
		return ordersDao.delOrders(proid);
	}

	@Override
	public List<ProductType> queryAll() {
		// TODO Auto-generated method stub
		return ordersDao.queryAll();
	}

	@Override
	public ProductType quertNew(int proid) {
		// TODO Auto-generated method stub
		return ordersDao.quertNew(proid);
	}

	@Override
	public List<OrderState> queryOrderState() {
		// TODO Auto-generated method stub
		return ordersDao.queryOrderState();
	}

	@Override
	public List<ProductType> getPTBYuserid(int userid, int upper, int lower) {
		// TODO Auto-generated method stub
		return ordersDao.getPTBYuserid(userid, upper, lower);
	}

	@Override
	public List<OrderState> queryOrderStateByuserid(int userid) {
		// TODO Auto-generated method stub
		return ordersDao.queryOrderStateByuserid(userid);
	}
	@Override
	public List<OrderPro> getOderPageList(int upper, int lower, String subName,
			String proName, String osname) {
		
		return ordersDao.getOderPageList(upper, lower, subName, proName, osname);
	}

	@Override
	public List<OrderPro> getOderList(String subName, String proName,
			String osname) {
		
		return ordersDao.getOderList(subName, proName, osname);
	}

	
	@Override
	public OrderPro getOrderByOrdId(int ordid) {
		
		return ordersDao.getOrderByOrdId(ordid);
	}

	@Override
	public boolean addOrders(Orders order) {
		if(ordersDao.addOrders(order)>0){
			return true;
		}
		return false;
	}
	

	
	
	
	
	



	

	
}
