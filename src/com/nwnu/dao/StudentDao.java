package com.nwnu.dao;

import java.util.List;

import com.nwnu.pojo.Student;

/**
 * 学生管理
 * 
 * 
 * 
 * */
public interface StudentDao {
	public List<Student> selectStudentList(Student student);
	public Integer selectStudentListCount(Student student);
	public Integer insertStudent(Student student);
	public Integer updateStudent(Student student);
	public Integer deleteStudent(Integer id);
	public Student getStudentById(Integer id);
}
