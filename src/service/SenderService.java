/**
 * 
 */
package service;

import java.util.List;

import entity.Senders;

/**
 * @author Junhua
 * @ClassName:SenderService.java
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 公司名称
 * @date 2016年12月14日上午11:04:01
 */
public interface SenderService {

	/**
	 * 查询所有派送员
	 */
	List<Senders> allSender();
}
