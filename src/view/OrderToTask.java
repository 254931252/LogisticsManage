/**
 * 
 */
package view;

/**
 * @author Junhua
 * @ClassName:OrderToTask.java
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 公司名称
 * @date 2016年12月16日上午11:38:46
 */
public class OrderToTask {
	/**
	 * 订单号
	 */
    private Integer ordid;
    private Integer taskId;
    private Integer doTaskId;
    /**
     * 所属用户
     */
    private Integer userid;
    /**
     * 订单状态
     */
    private Integer osid;

    private String osname;
    /**
     * 订单生成日期
     */
    private String createdate;
    /**
     * 货物id
     * @return
     */
    private Integer proid;
    /**
     * 送货地址
     * @return
     */
    private String proadress;
    /**
     * 分站id
     * @return
     */
    private Integer subId;
    private String subName;
    /**
     * 订单购买数量
     * @return
     */
    private Integer buynum;
    private Integer proprice;

    private String idcard;

    private String tel;

    private String address;

    private String email;

    private String code;

    private String district;    
    private String name;
	public Integer getOrdid() {
		return ordid;
	}
	public void setOrdid(Integer ordid) {
		this.ordid = ordid;
	}
	
	public Integer getDoTaskId() {
		return doTaskId;
	}
	public void setDoTaskId(Integer doTaskId) {
		this.doTaskId = doTaskId;
	}
	public Integer getTaskId() {
		return taskId;
	}
	public void setTaskId(Integer taskId) {
		this.taskId = taskId;
	}

	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public Integer getOsid() {
		return osid;
	}
	public void setOsid(Integer osid) {
		this.osid = osid;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public Integer getProid() {
		return proid;
	}
	public void setProid(Integer proid) {
		this.proid = proid;
	}
	public String getProadress() {
		return proadress;
	}
	public void setProadress(String proadress) {
		this.proadress = proadress;
	}

	public Integer getSubId() {
		return subId;
	}
	public void setSubId(Integer subId) {
		this.subId = subId;
	}
	public String getSubName() {
		return subName;
	}
	public void setSubName(String subName) {
		this.subName = subName;
	}
	public Integer getBuynum() {
		return buynum;
	}
	public void setBuynum(Integer buynum) {
		this.buynum = buynum;
	}
	public Integer getProprice() {
		return proprice;
	}
	public void setProprice(Integer proprice) {
		this.proprice = proprice;
	}

	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOsname() {
		return osname;
	}
	public void setOsname(String osname) {
		this.osname = osname;
	}
    
}
