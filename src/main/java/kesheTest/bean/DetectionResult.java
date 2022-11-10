package kesheTest.bean;

import org.springframework.stereotype.Component;

import java.sql.Date;

@Component
public class DetectionResult {
    //id
    private int id;
    //检测项id
    private int itemsId;
    //检测结果
    private Double value;
    //状态
    private int status;
    //检测时间
    private Date createTime;
    //检测人
    private int userId;
    //修改时间
    private Date updateTime;
    //所属地区
    private int areaId;

    public DetectionResult() {
    }

    public DetectionResult(int id, int itemsId, Double value, int status, Date createTime, int userId, Date updateTime, int areaId) {
        this.id = id;
        this.itemsId = itemsId;
        this.value = value;
        this.status = status;
        this.createTime = createTime;
        this.userId = userId;
        this.updateTime = updateTime;
        this.areaId = areaId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getItemsId() {
        return itemsId;
    }

    public void setItemsId(int itemsId) {
        this.itemsId = itemsId;
    }

    public Double getValue() {
        return value;
    }

    public void setValue(Double value) {
        this.value = value;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public int getAreaId() {
        return areaId;
    }

    public void setAreaId(int areaId) {
        this.areaId = areaId;
    }

    @Override
    public String toString() {
        return "DetectionResult{" +
                "id=" + id +
                ", itemsId=" + itemsId +
                ", value=" + value +
                ", status=" + status +
                ", createTime=" + createTime +
                ", userId=" + userId +
                ", updateTime=" + updateTime +
                ", areaId=" + areaId +
                '}';
    }
}
