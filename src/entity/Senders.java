package entity;

import java.io.Serializable;

public class Senders implements Serializable{
    private Integer senId;

    private Integer subId;

    private String senName;

    public Integer getSenId() {
        return senId;
    }

    public void setSenId(Integer senId) {
        this.senId = senId;
    }

    public Integer getSubId() {
        return subId;
    }

    public void setSubId(Integer subId) {
        this.subId = subId;
    }

    public String getSenName() {
        return senName;
    }

    public void setSenName(String senName) {
        this.senName = senName == null ? null : senName.trim();
    }
}