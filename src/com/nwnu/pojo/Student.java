package com.nwnu.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.nwnu.common.utils.BasePojo;
import com.nwnu.utils.ExcelTitle;

public class Student extends BasePojo {
	
	private Integer clazzId;
	@ExcelTitle(title = "ѧԺ")
	private String clazzName;
	@ExcelTitle(title = "ѧԺ������ʦ")
	private String clazzTeacher;
	@ExcelTitle(title = "ѧԺ�绰")
	private Integer clazzPhone;
	@ExcelTitle(title = "ѧ��")
	private String code;
	@ExcelTitle(title = "����")
	private String name;
	@ExcelTitle(title = "�Ƿ���췵У")
	private String sex;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birthday;
	@ExcelTitle(title = "�����Ƿ�����")
	private String nation;
	@ExcelTitle(title = "�ϱ�ʱ��")
	private Date createDate;
	private String createName;
	
	
	@Override
    public String toString() {
        return "Student{" +
                "ѧԺ=" + clazzName +
                ", ѧ��=" + code +
                ", ����=" + name +
                ", �Ƿ���췵У=" + sex +
                ", �����Ƿ�����=" + nation +
                ", �ϱ�����=" + createDate +
                ", ѧԺ������ʦ=" + clazzTeacher +
                ", ѧԺ�绰=" + clazzPhone +
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
