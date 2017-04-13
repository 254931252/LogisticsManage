package entity;

public class Inventory {
    private Integer invid;

    private Integer proid;

    private Integer proamount;

    private Integer surplus;

    public Integer getInvid() {
        return invid;
    }

    public void setInvid(Integer invid) {
        this.invid = invid;
    }

    public Integer getProid() {
        return proid;
    }

    public void setProid(Integer proid) {
        this.proid = proid;
    }

    public Integer getProamount() {
        return proamount;
    }

    public void setProamount(Integer proamount) {
        this.proamount = proamount;
    }

	public Integer getSurplus() {
		return surplus;
	}

	public void setSurplus(Integer surplus) {
		this.surplus = surplus;
	}
}