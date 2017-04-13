package entity;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Product implements Serializable{
    private Integer proid;

    private String proname;

    private Integer proprice;
    
    private	Integer costprice;//进货成本

    private String proinfo;

    private Integer protype;

    private Integer supid; //供应商id

    private String punit;

    private String pmodel;

    public Integer getProid() {
        return proid;
    }

    public void setProid(Integer proid) {
        this.proid = proid;
    }

    public String getProname() {
        return proname;
    }

    public void setProname(String proname) {
        this.proname = proname == null ? null : proname.trim();
    }

    public Integer getProprice() {
        return proprice;
    }

    public void setProprice(Integer proprice) {
        this.proprice = proprice;
    }

    public String getProinfo() {
        return proinfo;
    }

    public void setProinfo(String proinfo) {
        this.proinfo = proinfo == null ? null : proinfo.trim();
    }

    public Integer getProtype() {
        return protype;
    }

    public void setProtype(Integer protype) {
        this.protype = protype;
    }

    public Integer getCostprice() {
		return costprice;
	}

	public void setCostprice(Integer costprice) {
		this.costprice = costprice;
	}

	public Integer getSupid() {
		return supid;
	}

	public void setSupid(Integer supid) {
		this.supid = supid;
	}

	public String getPunit() {
        return punit;
    }

    public void setPunit(String punit) {
        this.punit = punit == null ? null : punit.trim();
    }

    public String getPmodel() {
        return pmodel;
    }

    public void setPmodel(String pmodel) {
        this.pmodel = pmodel == null ? null : pmodel.trim();
    }
}