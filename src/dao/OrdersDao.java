package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.OrderState;
import entity.Orders;
import entity.Product;
import entity.User;
import view.OrderPro;
import view.ProductType;

public interface OrdersDao {
	/**
	 * 根据userid,osid,ordername,createdate显示所有订单信息
	 * @return
	 */
	List<OrderPro> queryOrders(@Param("userid") int userid,@Param("osname") String osname,@Param("proname") 
	String proname,@Param("createdate") String createdate,@Param("upper") int upper,
	@Param("lower") int lower);
	/**
	 * 
	 */
	List<OrderPro> queryOrdersList();
	/**
	 * 根据id查USER对象
	 */
	User getUser(int userid);
	/**
	 *根据订单id修改状态
	 */
	void updateOS(@Param("ordid")int ordid,@Param("osid")int osid);
	/**
	 * 根据id 修改分站id
	 */
	void updateSub(@Param("ordid")int ordid,@Param("subId")int subId);
	/**
	 * 添加订单(添加产品)
	 */
	boolean addOrder(@Param("proid") int proid,@Param("proname") String proname,@Param("punit") String punit,
			@Param("proprice") int proprice,@Param("proinfo") String proinfo,@Param("protype") int protype);
	/**
	 * 通过proid获取proname
	 */
	Product getByProid(@Param("proid")int proid);
	/**
	 * 查询商品类型
	 */
	List<ProductType> getPttypt();
	/**
	 * 查询商品名
	 */
	List<ProductType> getProname();
	/**
	 * 根据商品类型查询商品名
	 */
	List<ProductType> getPronameByPttype(@Param("pttype") String pttype);
	
	/**
	 * 根据商品名查询
	 */
	ProductType getByProname(@Param("proname") String proname);
	/**
	 * 填写购买数量(修改)
	 */
	boolean getOrders(@Param("proid") int proid,@Param("buynum") int buynum);
	/**
	 * 查询商品名，商品类型，购买数量，计量单位，单价，用户名，金额，商品说明，备注信息，发货地址
	 */
	ProductType getMany(@Param("ordid") int ordid);
	/**
	 * 订单查询(添加后的订单查询)
	 */
	List<ProductType> getAll(@Param("upper")int upper,@Param("lower")int lower,@Param("userid") int userid);
	/**
	 * 根据proid查询ProductType
	 */
	ProductType getPTByProid(@Param("ordid") int ordid);
	/**
	 * 根据ordid修改buynum
	 */
	boolean updateBuynum(@Param("buynum")int buynum,@Param("ordid") int ordid);
	/**
	 * 根据ordid删除订单
	 */
	boolean delOrders(@Param("ordid")int ordid);
	/**
	 * 订单生成信息
	 */
	List<ProductType> queryAll();
	/**
	 * 根据userid查询对象
	 */
	ProductType quertNew(@Param("proid") int proid);
	/**
	 * 查询订单状态
	 */
	List<OrderState> queryOrderState();
	/**
	 * 根据userid查询订单状态
	 */
	List<OrderState> queryOrderStateByuserid(@Param("userid") int userid);
	/**
	 * 根据userid查询用户的订单(每个客户订购的商品信息)
	 */
	List<ProductType> getPTBYuserid(@Param("userid") int userid,@Param("upper")
	int upper,@Param("lower") int lower);
	/**
	 * 添加订单
	 */
	Integer addOrders(Orders order);
	/**
	 * 与分站结算订单分页
	 * @param upper
	 * @param lower
	 * @param subName
	 * @param proName
	 * @param osname
	 * @return
	 */
	List<OrderPro> getOderPageList(@Param("upper") int upper,@Param("lower") int lower,@Param("subName") String subName,@Param("proName") String proName,@Param("osname") String osname);
	
	/**
	 * 获取与分站结算搜索总记录数
	 * @param subName
	 * @param proName
	 * @param osname
	 * @return
	 */
	List<OrderPro> getOderList(@Param("subName") String subName,@Param("proName") String proName,@Param("osname") String osname);
	
	/**
	 * 根据订单id得到订单
	 * @param ordid
	 * @return
	 */
	OrderPro getOrderByOrdId(@Param("ordid") int ordid);
	

}
