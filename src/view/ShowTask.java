/**
 * 
 */
package view;

/**
 * @author Junhua
 * @ClassName:ShowTask.java
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 公司名称
 * @date 2016年12月13日下午1:58:03
 */
public class ShowTask {
	 private Integer taskId;//任务单ID
	 private Integer ordId;//订单ID
	 private Integer subId;//分站ID
	 private Integer userId;//客户ID
	 private String createDate;//订单产生时间
	 private String osname;//订单状态
	 private String subName;//分站名称
	 private String name;//客户
	 private String idcard;//客户身份证号
	 private String tel;//客户联系电话
	 private String address;//投递地址
	 private String email;//邮箱
	 private String code;//邮编
	 private String district;//投递区域
	 private Integer doTaskId;
	 
	 
	public Integer getSubId() {
		return subId;
	}
	public void setSubId(Integer subId) {
		this.subId = subId;
	}

	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getTaskId() {
		return taskId;
	}
	public void setTaskId(Integer taskId) {
		this.taskId = taskId;
	}
	public Integer getOrdId() {
		return ordId;
	}
	public void setOrdId(Integer ordId) {
		this.ordId = ordId;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getOsname() {
		return osname;
	}
	public void setOsname(String osname) {
		this.osname = osname;
	}
	public String getSubName() {
		return subName;
	}
	public void setSubName(String subName) {
		this.subName = subName;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public Integer getDoTaskId() {
		return doTaskId;
	}
	public void setDoTaskId(Integer doTaskId) {
		this.doTaskId = doTaskId;
	}

	 
}
