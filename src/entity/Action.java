package entity;

/**
 * @author 小峰
 * @ClassName:Action.java 权限
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 公司名称
 * @date 2016年12月15日下午7:54:16
 */
public class Action {
    private Integer actId;

    private String actName;

    public Integer getActId() {
        return actId;
    }

    public void setActId(Integer actId) {
        this.actId = actId;
    }

    public String getActName() {
        return actName;
    }

    public void setActName(String actName) {
        this.actName = actName == null ? null : actName.trim();
    }
}