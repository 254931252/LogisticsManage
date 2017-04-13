package entity;

public class OowList {
    private Integer olid;

    private String oldate;

    private Integer whid;

    public Integer getOlid() {
        return olid;
    }

    public void setOlid(Integer olid) {
        this.olid = olid;
    }

    public String getOldate() {
        return oldate;
    }

    public void setOldate(String oldate) {
        this.oldate = oldate == null ? null : oldate.trim();
    }

    public Integer getWhid() {
        return whid;
    }

    public void setWhid(Integer whid) {
        this.whid = whid;
    }
}