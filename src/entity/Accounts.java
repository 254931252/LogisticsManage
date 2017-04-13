package entity;

public class Accounts {
    private Integer accid;

    private String accstyle;

    private Integer ordid;

    private Integer blid;

    private Integer accmoney;

    private String accdate;

    public Integer getAccid() {
        return accid;
    }

    public void setAccid(Integer accid) {
        this.accid = accid;
    }

    public String getAccstyle() {
        return accstyle;
    }

    public void setAccstyle(String accstyle) {
        this.accstyle = accstyle == null ? null : accstyle.trim();
    }

    public Integer getOrdid() {
        return ordid;
    }

    public void setOrdid(Integer ordid) {
        this.ordid = ordid;
    }

    public Integer getBlid() {
        return blid;
    }

    public void setBlid(Integer blid) {
        this.blid = blid;
    }

    public Integer getAccmoney() {
        return accmoney;
    }

    public void setAccmoney(Integer accmoney) {
        this.accmoney = accmoney;
    }

    public String getAccdate() {
        return accdate;
    }

    public void setAccdate(String accdate) {
        this.accdate = accdate == null ? null : accdate.trim();
    }
}