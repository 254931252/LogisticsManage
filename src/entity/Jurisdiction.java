package entity;

/**
 * @author 小峰
 * @ClassName:Jurisdiction.java 角色
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 公司名称
 * @date 2016年12月15日下午7:54:34
 */
public class Jurisdiction {
    private Integer juriid;

    private String jurName;

    public Integer getJuriid() {
        return juriid;
    }

    public void setJuriid(Integer juriid) {
        this.juriid = juriid;
    }

    public String getJurName() {
        return jurName;
    }

    public void setJurName(String jurName) {
        this.jurName = jurName == null ? null : jurName.trim();
    }
}