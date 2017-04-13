package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import view.ExtraOow;

public interface OowListDao {
/**
 * 得到所有的分发单
 * @return
 */
	  List<ExtraOow> getAllOowList();
	  List<ExtraOow> getOowList(@Param("oldate") String oldate,@Param("proname") String proname,@Param("pageNumber") Integer pageNumber,@Param("pageSize") Integer pageSize);
	  /**
	   * 添加分发单数据至数据库
	   * @param subId
	   * @param oldate
	   */
	  void addOow(@Param("subId") int subId,@Param("outtime") String outtime);
}
