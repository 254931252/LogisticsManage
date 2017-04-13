package entity;

public class BuyList {
    private Integer blid;

    private String bldate;

    public Integer getBlid() {
        return blid;
    }

    public void setBlid(Integer blid) {
        this.blid = blid;
    }

    public String getBldate() {
        return bldate;
    }

    public void setBldate(String bldate) {
        this.bldate = bldate == null ? null : bldate.trim();
    }
}