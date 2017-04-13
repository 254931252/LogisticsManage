package view;

public class OrderPro {

	/**
	 * 客户订购信息查询表
	 */
	private Integer opid;
	private Integer proid;//商品类别
	private Integer ordid;//订单号
	private Integer userid;//客户编号
	private String createdate;//订单生成日期
	private String proname;//商品名称
	private String pttype;//商品类别
	private Integer buynum;//订单购买数量
	private Integer proprice;//单价
	private String osname;//订单状态
	private String cost;//总额
	private String subName;
	public Integer getOpid() {
		return opid;
	}
	public void setOpid(Integer opid) {
		this.opid = opid;
	}
	public String getSubName() {
		return subName;
	}
	public void setSubName(String subName) {
		this.subName = subName;
	}
	public Integer getProid() {
		return proid;
	}
	public void setProid(Integer proid) {
		this.proid = proid;
	}
	public Integer getBuynum() {
		return buynum;
	}
	public void setBuynum(Integer buynum) {
		this.buynum = buynum;
	}
	public String getOsname() {
		return osname;
	}
	public void setOsname(String osname) {
		this.osname = osname;
	}
	public Integer getOrdid() {
		return ordid;
	}
	public void setOrdid(Integer ordid) {
		this.ordid = ordid;
	}
	public String getProname() {
		return proname;
	}
	public void setProname(String proname) {
		this.proname = proname;
	}	
	public Integer getProprice() {
		return proprice;
	}
	public void setProprice(Integer proprice) {
		this.proprice = proprice;
	}	
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public String getCost() {
		return cost;
	}
	public void setCost(String cost) {
		this.cost = cost;
	}
	public String getPttype() {
		return pttype;
	}
	public void setPttype(String pttype) {
		this.pttype = pttype;
	}
	

	
}
