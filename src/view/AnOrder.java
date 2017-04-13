package view;

import java.util.List;

import entity.ProNeed;
/**
 * 视图：订单
 * @author 李元卿
 * @ClassName:AnOrder.java
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 中软国际
 * @date 2016年12月13日下午1:35:35
 */
public class AnOrder {

	private int id;//订单号
	private String username;//用户姓名
	private String address;//收货地址
	private List<ProNeed> proList;//商品清单
	private String date;//创建时间
	private String state;//订单状态
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public List<ProNeed> getProList() {
		return proList;
	}
	public void setProList(List<ProNeed> proList) {
		this.proList = proList;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}

}
