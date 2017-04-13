package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import view.BuyProOder;

/**
 * @author 小峰
 * @ClassName:BuyProDao.java
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 公司名称
 * @date 2016年12月13日下午11:34:33
 */
public interface BuyProDao {
	/**
	 * 查询购货单表
	 * @param upper 上限
	 * @param lower	下限
	 * @param supname
	 * @param proname
	 * @param bpstate
	 * @return
	 */
	List<BuyProOder> getBuyProOderPage(@Param("upper") int upper,
			@Param("lower") int lower, @Param("supname") String supname,
			@Param("proname") String proname, @Param("bpstate") String bpstate);
	List<BuyProOder> getBuyProOderList(@Param("supname") String supname,
			@Param("proname") String proname, @Param("bpstate") String bpstate);
	/**
	 * 中心库房购货入库   @Annie 根据 获取的入库列表.size获取total总记录数
	 * @return
	 */
	List<BuyProOder> getBuyStorage(@Param("bpid") int bpid);
	/**
	 * 中心库房购货入库   @Annie   根据购物id获得分页的列表
	 * @param upper
	 * @param bpid
	 * @return
	 */
	List<BuyProOder> getPagePro(@Param("upper") int upper,
			@Param("lower") int lower,@Param("bpid") int bpid);
	/**
	 * 根据购货单id查找购货单
	 * @param bpid
	 * @return
	 */
	BuyProOder getBuyProOderBy(@Param("bpid") int bpid);
	/**
	 * 根据购货单id删除对应购货单@Annie
	 * @param bpid
	 * @return
	 */
    boolean deleteBuyProOrder(@Param("bpid") int bpid);
    /**
     * 根据id将默认状态修改成已入库 @Annie
     * @param bpstate
     */
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
    /**
     * 分页的配送列表
     * @param upper
     * @param lower
     * @return
     */
    List<BuyProOder> showDeliveringOrderPageList(@Param("upper") int upper,@Param("lower") int lower,@Param("ordid") int ordid);
    /**
     * 根据购货单号更新订单状态为可出库状态
     * @param bpid
     */
    void updateOrderState(@Param("ordid") int ordid);

    /**
     * 根据购货单id结算
     * @param bpid
     */
    void settlement(@Param("bpid") int bpid);
    /**
     * 根据购货单号更新订单状态为已出库状态
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
	BuyProOder getBuyP(@Param("ordid") int ordid);
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
}
