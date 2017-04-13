package view;

import java.io.Serializable;

/**
 * 视图：商品管理
 * @author 李元卿
 * @ClassName:ProManage.java
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 中软国际
 * @date 2016年12月13日下午1:36:49
 */
@SuppressWarnings("serial")
public class ProManage implements Serializable {
	
	private int proId;//编号
	private String ptType;//类型
	private String proName;//名称
	private int proPrice;//单价
	private int costPrice;//进货成本
	private String pmodel;//型号
	private String subname;//厂商
	private String proInfo;//信息
	private int proamount;//库存数量
	private int lackAmount;//缺货数量
	public int getProamount() {
		return proamount;
	}
	public void setProamount(int proamount) {
		this.proamount = proamount;
	}
	public int getLackAmount() {
		return lackAmount;
	}
	public void setLackAmount(int lackAmount) {
		this.lackAmount = lackAmount;
	}
	public int getProId() {
		return proId;
	}
	public void setProId(int proId) {
		this.proId = proId;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public int getProPrice() {
		return proPrice;
	}
	public void setProPrice(int proPrice) {
		this.proPrice = proPrice;
	}
	public String getProInfo() {
		return proInfo;
	}
	public void setProInfo(String proInfo) {
		this.proInfo = proInfo;
	}
	public String getPtType() {
		return ptType;
	}
	public void setPtType(String ptType) {
		this.ptType = ptType;
	}
	public int getCostPrice() {
		return costPrice;
	}
	public void setCostPrice(int costPrice) {
		this.costPrice = costPrice;
	}
	public String getPmodel() {
		return pmodel;
	}
	public void setPmodel(String pmodel) {
		this.pmodel = pmodel;
	}
	public String getSubname() {
		return subname;
	}
	public void setSubname(String subname) {
		this.subname = subname;
	}


}
