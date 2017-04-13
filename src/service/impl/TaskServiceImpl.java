/**
 * 
 */
package service.impl;



import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import service.TasksService;
import view.OrderPro;
import view.OrderToTask;
import view.ShowTask;
import dao.TasksDao;

/**
 * @author Junhua
 * @ClassName:TaskServiceImpl.java
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 公司名称
 * @date 2016年12月13日下午2:47:06
 */
@Service
@Transactional
public class TaskServiceImpl implements TasksService {
	@Resource
	private TasksDao tasksDao;
	/* 
	 * 查询所有任务单
	 */
	
	
	public List<ShowTask> allTask(@Param("top") Integer top, @Param("down") Integer down,@Param("taskId") Integer taskId,
			@Param("createDate")	String createDate,@Param("sender") Integer sender,@Param("orderState") Integer orderState,@Param("district") Integer district) {
		
		return tasksDao.allTask(top, down, taskId, createDate, sender, orderState,district);
	}

	/* 
	 * 查询任务单记录数
	 */
	@Override
	public Integer tasksCount(@Param("taskId") Integer taskId,@Param("createDate") String createDate,@Param("sender") Integer sender,
			@Param("orderState") Integer orderState,@Param("district") Integer district) {
		
		return tasksDao.tasksCount(taskId, createDate, sender, orderState, district);
	}
	/**
	 * 查询所有派发任务单
	 */
	public List<ShowTask> allTask2(@Param("top") Integer top, @Param("down") Integer down,@Param("taskId") Integer taskId,
			@Param("createDate") String createDate,@Param("sender") Integer sender,@Param("orderState") Integer orderState,@Param("district") Integer district){

		return tasksDao.allTask2(top, down, taskId, createDate, sender, orderState,district);
		
	}
	/**
	 * 查询派发任务单记录数
	 */
	public Integer tasksCount2(@Param("taskId") Integer taskId,@Param("createDate") String createDate,@Param("sender") Integer sender,
			@Param("orderState") Integer orderState,@Param("district") Integer district){
		

		return tasksDao.tasksCount2(taskId, createDate, sender, orderState, district);
	}

	
	/*
	 * 查询任务单详情
	 */
	public ShowTask oneTask(Integer id) {
		
		return tasksDao.oneTask(id);
	}
	/* (non-Javadoc)
	 * 删除一条任务单
	 */
	
	public void doDelete(Integer id) {
		
		tasksDao.doDeleteTask(id);
		
	}

	/**
	 * 签收单查询
	 */
	public List<OrderPro> productTask(int top,int down,@Param("proname") String proname){
		
		return tasksDao.productTask(top, down, proname);
	}
	/**
	 * 签收单记录数
	 */
	public Integer productTaskCount(@Param("proname") String proname){
		return tasksDao.productTaskCount(proname);
	}

	/* 
	 * 任务分发与中转
	 */
	
	public void doDistribut(int sender, int substation, int taskId) {
		tasksDao.doDistribut(sender, substation, taskId);
		
	}
	/**
	 * 查看订单商品信息
	 */
	public OrderPro productInfo(int ordid){
		
		return tasksDao.productInfo(ordid);
	}
	/**
	 * 查询添加任务单（新订单）--（调度中心）
	 */
	public List<OrderToTask> newOrderList(int top,int down,String createDate,String subName){
		
		return tasksDao.newOrderList(top, down, createDate, subName);
	}
	/**
	 * 查询添加任务单（新订单）记录数--（调度中心）
	 */
	public Integer newOrderCount(String createDate,String subName){
		return tasksDao.newOrderCount(createDate, subName);
	}

	/**
	 * 查询订单详情--（调度中心）
	 */
	public OrderToTask oneOrder(Integer ordId){
		
		return tasksDao.oneOrder(ordId);
	}

	/**
	 * 添加任务单--(调度中心）
	 */
	public void addTask(@Param("ordid") Integer ordid,@Param("newSub") Integer newSub,
			@Param("doTaskId") Integer doTaskId){
		tasksDao.addTask(ordid, newSub, doTaskId);
		
	}

	/**
	 * 查询所有订单--（调度中心）
	 */
	public List<OrderToTask> allOrder(@Param("top") Integer top, @Param("down") Integer down,@Param("taskId") Integer taskId,
			@Param("createDate") String createDate,@Param("orderState") Integer orderState,@Param("subId") Integer subId){
		
		return tasksDao.allOrder(top, down, taskId, createDate, orderState, subId);
	}

	/**
	 * 查询所有订单的记录数--（调度中心）
	 */
	public Integer allOrderCount(@Param("top") Integer top, @Param("down") Integer down,@Param("taskId") Integer taskId,
			@Param("createDate") String createDate,@Param("orderState") Integer orderState,@Param("subId") Integer subId) {
		
		return tasksDao.allOrderCount(top, down, taskId, createDate, orderState, subId);
	}
	/**
	 * 需修改任务单状态的订单--（调度中心）
	 */
	public List<OrderToTask> distpachUpdate(@Param("top") Integer top, @Param("down") Integer down){
		return tasksDao.dispatchUpdate(top, down);
	}
	/**
	 * 需修改任务单状态的订单记录数
	 */
	public Integer dispatchUpdateCount(){
		return tasksDao.dispatchUpdateCount();
	}

}
