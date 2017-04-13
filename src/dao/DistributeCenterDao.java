package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.BuyPro;
import entity.District;
import entity.ProType;
import entity.Product;
import entity.Substation;
import view.BuyProView;
import view.OutOfOrIntoWareHouse;
import view.ProManage;
import view.WareHouseInfo;

public interface DistributeCenterDao {
	
	/**
	 * 查询商品管理列表分页记录
	 * @param proType 商品类型
	 * @param keyWord 商品名称：模糊关键词
	 * @param upper 分页上限
	 * @param lower 分页下限
	 * @return 
	 */
	public List<ProManage> proManage(@Param("proType")int proType, @Param("keyWord")String keyWord,
			@Param("upper")int upper,@Param("lower")int lower);
	
	/**
	 * 查询商品管理列表记录总数
	 * @param proType 商品类型
	 * @param keyWord 商品名称：模糊关键词
	 * @return
	 */
	public int getProListSize(@Param("proType")int proType, @Param("keyWord")String keyWord);

	/**
	 * 添加新商品类型
	 * @param name
	 * @return
	 */
	public boolean addNewType(@Param("typeName")String name);
	
	/**
	 * 查询商品类型列表
	 * @param ptName 商品类型名称：模糊关键词
	 * @return
	 */
	public List<ProType> getTypeList(@Param("ptName")String ptName);
	
	/**
	 * 修改商品信息
	 * @param proId 商品编号
	 * @param proPrice 商品价格：即将修改为的数值
	 * @param proCost 商品成本：即将修改为的数值
	 * @return
	 */
	public boolean updateProduct(@Param("proId")int proId,@Param("proPrice")int proPrice ,@Param("proCost")int proCost);
	
	/**
	 * 查询指定商品
	 * @param proId 商品编号
	 * @return
	 */
	public List<ProManage> getAnProInfo(@Param("proId") int proId);
	
	/**
	 * 添加新商品
	 * @param product 新商品信息
	 * @return
	 */
	public boolean addNewProduct(Product product);
	
	/**
	 * 查询供应商列表
	 * @param subId 供应商编号：关键词
	 * @param subName 供应商名称：模糊关键词
	 * @return
	 */
	public List<Substation> selectSub(@Param("subId")int subId, @Param("subName")String subName);

	/**
	 * 添加新供应商
	 * @param subName 供应商名称：即将添加的名称
	 * @return
	 */
	public boolean addNewSubstation(@Param("subName")String subName);
	
	/**
	 * 添加新商品到库存列表
	 * @param proId 新商品编号
	 * @return
	 */
	public boolean addNewInventory(@Param("proId")int proId);
	
	/**
	 * 添加新商品到缺货列表
	 * @param proId 新商品编号
	 * @return
	 */
	public boolean addProLack(@Param("proId") int proId);
	
	/**
	 * 查询商品列表
	 * @param proName 商品名称：模糊关键词
	 * @return
	 */
	public List<Product> getProduct(@Param("proName") String proName);
	
	/**
	 * 删除指定商品
	 * @param proId 商品编号：关键词
	 * @return
	 */
	public boolean deleteProduct(@Param("proId")int proId);
	
	/**
	 * 从库存列表中删除指定商品
	 * @param proId 商品编号：关键词
	 * @return
	 */
	public boolean deleteAnInventory(@Param("proId")int proId);
	
	/**
	 * 从缺货列表中删除指定商品
	 * @param proId 商品编号：关键词
	 * @return
	 */
	public boolean deleteAProLack(@Param("proId")int proId);
	
	/**
	 * 查询购货列表
	 * @param proId 商品编号：关键词
	 * @return
	 */
	public List<BuyPro> selectBuyPro(@Param("proId")int proId);
	
	/**
	 * 添加购货请求（新纪录）
	 * @param proId 商品编号
	 * @param proAmount 商品数量
	 * @return
	 */
	public boolean addABuyPro(@Param("proId")int proId,@Param("proAmount")int proAmount);
	
	/**
	 * 添加购货数量
	 * @param proId 商品编号：关键词
	 * @param proAmount 商品数量
	 * @return
	 */
	public boolean addBuyProAmount(@Param("proId")int proId,@Param("proAmount")int proAmount);
	
	/**
	 * 添加新的购货单（在上一张购货单提交的同时）
	 * @return
	 */
	public boolean addNewBuyList();
	
	/**
	 * 查询购货请求列表分页记录
	 * @param ptId 商品类型
	 * @param proName 商品名称：模糊关键词
	 * @param upper 分页上限
	 * @param lower 分页下限
	 * @param bpId 购货编号：关键词（用于更改信息）
	 * @return
	 */
	public List<BuyProView> selectBuyProView(@Param("ptId")int ptId,@Param("proName")String proName,
			@Param("upper")int upper,@Param("lower")int lower,@Param("bpId")int bpId);

	/**
	 * 查询购货请求列表记录总数
	 * @param ptId 商品类型：关键词
	 * @param proName 商品名称：模糊关键词
	 * @return
	 */
	public int selectMaxBPView(@Param("ptId")int ptId,@Param("proName")String proName);
	
	/**
	 * 修改购货请求信息
	 * @param bpId 购货编号：关键词
	 * @param proAmount 商品数量：即将修改为的数值
	 * @return
	 */
	public boolean updateAmount(@Param("bpId")int bpId,@Param("proAmount")int proAmount);
	
	/**
	 * 删除购货请求信息
	 * @param bpId 购货编号
	 */
	public void deleteABuyPro(@Param("bpId")int bpId);
	
	/**
	 * 添加到当前购货单
	 * @param bpId 购货编号
	 */
	public void addToList(@Param("bpId")int bpId);
	
	/**
	 * 补全当前购货单提交的时间
	 * @param blDate 当前时间
	 * @return
	 */
	public boolean doSubmit(@Param("blDate")String blDate);
	
	/**
	 * 查询当前购货单的货物清单
	 * @return
	 */
	public List<BuyProView> getCurrList();
	
	/**
	 * 将购货请求从当前购货单返回到临时清单
	 * @param bpId
	 * @return
	 */
	public boolean returnToList(@Param("bpId")int bpId);
	
	/**
	 * 查询地区列表
	 * @return
	 */
	public List<District> selectDisList();
	
	/**
	 * 查询库房列表分页记录
	 * @param whId 库房编号：关键词
	 * @param disId 所属地区编号：关键词
	 * @param userName 管理者姓名：模糊关键词
	 * @param upper 分页上限
	 * @param lower 分页下限
	 * @return
	 */
	public List<WareHouseInfo> selectWareHouse(@Param("disId")int disId,@Param("userName")String userName,@Param("upper")int upper,@Param("lower")int lower);
	
	/**
	 * 查询库房列表分页记录总数
	 * @param disId 所属地区编号：关键词
	 * @param userName 管理者姓名：模糊关键词
	 * @return
	 */
	public int getMaxRecord(@Param("disId")int disId,@Param("userName")String userName);
	
	/**
	 * 查询出库列表分页记录
	 * @param proName 出库的商品名称：模糊关键词
	 * @param whId 所属库房编号：关键词
	 * @param upper 分页上限
	 * @param lower 分页下限
	 * @return
	 */
	public List<OutOfOrIntoWareHouse> outOfWareList(@Param("proName")String proName,@Param("whId")int whId,@Param("upper")int upper,@Param("lower")int lower);
	
	/**
	 * 查询出库列表分页记录总数
	 * @param proName 出库的商品名称：模糊关键词
	 * @param whId 所属库房编号：关键词
	 * @return
	 */
	public int getOOWListSize(@Param("proName")String proName,@Param("whId")int whId);
	
	/**
	 * 查询入库列表分页记录
	 * @param proName 入库的商品名称：模糊关键词
	 * @param whId 所属库房编号：关键词
	 * @param upper 分页上限
	 * @param lower 分页下限
	 * @return
	 */
	public List<OutOfOrIntoWareHouse> intoWareList(@Param("proName")String proName,@Param("whId")int whId,@Param("upper")int upper,@Param("lower")int lower);
	
	/**
	 * 查询入库列表分页记录总数
	 * @param proName 入库的商品名称：模糊关键词
	 * @param whId 所属库房编号：关键词
	 * @return
	 */
	public int getITWListSize(@Param("proName")String proName,@Param("whId")int whId);
	
}
