package com.nwnu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nwnu.dao.ClazzDao;
import com.nwnu.pojo.Clazz;
import com.nwnu.service.ClazzService;

@Service
public class ClazzServiceImpl implements ClazzService {

	@Autowired
	private ClazzDao clazzDao;
	@Override
	public List<Clazz> findClazzAll() {
		// TODO Auto-generated method stub
		return clazzDao.selectClazzAll();
	}

}
