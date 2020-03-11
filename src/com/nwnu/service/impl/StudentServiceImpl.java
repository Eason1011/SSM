package com.nwnu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.nwnu.common.utils.Page;
import com.nwnu.dao.StudentDao;
import com.nwnu.pojo.Student;
import com.nwnu.service.StudentService;

@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	private StudentDao studentDao ;
	
	@Override
	public Page<Student> findStudentList(Student student,Integer page,Integer rows) {
		Page<Student> result = new Page<Student>();
		student.setStart((page-1)*rows);
		student.setRows(rows);
		result.setRows(this.studentDao.selectStudentList(student));
		
		result.setTotal(this.studentDao.selectStudentListCount(student));
		result.setPage(page);
		result.setSize(rows);
		// TODO Auto-generated method stub
		return result;
	}

	@Override
	public Integer insertStudent(Student student) {
		// TODO Auto-generated method stub
		return this.studentDao.insertStudent(student);
	}

	@Override
	public Integer updateStudent(Student student) {
		// TODO Auto-generated method stub
		return this.studentDao.updateStudent(student);
	}

	@Override
	public Integer deleteStudent(Integer id) {
		// TODO Auto-generated method stub
		return this.studentDao.deleteStudent(id);
	}

	@Override
	public Student getStudentById(Integer id) {
		// TODO Auto-generated method stub
		return this.studentDao.getStudentById(id);
	}

}
