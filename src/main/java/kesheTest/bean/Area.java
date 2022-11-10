package kesheTest.bean;

import org.springframework.stereotype.Component;

import java.sql.Date;

@Component
public class Area {
    private int id;
    private int areaId;
    private String name;
    private Date createTime;
    private Date updateTime;

    public Area() {
    }

    public Area(int id, int areaId, String name, Date createTime, Date updateTime) {
        this.id = id;
        this.areaId = areaId;
        this.name = name;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAreaId() {
        return areaId;
    }

    public void setAreaId(int areaId) {
        this.areaId = areaId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    public String toString() {
        return "Area{" +
                "id=" + id +
                ", areaId=" + areaId +
                ", name='" + name + '\'' +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                '}';
    }
}
