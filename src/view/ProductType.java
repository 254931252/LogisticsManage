package view;

public class ProductType {

	private int proid;//商品id
	private int ordid;//订单号
	private String osname;//状态
	private String proname;//商品名称
	private int proprice;//出售价格
	private String proinfo;//备注信息
	private String punit;//计量单位
	private String pttype;//商品类型
	private int buynum;//购买数量
	private String cost;//总额
	private String proadress;//发货地址
	private String pmodel;//商品说明	
	private String name;//客户名	
	private String userid;
	private String sub_name;//分站地址
	private String code;//邮编
	private String workspace;//收货地址(工作单位)
	private String tel;//电话号码
	
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getOrdid() {
		return ordid;
	}
	public void setOrdid(int ordid) {
		this.ordid = ordid;
	}
	public String getOsname() {
		return osname;
	}
	public void setOsname(String osname) {
		this.osname = osname;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSub_name() {
		return sub_name;
	}
	public void setSub_name(String sub_name) {
		this.sub_name = sub_name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getWorkspace() {
		return workspace;
	}
	public void setWorkspace(String workspace) {
		this.workspace = workspace;
	}
	public String getProadress() {
		return proadress;
	}
	public void setProadress(String proadress) {
		this.proadress = proadress;
	}
	public String getPmodel() {
		return pmodel;
	}
	public void setPmodel(String pmodel) {
		this.pmodel = pmodel;
	}
	public String getCost() {
		return cost;
	}
	public void setCost(String cost) {
		this.cost = cost;
	}
	public int getBuynum() {
		return buynum;
	}
	public void setBuynum(int buynum) {
		this.buynum = buynum;
	}
	public int getProid() {
		return proid;
	}
	public void setProid(int proid) {
		this.proid = proid;
	}
	public String getProname() {
		return proname;
	}
	public void setProname(String proname) {
		this.proname = proname;
	}
	public int getProprice() {
		return proprice;
	}
	public void setProprice(int proprice) {
		this.proprice = proprice;
	}
	public String getProinfo() {
		return proinfo;
	}
	public void setProinfo(String proinfo) {
		this.proinfo = proinfo;
	}
	public String getPunit() {
		return punit;
	}
	public void setPunit(String punit) {
		this.punit = punit;
	}
	public String getPttype() {
		return pttype;
	}
	public void setPttype(String pttype) {
		this.pttype = pttype;
	}


}
