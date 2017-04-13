package service.impl;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.OowListDao;
import service.OowListService;

@Service("oowListService")
@Transactional
public class OowListServiceImpl implements OowListService{

	@Resource
	private OowListDao oowListDao;
	public void addOow(int subId, String outtime) {
		
		oowListDao.addOow(subId, outtime);
	}

}
