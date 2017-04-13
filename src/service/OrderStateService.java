/**
 * 
 */
package service;

import java.util.List;

import entity.OrderState;

/**
 * @author Junhua
 * @ClassName:OderStateService.java
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 公司名称
 * @date 2016年12月14日下午2:46:15
 */
public interface OrderStateService {
	/**
	 * 查询订单所有状态
	 */
	public List<OrderState> allOrderState();
}
