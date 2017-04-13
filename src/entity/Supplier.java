package entity;

/**
 * @author 小峰
 * @ClassName:Supplier.java 供应商
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 公司名称
 * @date 2016年12月14日上午1:30:11
 */
public class Supplier {
    private Integer supid;

    private String supname;

    public Integer getSupid() {
        return supid;
    }

    public void setSupid(Integer supid) {
        this.supid = supid;
    }

    public String getSupname() {
        return supname;
    }

    public void setSupname(String supname) {
        this.supname = supname == null ? null : supname.trim();
    }

    
}