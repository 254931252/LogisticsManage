package entity;

public class District {
    private Integer disid;

    private String disname;

    public Integer getDisid() {
        return disid;
    }

    public void setDisid(Integer disid) {
        this.disid = disid;
    }

    public String getDisname() {
        return disname;
    }

    public void setDisname(String disname) {
        this.disname = disname == null ? null : disname.trim();
    }
}