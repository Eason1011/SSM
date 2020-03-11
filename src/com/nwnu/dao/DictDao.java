package com.nwnu.dao;

import java.util.List;

import com.nwnu.pojo.Dict;

public interface DictDao {
	public List<Dict> dictList(String groupName);
}
