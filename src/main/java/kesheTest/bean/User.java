package kesheTest.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.sql.Date;
@Data
public class User implements Serializable {
    private static final long serialVersionUID = 13625734523L;
    //人员id
    private int id;
    //姓名
    private String name;
    //年龄
    private int age;
    //性别
    private char sex;
    //创建时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    //手机号
    private String phone;
    //密码
    private String password;
    //是否可用
    private int status;

    //图片名称
    private String img;

    private int role;

    public User() {
    }

    public User(int id, String name, int age, char sex, Date createTime, String phone, String password, int status, String img, int role) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.sex = sex;
        this.createTime = createTime;
        this.phone = phone;
        this.password = password;
        this.status = status;
        this.img = img;
        this.role = role;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public char getSex() {
        return sex;
    }

    public void setSex(char sex) {
        this.sex = sex;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", age=" + age +
                ", sex=" + sex +
                ", createTime=" + createTime +
                ", phone='" + phone + '\'' +
                ", password='" + password + '\'' +
                ", status=" + status +
                ", img='" + img + '\'' +
                ", role=" + role +
                '}';
    }
}
