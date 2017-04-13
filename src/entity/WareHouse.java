package entity;

public class WareHouse {
    private Integer whid;

    private String whname;

    private Integer disid;

    private Integer userid;

    private String whaddress;

    public Integer getWhid() {
        return whid;
    }

    public void setWhid(Integer whid) {
        this.whid = whid;
    }

    public String getWhname() {
        return whname;
    }

    public void setWhname(String whname) {
        this.whname = whname == null ? null : whname.trim();
    }

    public Integer getDisid() {
        return disid;
    }

    public void setDisid(Integer disid) {
        this.disid = disid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getWhaddress() {
        return whaddress;
    }

    public void setWhaddress(String whaddress) {
        this.whaddress = whaddress == null ? null : whaddress.trim();
    }
}