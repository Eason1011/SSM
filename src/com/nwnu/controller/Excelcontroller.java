package com.nwnu.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.nwnu.pojo.Student;
import com.nwnu.service.ClazzService;
import com.nwnu.service.DictService;
import com.nwnu.service.StudentService;
import com.nwnu.service.UserService;
import com.nwnu.utils.ExcelPoi;

public class Excelcontroller {

	
	@Autowired
	private StudentService studentService;
	@Autowired
	private DictService dictService;
	@Autowired
	private ClazzService clazzService;
	@Autowired
	private UserService userService;
	
//	导入
    @RequestMapping(value = "/importCustomerList",method = RequestMethod.POST, produces = "text/html;charset=UTF-8;")
    @ResponseBody
    public String importCustomerList(@RequestParam("file") MultipartFile file, HttpSession session,HttpServletRequest request) {
        String statis="02";//导入失败
        try {
            if (file == null || file.getSize() == 0 || !file.getOriginalFilename().contains(".xls")) {
                return "文件无效";
            }
            //根据自己定义的实体类更换list的泛型
            List<Student> list = new ExcelPoi<Student>().importObjectList(file.getInputStream(), file.getOriginalFilename(), Student.class);
            //User可以替换成你的实体类
            //list就是获取的数据
            studentService.insertSelective(list);//插入语句
            //Iterator<Student> iterator=list.iterator();
            //while (iterator.hasNext())
            //{
            	//Student student=(Student)iterator.next();
                //可以在这里添加方法判断要导入的数据是否符合要求
            	
                //}
        } catch (Exception e) {
            //log.error(e);
            e.printStackTrace();
        }
        return statis;
    }
    
    
//    导出
    @RequestMapping(value = "/exportStudentAllList", produces = "text/html;charset=UTF-8;")
    @ResponseBody
    public String exportCustomerList(HttpServletResponse response, String search) {
        try {
            List<Student> date = studentService.getStudentList();
            //customService.getCustomList();
            String[] titles = { "学院", "学号", "姓名", "是否今天返校","体温是否正常","上报日期","学院负责老师","学院电话"};
            String filename = "员工表";
            ExcelPoi.exportObject(response, date, titles, filename);
        } catch (Exception e) {
            //log.error(e);
        }
        return "";
    }


}
