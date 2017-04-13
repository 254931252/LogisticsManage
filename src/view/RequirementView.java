package view;

public class RequirementView {
	
	private int proType;
	
	private String ptType;
	
	private String proName;
	
	private int buyNum;
	
	private String createDate;

	public int getProType() {
		return proType;
	}

	public void setProType(int proType) {
		this.proType = proType;
	}

	public String getPtType() {
		return ptType;
	}

	public void setPtType(String ptType) {
		this.ptType = ptType;
	}

	public String getProName() {
		return proName;
	}

	public int getBuyNum() {
		return buyNum;
	}

	public void setBuyNum(int buyNum) {
		this.buyNum = buyNum;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

}
