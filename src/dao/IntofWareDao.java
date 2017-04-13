package dao;

import org.apache.ibatis.annotations.Param;

public interface IntofWareDao {
/**
 * 根据产品Id入中心库房
 * @param proid
 * @param proamount
 * @param itwdate
 * @return
 */
	void addproductToCenterWare(@Param("proid") int proid,@Param("proamount")int proamount,@Param("itwdate") String itwdate);
}
