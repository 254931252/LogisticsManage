package entity;

public class Tasks {
    private Integer taskId;

    private Integer subId;

    private Integer ordId;

    private Integer senId;
    private Integer dotaskId;

    public Integer getDotaskId() {
		return dotaskId;
	}

	public void setDotaskId(Integer dotaskId) {
		this.dotaskId = dotaskId;
	}


	public Integer getTaskId() {
        return taskId;
    }

    public void setTaskId(Integer taskId) {
        this.taskId = taskId;
    }

    public Integer getSubId() {
        return subId;
    }

    public void setSubId(Integer subId) {
        this.subId = subId;
    }

    public Integer getOrdId() {
        return ordId;
    }

    public void setOrdId(Integer ordId) {
        this.ordId = ordId;
    }

    public Integer getSenId() {
        return senId;
    }

    public void setSenId(Integer senId) {
        this.senId = senId;
    }
}