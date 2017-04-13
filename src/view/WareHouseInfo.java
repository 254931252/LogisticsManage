package view;

public class WareHouseInfo {
	
	private int whId;
	
	private String whName;
	
	private String userName;
	
	private String whAddress;
	
	private String whLevel;

	public String getWhLevel() {
		return whLevel;
	}

	private void setWhLevel(String whLevel) {
		this.whLevel = whLevel;
	}

	public int getWhId() {
		return whId;
	}

	public void setWhId(int whId) {
		this.whId = whId;
		String whLevel = "分站库房";
		if(whId == 1){
			whLevel = "中心库房";
		}
		setWhLevel(whLevel);
	}

	public String getWhName() {
		return whName;
	}

	public void setWhName(String whName) {
		this.whName = whName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getWhAddress() {
		return whAddress;
	}

	public void setWhAddress(String whAddress) {
		this.whAddress = whAddress;
	}

}
