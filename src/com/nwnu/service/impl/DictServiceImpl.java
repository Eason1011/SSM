package com.nwnu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nwnu.dao.DictDao;
import com.nwnu.pojo.Dict;
import com.nwnu.service.DictService;

@Service
public class DictServiceImpl implements DictService {
	
	@Autowired
	private DictDao dictDao;

	@Override
	public List<Dict> dictList(String groupName) {
		
		return dictDao.dictList(groupName);
		
	}
	
}
