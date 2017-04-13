package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import view.OrderPro;
import view.OrderToTask;
import view.ShowTask;



/**
 * 
 * @author Junhua
 * @ClassName:TasksMapper.java
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 公司名称
 * @date 2016年12月13日下午1:52:04
 */
public interface TasksDao {
	/**
	 * 查询添加任务单（新订单）--（调度中心）
	 */
	List<OrderToTask> newOrderList(@Param("top") int top,@Param("down") int down,@Param("createDate") String createDate,@Param("subName") String subName);
	/**
	 * 查询添加任务单（新订单）记录数--（调度中心）
	 */
	Integer newOrderCount(@Param("createDate") String createDate,@Param("subName") String subName);

	/**
	 * 查询订单详情--（调度中心）
	 */
	OrderToTask oneOrder(@Param("id") Integer ordId);
	/**
	 * 添加任务单--(调度中心）
	 */
	void addTask(@Param("ordid") Integer ordid,@Param("newSub") Integer newSub,@Param("doTaskId") Integer doTaskId);
	/**
	 * 查询所有订单--（调度中心）
	 */
	List<OrderToTask> allOrder(@Param("top") Integer top, @Param("down") Integer down,@Param("taskId") Integer taskId,
			@Param("createDate") String createDate,@Param("orderState") Integer orderState,@Param("subId") Integer subId);
	/**
	 * 查询所有订单的记录数--（调度中心）
	 */
	Integer allOrderCount(@Param("top") Integer top, @Param("down") Integer down,@Param("taskId") Integer taskId,
			@Param("createDate") String createDate,@Param("orderState") Integer orderState,@Param("subId") Integer subId);
	/**
	 * 需修改任务单状态的订单--（调度中心）
	 */
	List<OrderToTask> dispatchUpdate(@Param("top") Integer top, @Param("down") Integer down);
	/**
	 * 需修改任务单状态的订单记录数
	 */
	Integer dispatchUpdateCount();
	/**
	 * 查询所有任务单
	 */
	List<ShowTask> allTask(@Param("top") Integer top, @Param("down") Integer down,@Param("taskId") Integer taskId,
			@Param("createDate") String createDate,@Param("sender") Integer sender,@Param("orderState") Integer orderState,@Param("district") Integer district);
	/**
	 * 查询任务单记录数
	 */
	Integer tasksCount(@Param("taskId") Integer taskId,@Param("createDate") String createDate,@Param("sender") Integer sender,
			@Param("orderState") Integer orderState,@Param("district") Integer district);
	/**
	 * 查询所有派发任务单
	 */
	List<ShowTask> allTask2(@Param("top") Integer top, @Param("down") Integer down,@Param("taskId") Integer taskId,
			@Param("createDate") String createDate,@Param("sender") Integer sender,@Param("orderState") Integer orderState,@Param("district") Integer district);
	/**
	 * 查询派发任务单记录数
	 */
	Integer tasksCount2(@Param("taskId") Integer taskId,@Param("createDate") String createDate,@Param("sender") Integer sender,
			@Param("orderState") Integer orderState,@Param("district") Integer district);

	/*
	 * 查询任务单详情
	 */
	ShowTask oneTask(Integer id);
	/**
	 * 删除一条任务单
	 */
	void doDeleteTask(@Param("id") Integer id);
	/**
	 * 分配或中转任务
	 */
	void doDistribut(@Param("sender") int sender,@Param("substation") int substation,@Param("taskId") int taskId);
	/**
	 * 查看订单商品信息
	 */
	OrderPro productInfo(int ordid);
	/**
	 * 签收单查询
	 */
	List<OrderPro> productTask(int top,int down,@Param("proname") String proname);
	/**
	 * 签收单记录数
	 */
	Integer productTaskCount(@Param("proname") String proname);
}