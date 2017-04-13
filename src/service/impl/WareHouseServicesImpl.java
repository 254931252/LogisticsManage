package service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.WareHouseDao;
import service.WareHouseService;
@Service("wareHouseService")
@Transactional
public class WareHouseServicesImpl implements WareHouseService{

	@Resource
	private WareHouseDao wareHouseDao;

	@Override
	public int getBuyProOderById(String subName) {
		
		return wareHouseDao.getBuyProOderById(subName);
	}
	

}
