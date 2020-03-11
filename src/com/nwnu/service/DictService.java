package com.nwnu.service;

import java.util.List;

import com.nwnu.pojo.Dict;
import com.nwnu.pojo.Student;

public interface DictService {
	public List<Dict> dictList(String groupName);
}
