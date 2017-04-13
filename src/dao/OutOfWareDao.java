package dao;

import org.apache.ibatis.annotations.Param;

public interface OutOfWareDao {
	/**
	 * 出库时插入数据到出库表
	 * @param outTime
	 * @param proid
	 * @param buyNum
	 * @param whid
	 * @param taskId
	 * @param olid
	 */
	void addproductToOutWareTable(@Param("outTime") String outTime,@Param("ordid") int ordid,@Param("buyNum") int buyNum,@Param("whid") int whid,@Param("olid") int olid);
}
