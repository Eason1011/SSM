package com.nwnu.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nwnu.pojo.Clazz;
import com.nwnu.pojo.Dict;
import com.nwnu.pojo.Student;
import com.nwnu.pojo.User;
import com.nwnu.service.ClazzService;
import com.nwnu.service.DictService;
import com.nwnu.service.StudentService;

@Controller
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	@Autowired
	private DictService dictService;
	@Autowired
	private ClazzService clazzService;

	@RequestMapping("/student")
	public String findAllStudent(Student student,Model model,HttpSession session,@RequestParam(defaultValue = "1")Integer page,@RequestParam(defaultValue = "8")Integer rows){
		model.addAttribute("user",session.getAttribute("USER_SESSION"));
		
		//List<Student> studentList = studentService.findAllStudent(student);
		//model.addAttribute("studentList",studentList);
		model.addAttribute("page",studentService.findStudentList(student, page, rows));
		
		
		//性别字典
		List<Dict> sexList = dictService.dictList("sex");
		model.addAttribute("sexList", sexList);
		//民族字典
		List<Dict> nationList = dictService.dictList("nation");
		model.addAttribute("nationList", nationList);
		
		//查找班级
		List<Clazz> clazzList=clazzService.findClazzAll();
		model.addAttribute("clazzList", clazzList);	
		model.addAttribute("student", student);
		return "student";
	}
	
	
	@RequestMapping("/insertStudent")
	@ResponseBody    //锟街凤拷锟斤拷直锟接凤拷锟截碉拷锟斤拷锟斤拷锟�
	public String insertStudent(Student student,HttpSession session){
		Integer rows;
		if(StringUtils.isEmpty(student.getId())){
			User user=(User) session.getAttribute("USER_SESSION");
			student.setCreateDate(new Date());
			student.setCreateName(user.getName());
			rows = this.studentService.insertStudent(student);
		}else{
			rows = this.studentService.updateStudent(student);
		}
		
		if(rows>0){
			return "OK";
		}else{
			return "Fail";
		}
	}
	
	
	@RequestMapping(value="/getStudentById")
	@ResponseBody
	public Student getStudentById(Integer id){
		return this.studentService.getStudentById(id);
	}	
	
	
	@RequestMapping("/updateStudent")
	@ResponseBody    //锟街凤拷锟斤拷直锟接凤拷锟截碉拷锟斤拷锟斤拷锟�
	public String updateStudent(Student student){
		Integer rows = this.studentService.updateStudent(student);
		if (rows>0) {
			return "OK";
		}else {
			return "Fail";
		}
	}
	
	
	@RequestMapping("/deleteStudent")
	@ResponseBody    //锟街凤拷锟斤拷直锟接凤拷锟截碉拷锟斤拷锟斤拷锟�
	public String deleteStudent(Integer id){
		Integer rows = this.studentService.deleteStudent(id);
		if (rows>0) {
			return "OK";
		}else {
			return "Fail";
		}
	}
}
