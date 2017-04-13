/**
 * 
 */
package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import service.OrderStateService;
import dao.OrderStateDao;
import entity.OrderState;

/**
 * @author Junhua
 * @ClassName:OrderStateServiceImpl.java
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 公司名称
 * @date 2016年12月14日下午2:48:46
 */
@Service
@Transactional
public class OrderStateServiceImpl implements OrderStateService{
	@Resource
	private OrderStateDao orderStateDao;
	/**
	 * 查询订单所有状态
	 */
	
	public List<OrderState> allOrderState() {
		
		return orderStateDao.allOrderState();
	}

}
