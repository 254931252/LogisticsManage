package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.BuyProDao;
import service.BuyProService;
import view.BuyProOder;

/**
 * @author 小峰
 * @ClassName:BuyProServiceImpl.java
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 公司名称
 * @date 2016年12月13日下午3:41:15
 */
@Service
@Transactional
public class BuyProServiceImpl implements BuyProService{
	@Resource
	private BuyProDao buyProDao;
	@Override
	public List<BuyProOder> getBuyProOderPage(@Param("upper") int upper,
			@Param("lower") int lower, @Param("supname") String supname,
			@Param("proname") String proname, @Param("bpstate") String bpstate) {
		
		return buyProDao.getBuyProOderPage(upper, lower, supname, proname, bpstate);
	}
	
	@Override
	public List<BuyProOder> getBuyProOderList(@Param("supname") String supname,
			@Param("proname") String proname, @Param("bpstate") String bpstate) {
		
		return buyProDao.getBuyProOderList(supname, proname, bpstate);
	}

	@Override
	public List<BuyProOder> getBuyStorage(@Param("bpid") int bpid) {
		
		return buyProDao.getBuyStorage(bpid);
	}

	@Override
	public List<BuyProOder> getPagePro(int upper, int lower, int bpid) {
		
		return buyProDao.getPagePro(upper, lower, bpid);
	}

	
	@Override
	public BuyProOder getBuyProOderBy(int bpid) {
		
		return buyProDao.getBuyProOderBy(bpid);
	}

	@Override
	public boolean deleteBuyProOrder(int bpid) {
		
		return buyProDao.deleteBuyProOrder(bpid);
	}

	

	@Override
	public List<BuyProOder> showList() {
		
		return buyProDao.showList();
	}

	@Override
	public List<BuyProOder> showPageList(int upper, int lower, int bpid) {
		
		return buyProDao.showPageList(upper, lower, bpid);
	}

	@Override
	public void updateBuyProState(int bpid, int actualamount) {
		
		buyProDao.updateBuyProState(bpid, actualamount);
	}

	@Override
	public List<BuyProOder> showDeliveringOrderList() {
		
		return buyProDao.showDeliveringOrderList();
	}

	@Override
	public List<BuyProOder> showDeliveringOrderPageList(int upper, int lower, int ordid) {
		
		return buyProDao.showDeliveringOrderPageList(upper, lower, ordid);
	}

	@Override
	public void updateOrderState(int ordid) {
		
		buyProDao.updateOrderState(ordid);
	}

	@Override
	public BuyProOder getBuyProOder(int ordid) {
		
		return buyProDao.getBuyProOder(ordid);
	}

	@Override
	public List<BuyProOder> prinDeliveringOrderList(@Param("subName") String subName,@Param("outtime") String outtime,@Param("proName") String proName) {
		
		return buyProDao.prinDeliveringOrderList(subName, outtime, proName);
	}

	@Override
	public List<BuyProOder> prinDeliveringOrderPageList(int upper,int lower,String subName,String outtime, String proName){
		
		return buyProDao.prinDeliveringOrderPageList(upper, lower, subName, outtime, proName);
	}

	@Override
	public void updateOrderStateIsOut(int ordid) {
		
		buyProDao.updateOrderStateIsOut(ordid);
	}

	@Override
	public List<BuyProOder> printDistribute(String outtime,String proName ){
		
		return buyProDao.printDistribute(outtime, proName);
	}

	@Override
	public List<BuyProOder> printDistrbutePageList(int upper, int lower,
			String outtime, String proName) {
		
		return buyProDao.printDistrbutePageList(upper, lower, outtime, proName);
	}

	@Override
	public BuyProOder getBuyPr(int ordid) {
		
		return buyProDao.getBuyPr(ordid);
	}

	@Override
	public BuyProOder getBuyP(int ordid) {
		
		return buyProDao.getBuyP(ordid);
	}

	@Override
	public void settlement(int bpid) {
		buyProDao.settlement(bpid);
		
	}
	
}
