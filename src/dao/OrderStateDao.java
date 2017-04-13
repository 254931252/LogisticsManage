package dao;

import java.util.List;

import entity.OrderState;

/**
 * 
 * @author Junhua
 * @ClassName:OrderStateDao.java
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 公司名称
 * @date 2016年12月14日下午2:43:13
 */
public interface OrderStateDao {
	/*
	 * 查询订单状态
	 */
	List<OrderState> allOrderState();
}
