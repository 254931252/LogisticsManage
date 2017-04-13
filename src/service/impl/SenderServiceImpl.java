/**
 * 
 */
package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.SendersDao;
import service.SenderService;
import entity.Senders;

/**
 * @author Junhua
 * @ClassName:SenderServiceImpl.java
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 公司名称
 * @date 2016年12月14日上午11:05:10
 */
@Service
@Transactional
public class SenderServiceImpl implements SenderService {
	@Resource
	private SendersDao sendersDao;
	/**
      * 查询所有派送员
      */
	  public List<Senders> allSender(){
	
		  return sendersDao.allSender();
	  }

}
