package com.nwnu.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.nwnu.common.utils.BasePojo;

public class Student extends BasePojo {
	
	private Integer clazzId;
	private String clazzName;
	private String clazzTeacher;
	private Integer clazzPhone;
	private String code;
	private String name;
	private String sex;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birthday;
	private String nation;
	private Date createDate;
	private String createName;
	
	
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
