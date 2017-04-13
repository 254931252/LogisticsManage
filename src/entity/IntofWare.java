package entity;

public class IntofWare {
    private Integer itwid;

    private Integer proid;

    private Integer proamount;

    private Integer whid;

    private String itwdate;

    public Integer getItwid() {
        return itwid;
    }

    public void setItwid(Integer itwid) {
        this.itwid = itwid;
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

    public Integer getWhid() {
        return whid;
    }

    public void setWhid(Integer whid) {
        this.whid = whid;
    }

    public String getItwdate() {
        return itwdate;
    }

    public void setItwdate(String itwdate) {
        this.itwdate = itwdate == null ? null : itwdate.trim();
    }
}