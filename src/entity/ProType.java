package entity;

public class ProType {
    private Integer ptid;

    private String pttype;

    private String ptunit;

    private String ptmodel;

    public Integer getPtid() {
        return ptid;
    }

    public void setPtid(Integer ptid) {
        this.ptid = ptid;
    }

    public String getPttype() {
        return pttype;
    }

    public void setPttype(String pttype) {
        this.pttype = pttype == null ? null : pttype.trim();
    }

    public String getPtunit() {
        return ptunit;
    }

    public void setPtunit(String ptunit) {
        this.ptunit = ptunit == null ? null : ptunit.trim();
    }

    public String getPtmodel() {
        return ptmodel;
    }

    public void setPtmodel(String ptmodel) {
        this.ptmodel = ptmodel == null ? null : ptmodel.trim();
    }
}