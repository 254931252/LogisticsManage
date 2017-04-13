package service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import service.InfoWareService;
import dao.IntofWareDao;

@Service()
@Transactional
public class InfoWareServiceImpl implements InfoWareService{

	@Resource
	private IntofWareDao intofWareDao;
	
	
	public IntofWareDao getIntofWareDao() {
		return intofWareDao;
	}


	public void setIntofWareDao(IntofWareDao intofWareDao) {
		this.intofWareDao = intofWareDao;
	}


	public void addproductToCenterWare(int proid, int proamount, String itwdate) {
		
		intofWareDao.addproductToCenterWare(proid, proamount, itwdate);
	}

}
