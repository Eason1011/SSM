package com.nwnu.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.nwnu.common.utils.BasePojo;
import com.nwnu.utils.ExcelTitle;

public class Student extends BasePojo {
	
	private Integer clazzId;
	@ExcelTitle(title = "学院")
	private String clazzName;
	@ExcelTitle(title = "学院负责老师")
	private String clazzTeacher;
	@ExcelTitle(title = "学院电话")
	private Integer clazzPhone;
	@ExcelTitle(title = "学号")
	private String code;
	@ExcelTitle(title = "姓名")
	private String name;
	@ExcelTitle(title = "是否今天返校")
	private String sex;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birthday;
	@ExcelTitle(title = "体温是否正常")
	private String nation;
	@ExcelTitle(title = "上报时间")
	private Date createDate;
	private String createName;
	
	
	@Override
    public String toString() {
        return "Student{" +
                "学院=" + clazzName +
                ", 学号=" + code +
                ", 姓名=" + name +
                ", 是否今天返校=" + sex +
                ", 体温是否正常=" + nation +
                ", 上报日期=" + createDate +
                ", 学院负责老师=" + clazzTeacher +
                ", 学院电话=" + clazzPhone +
                '}';
    }
	
	public Integer getClazzId() {
		return clazzId;
	}
	public void setClazzId(Integer clazzId) {
		this.clazzId = clazzId;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getCreateName() {
		return createName;
	}
	public void setCreateName(String createName) {
		this.createName = createName;
	}
	public String getClazzName() {
		return clazzName;
	}
	public void setClazzName(String clazzName) {
		this.clazzName = clazzName;
	}
	public String getclazzTeacher() {
		return clazzTeacher;
	}
	public void setclazzTeacher(String clazzTeacher) {
		this.clazzTeacher = clazzTeacher;
	}
	public Integer getclazzPhone() {
		return clazzPhone;
	}
	public void setclazzPhone(Integer clazzPhone) {
		this.clazzPhone = clazzPhone;
	}
	
	
	
}
