package service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.OutOfWareDao;
import service.OutOfWareService;
@Service("outOfWareService")
@Transactional
public class OutOfWareServiceImpl implements OutOfWareService{

	@Resource
	private OutOfWareDao outOfWareDao;
	public void addproductToOutWareTable(String outTime, int ordid, int buyNum,
			int whid, int olid) {
		
		outOfWareDao.addproductToOutWareTable(outTime, ordid, buyNum, whid, olid);
	}

}
