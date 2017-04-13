package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import service.ActionService;
import dao.ActionDao;
import entity.Action;

/**
 * @author 小峰
 * @ClassName:ActionServiceImpl.java
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 公司名称
 * @date 2016年12月15日下午8:27:40
 */
@Service
@Resource
public class ActionServiceImpl implements ActionService{
	@Resource
	private ActionDao actionDao;
	@Override
	public List<Action> getActionListByJurName(String jurName) {
		
		return actionDao.getActionListByJurName(jurName);
	}
	
	@Override
	public List<Action> getActionList() {
		// TODO Auto-generated method stub
		return actionDao.getActionList();
	}

	
	@Override
	public void deleteActionByJurName(String jurName) {
		actionDao.deleteActionByJurName(jurName);
		
	}

	
	@Override
	public void addAction(String jurName, String actName) {
		actionDao.addAction(jurName, actName);
		
	}


	@Override
	public List<Action> getActionTempListByJurName(String jurName) {
		
		return actionDao.getActionTempListByJurName(jurName);
	}

}
