package view;

public class BuyProView {
	
	private int bpId;//购货编号
	private int proId;//商品编号
	private int proType;//商品类型ID
	private String proName;//商品名称
	private int costPrice;//进货成本
	private int proAmount;//购入数量
	public int getBpId() {
		return bpId;
	}
	public void setBpId(int bpId) {
		this.bpId = bpId;
	}
	public int getProId() {
		return proId;
	}
	public void setProId(int proId) {
		this.proId = proId;
	}
	public int getProType() {
		return proType;
	}
	public void setProType(int proType) {
		this.proType = proType;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public int getCostPrice() {
		return costPrice;
	}
	public void setCostPrice(int costPrice) {
		this.costPrice = costPrice;
	}
	public int getProAmount() {
		return proAmount;
	}
	public void setProAmount(int proAmount) {
		this.proAmount = proAmount;
	}
	

}
