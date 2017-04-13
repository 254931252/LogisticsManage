package entity;

public class EnterList {
    private Integer elid;

    private String eldate;

    private Integer olid;

    public Integer getElid() {
        return elid;
    }

    public void setElid(Integer elid) {
        this.elid = elid;
    }

    public String getEldate() {
        return eldate;
    }

    public void setEldate(String eldate) {
        this.eldate = eldate == null ? null : eldate.trim();
    }

    public Integer getOlid() {
        return olid;
    }

    public void setOlid(Integer olid) {
        this.olid = olid;
    }
}