package view;

/**
 * @author 小峰
 * @ClassName:BuyProOder.java
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 公司名称
 * @date 2016年12月13日下午3:22:29
 */
public class BuyProOder {    //购货单视图
	private Integer bpid;//购货单id
	private Integer proid;//商品id
	private String proname;
	private String supname;
	private Integer  proprice;//产品售价
	private Integer proamount;//应入库数量
	private Integer cost;
	private Integer actualamount;//实际入库数量
	private String pmodel;//货物型号
	private String itwdate;//入库时间
	private String punit;//计量单号
	private Integer buyNum;//订单购买数量
	private String createDate;//订单生成时间
	private String outWareDate;//出库时间
	private Integer ordid;//订单id
	private Integer totalprice;//总金额
	private Integer whid;//库房id
	private Integer taskId;//任务单id
	private Integer olid;//分发单id
	private String whname;//库房名称
	private Integer actualOutAmount;//实际出库数量
	private String subName;
	private String outtime;
	private String bpstate;
	private String protype;
	public String getOuttime() {
		return outtime;
	}
	public String getBpstate() {
		return bpstate;
	}
	public void setBpstate(String bpstate) {
		this.bpstate = bpstate;
	}
	public String getProtype() {
		return protype;
	}
	public void setProtype(String protype) {
		this.protype = protype;
	}
	public void setOuttime(String outtime) {
		this.outtime = outtime;
	}
	public Integer getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(Integer totalprice) {
		this.totalprice = totalprice;
	}
	
	public String getSubName() {
		return subName;
	}
	public void setSubName(String subName) {
		this.subName = subName;
	}
	public Integer getActualOutAmount() {
		return actualOutAmount;
	}
	public void setActualOutAmount(Integer actualOutAmount) {
		this.actualOutAmount = actualOutAmount;
	}
	public String getWhname() {
		return whname;
	}
	public void setWhname(String whname) {
		this.whname = whname;
	}
	public Integer getBpid() {
		return bpid;
	}
	public void setBpid(Integer bpid) {
		this.bpid = bpid;
	}
	public Integer getProid() {
		return proid;
	}
	public void setProid(Integer proid) {
		this.proid = proid;
	}
	public String getProname() {
		return proname;
	}
	public void setProname(String proname) {
		this.proname = proname;
	}
	public String getSupname() {
		return supname;
	}
	public void setSupname(String supname) {
		this.supname = supname;
	}
	public Integer getProprice() {
		return proprice;
	}
	public void setProprice(Integer proprice) {
		this.proprice = proprice;
	}
	public Integer getProamount() {
		return proamount;
	}
	public void setProamount(Integer proamount) {
		this.proamount = proamount;
	}
	public Integer getCost() {
		return cost;
	}
	public void setCost(Integer cost) {
		this.cost = cost;
	}
	public Integer getActualamount() {
		return actualamount;
	}
	public void setActualamount(Integer actualamount) {
		this.actualamount = actualamount;
	}
	public String getPmodel() {
		return pmodel;
	}
	public void setPmodel(String pmodel) {
		this.pmodel = pmodel;
	}
	public String getItwdate() {
		return itwdate;
	}
	public void setItwdate(String itwdate) {
		this.itwdate = itwdate;
	}
	public String getPunit() {
		return punit;
	}
	public void setPunit(String punit) {
		this.punit = punit;
	}
	public Integer getBuyNum() {
		return buyNum;
	}
	public void setBuyNum(Integer buyNum) {
		this.buyNum = buyNum;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getOutWareDate() {
		return outWareDate;
	}
	public void setOutWareDate(String outWareDate) {
		this.outWareDate = outWareDate;
	}
	public Integer getOrdid() {
		return ordid;
	}
	public void setOrdid(Integer ordid) {
		this.ordid = ordid;
	}
	public Integer getWhid() {
		return whid;
	}
	public void setWhid(Integer whid) {
		this.whid = whid;
	}
	public Integer getTaskId() {
		return taskId;
	}
	public void setTaskId(Integer taskId) {
		this.taskId = taskId;
	}
	public Integer getOlid() {
		return olid;
	}
	public void setOlid(Integer olid) {
		this.olid = olid;
	}
	
}
