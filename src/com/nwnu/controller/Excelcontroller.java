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
	
//	����
    @RequestMapping(value = "/importCustomerList",method = RequestMethod.POST, produces = "text/html;charset=UTF-8;")
    @ResponseBody
    public String importCustomerList(@RequestParam("file") MultipartFile file, HttpSession session,HttpServletRequest request) {
        String statis="02";//����ʧ��
        try {
            if (file == null || file.getSize() == 0 || !file.getOriginalFilename().contains(".xls")) {
                return "�ļ���Ч";
            }
            //�����Լ������ʵ�������list�ķ���
            List<Student> list = new ExcelPoi<Student>().importObjectList(file.getInputStream(), file.getOriginalFilename(), Student.class);
            //User�����滻�����ʵ����
            //list���ǻ�ȡ������
            studentService.insertSelective(list);//�������
            //Iterator<Student> iterator=list.iterator();
            //while (iterator.hasNext())
            //{
            	//Student student=(Student)iterator.next();
                //������������ӷ����ж�Ҫ����������Ƿ����Ҫ��
            	
                //}
        } catch (Exception e) {
            //log.error(e);
            e.printStackTrace();
        }
        return statis;
    }
    
    
//    ����
    @RequestMapping(value = "/exportStudentAllList", produces = "text/html;charset=UTF-8;")
    @ResponseBody
    public String exportCustomerList(HttpServletResponse response, String search) {
        try {
            List<Student> date = studentService.getStudentList();
            //customService.getCustomList();
            String[] titles = { "ѧԺ", "ѧ��", "����", "�Ƿ���췵У","�����Ƿ�����","�ϱ�����","ѧԺ������ʦ","ѧԺ�绰"};
            String filename = "Ա����";
            ExcelPoi.exportObject(response, date, titles, filename);
        } catch (Exception e) {
            //log.error(e);
        }
        return "";
    }


}
