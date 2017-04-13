package entity;

import java.io.Serializable;

@SuppressWarnings("serial")
public class BuyPro implements Serializable{
    private Integer bpid;

    private Integer proid;

    private Integer proamount;

    private Integer blid;

    private String bpstate;
    
    private String flag;

    public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
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

    public Integer getProamount() {
        return proamount;
    }

    public void setProamount(Integer proamount) {
        this.proamount = proamount;
    }

    public Integer getBlid() {
        return blid;
    }

    public void setBlid(Integer blid) {
        this.blid = blid;
    }

    public String getBpstate() {
        return bpstate;
    }

    public void setBpstate(String bpstate) {
        this.bpstate = bpstate == null ? null : bpstate.trim();
    }
}