package entity;

/**
 * 订单表
 * @author Administrator
 *
 */
public class Orders {
	/**
	 * 订单号
	 */
    private Integer ordid;
    /**
     * 所属用户
     */
    private Integer userid;
    /**
     * 订单状态
     */
    private Integer osid;
    /**
     * 订单生成日期
     */
    private String createdate;
    /**
     * 货物id
     * @return
     */
    private Integer proid;
    /**
     * 送货地址
     * @return
     */
    private String proadress;
    /**
     * 分站id
     * @return
     */
    private Integer sub_id;
    /**
     * 订单购买数量
     * @return
     */
    private Integer buynum;

    public Integer getBuynum() {
		return buynum;
	}

	public void setBuynum(Integer buynum) {
		this.buynum = buynum;
	}

	public Integer getOrdid() {
        return ordid;
    }

    public void setOrdid(Integer ordid) {
        this.ordid = ordid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public int getOsid() {
        return osid;
    }

    public void setOsid(Integer osid) {
        this.osid = osid;
    }

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}

	public int getProid() {
		return proid;
	}

	public void setProid(Integer proid) {
		this.proid = proid;
	}

	public String getProadress() {
		return proadress;
	}

	public void setProadress(String proadress) {
		this.proadress = proadress;
	}

	public int getSub_id() {
		return sub_id;
	}

	public void setSub_id(Integer sub_id) {
		this.sub_id = sub_id;
	}

	

}