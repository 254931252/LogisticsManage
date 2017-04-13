package entity;

public class Address {
    private Integer addid;

    private String addinfo;

    private Short disid;

    private Integer userid;

    public Integer getAddid() {
        return addid;
    }

    public void setAddid(Integer addid) {
        this.addid = addid;
    }

    public String getAddinfo() {
        return addinfo;
    }

    public void setAddinfo(String addinfo) {
        this.addinfo = addinfo == null ? null : addinfo.trim();
    }

    public Short getDisid() {
        return disid;
    }

    public void setDisid(Short disid) {
        this.disid = disid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }
}