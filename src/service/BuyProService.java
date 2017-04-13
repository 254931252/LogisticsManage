package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import view.BuyProOder;

/**
 * @author 小峰
 * @ClassName:BuyProService.java
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 公司名称
 * @date 2016年12月13日下午3:40:08
 */
public interface BuyProService {
	List<BuyProOder> getBuyProOderPage(@Param("upper") int upper,
			@Param("lower") int lower, @Param("supname") String supname,
			@Param("proname") String proname, @Param("bpstate") String bpstate);

	List<BuyProOder> getBuyProOderList(@Param("supname") String supname,
			@Param("proname") String proname, @Param("bpstate") String bpstate);
	List<BuyProOder>  getBuyStorage(@Param("bpid") int bpid);
	List<BuyProOder> getPagePro(@Param("upper") int upper,@Param("lower") int lower,@Param("bpid") int bpid);
	BuyProOder getBuyProOderBy(@Param("bpid") int bpid);
	boolean deleteBuyProOrder(@Param("bpid") int bpid);
	   void updateBuyProState(@Param("bpid") int bpid,@Param("actualamount") int actualamount);
	 /**
     * 已入库的状态得到的list.size获取总记录数
     * @return
     */
    List<BuyProOder> showList();
    /**
     * 获取状态为已入库的货物分页list
     * @param upper
     * @param lower
     * @param bpid
     * @return
     */
    List<BuyProOder> showPageList(@Param("upper") int upper,@Param("lower") int lower,@Param("bpid") int bpid);
    /**
     * 获取所有正在配送的列表
     * @return
     */
    List<BuyProOder> showDeliveringOrderList();
    BuyProOder getBuyP(@Param("ordid") int ordid);
    /**
     * 分页的配送列表
     * @param upper
     * @param lower
     * @return
     */
    List<BuyProOder> showDeliveringOrderPageList(@Param("upper") int upper,@Param("lower") int lower,@Param("ordid") int ordid);
    /**
     * 根据订单编号修改更新订单状态
     * @param bpid
     */
    void updateOrderState(@Param("ordid") int ordid);
    /**
     * 根据订单编号更新订单状态为已出库状态
     * @param ordid
     */
    void updateOrderStateIsOut(@Param("ordid") int ordid);
    
    /**
  	 * 根据订单id查找视图
  	 * @param bpid
  	 * @return
  	 */
  	BuyProOder getBuyProOder(@Param("ordid") int ordid);
  	
  	/**
	 * 根据订单id获取可出库后的视图
	 * @param ordid
	 * @return
	 */
	BuyProOder getBuyPr(@Param("ordid") int ordid);
  	/**
	 * 获取可出库状态的打印List
	 * @return
	 */
	List<BuyProOder> prinDeliveringOrderList(@Param("subName") String subName,@Param("outtime") String outtime,@Param("proName") String proName);
	/**
	 * 获取可出库状态的打印分页List
	 * @param upper
	 * @param lower
	 * @param ordid
	 * @return
	 */
	List<BuyProOder> prinDeliveringOrderPageList(@Param("upper") int upper,@Param("lower") int lower,@Param("subName") String subName,@Param("outtime") String outtime,@Param("proName") String proName);
	/**
	 * 获取可出库的状态的分单列表
	 * @param outtime
	 * @param proName
	 * @return
	 */
	List<BuyProOder> printDistribute(@Param("outtime") String outtime,@Param("proName") String proName );
	/**
	 * 获取可出库的状态的分单分页列表
	 * @param upper
	 * @param lower
	 * @param outtime
	 * @param proName
	 * @return
	 */
	List<BuyProOder> printDistrbutePageList(@Param("upper") int upper, @Param("lower") int lower ,@Param("outtime") String outtime,@Param("proName") String proName );
	 void settlement(@Param("bpid") int bpid);
}

